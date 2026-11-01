import { storage } from "./storage";
import { Attempt, ChildProfile, ModuleProgress, SkillMastery } from "../types";

type SyncKind = "profile" | "progress" | "attempts" | "mastery" | "deleted";

type ServerChild = ChildProfile & {
  progress: Record<string, ModuleProgress>;
  attempts: Attempt[];
  mastery: Record<string, SkillMastery>;
};

const SYNC_DELAY_MS = 900;

/**
 * Menjaga data anak (profil, progres modul, attempt, mastery) tetap sama
 * di semua perangkat yang login dengan akun orang tua yang sama.
 *
 * Data lokal tetap menjadi cache agar layar anak tidak perlu menunggu jaringan.
 * Setiap perubahan lokal dikirim ke D1 setelah jeda singkat; saat login, data
 * server dimuat dan menggantikan cache lokal.
 */
class CloudSyncService {
  private parentId: string | null = null;
  private dirty = new Map<string, Set<SyncKind>>();
  private knownAttemptIds = new Map<string, Set<string>>();
  private knownChildren = new Set<string>();
  private timer: ReturnType<typeof setTimeout> | null = null;
  private flushing = false;
  private flushAgain = false;
  private keepalive = false;

  constructor() {
    if (typeof window === "undefined") return;
    window.addEventListener("online", () => {
      if (this.parentId) this.schedule();
    });
    window.addEventListener("pagehide", () => {
      if (this.parentId) void this.flushNow(true);
    });
  }

  /** Muat data anak dari D1 ke cache lokal saat orang tua login. */
  async hydrate(parentId: string): Promise<void> {
    this.reset();
    this.parentId = parentId;

    let response: Response;
    try {
      response = await fetch("/api/app/data", { credentials: "same-origin" });
    } catch {
      this.queueLocalChildren(parentId);
      return;
    }
    if (!response.ok) throw new Error("Gagal memuat data anak dari server.");

    const data = (await response.json()) as { children?: ServerChild[] };
    const serverChildren = Array.isArray(data.children) ? data.children : [];

    if (serverChildren.length === 0) {
      if (storage.isCloudHydrated(parentId)) {
        // Akun sudah pernah tersinkron: server kosong berarti semua profil memang dihapus.
        storage.replaceChildrenForParent(parentId, []);
        return;
      }
      // Belum pernah tersinkron: unggah data lokal yang sudah ada.
      this.queueLocalChildren(parentId);
      return;
    }

    storage.markCloudHydrated(parentId);
    const profiles = serverChildren.map(({ progress, attempts, mastery, ...profile }) => profile);
    storage.replaceChildrenForParent(parentId, profiles as ChildProfile[]);
    for (const child of serverChildren) {
      storage.replaceModuleProgress(child.id, child.progress || {});
      storage.replaceAttempts(child.id, child.attempts || []);
      storage.replaceMastery(child.id, child.mastery || {});
      this.knownChildren.add(child.id);
      this.knownAttemptIds.set(
        child.id,
        new Set((child.attempts || []).map((attempt) => attempt.id))
      );
    }
  }

  /** Tandai data anak berubah dan jadwalkan pengiriman ke server. */
  markDirty(kind: SyncKind, childId: string): void {
    if (!this.parentId) return;
    if (kind === "deleted") this.knownAttemptIds.delete(childId);
    const kinds = this.dirty.get(childId) || new Set<SyncKind>();
    kinds.add(kind);
    this.dirty.set(childId, kinds);
    this.schedule();
  }

  /** Kirim semua perubahan tertunda sekarang juga (dipakai saat logout/keluar halaman). */
  async flushNow(keepalive = false): Promise<void> {
    if (this.timer) {
      clearTimeout(this.timer);
      this.timer = null;
    }
    this.keepalive = keepalive;
    try {
      await this.flush();
    } finally {
      this.keepalive = false;
    }
  }

  reset(): void {
    if (this.timer) clearTimeout(this.timer);
    this.timer = null;
    this.parentId = null;
    this.dirty.clear();
    this.knownAttemptIds.clear();
    this.knownChildren.clear();
    this.flushing = false;
    this.flushAgain = false;
  }

  private queueLocalChildren(parentId: string): void {
    for (const child of storage.getChildren().filter((item) => item.parentId === parentId)) {
      this.markDirty("profile", child.id);
      this.markDirty("progress", child.id);
      this.markDirty("attempts", child.id);
      this.markDirty("mastery", child.id);
    }
  }

  private schedule(): void {
    if (this.timer) clearTimeout(this.timer);
    this.timer = setTimeout(() => {
      this.timer = null;
      void this.flush();
    }, SYNC_DELAY_MS);
  }

  private async flush(): Promise<void> {
    if (!this.parentId) return;
    if (this.flushing) {
      this.flushAgain = true;
      return;
    }
    if (this.dirty.size === 0) return;

    this.flushing = true;
    const pending = this.dirty;
    this.dirty = new Map();
    const failed = new Map<string, Set<SyncKind>>();

    try {
      for (const [childId, kinds] of pending) {
        const ok = await this.pushChild(childId, kinds);
        if (!ok) failed.set(childId, kinds);
      }
    } finally {
      this.flushing = false;
    }

    for (const [childId, kinds] of failed) {
      const existing = this.dirty.get(childId) || new Set<SyncKind>();
      kinds.forEach((kind) => existing.add(kind));
      this.dirty.set(childId, existing);
    }

    if (this.flushAgain) {
      this.flushAgain = false;
      this.schedule();
    }
  }

  private async pushChild(childId: string, kinds: Set<SyncKind>): Promise<boolean> {
    if (kinds.has("deleted")) {
      try {
        const response = await this.request(
          `/api/app/children/${encodeURIComponent(childId)}`,
          { method: "DELETE" }
        );
        return response.ok || response.status === 404;
      } catch {
        return false;
      }
    }

    const needsProfile = kinds.has("profile") || !this.knownChildren.has(childId);
    if (needsProfile) {
      const child = storage.getChild(childId);
      if (!child) return true;
      if (!(await this.putChild(child))) return false;
      storage.markCloudHydrated(child.parentId);
      this.knownChildren.add(childId);
    }

    if (kinds.has("attempts")) {
      const known = this.knownAttemptIds.get(childId) || new Set<string>();
      const fresh = storage.getAttempts(childId).filter((attempt) => !known.has(attempt.id));
      if (fresh.length > 0) {
        if (!(await this.putAttempts(childId, fresh))) return false;
        fresh.forEach((attempt) => known.add(attempt.id));
        this.knownAttemptIds.set(childId, known);
      }
    }

    if (kinds.has("progress")) {
      const progress = storage.getModuleProgress(childId);
      if (!(await this.putProgress(childId, progress))) return false;
    }

    if (kinds.has("mastery")) {
      const mastery = storage.getMasteryMap(childId);
      if (!(await this.putMastery(childId, mastery))) return false;
    }

    return true;
  }

  private async putChild(child: ChildProfile): Promise<boolean> {
    try {
      const response = await this.request(`/api/app/children/${encodeURIComponent(child.id)}`, {
        method: "PUT",
        body: JSON.stringify(child),
      });
      return response.ok;
    } catch {
      return false;
    }
  }

  private async putProgress(
    childId: string,
    progress: Record<string, ModuleProgress>
  ): Promise<boolean> {
    try {
      const response = await this.request(
        `/api/app/children/${encodeURIComponent(childId)}/progress`,
        { method: "PUT", body: JSON.stringify({ progress }) }
      );
      return response.ok;
    } catch {
      return false;
    }
  }

  private async putMastery(
    childId: string,
    mastery: Record<string, SkillMastery>
  ): Promise<boolean> {
    try {
      const response = await this.request(
        `/api/app/children/${encodeURIComponent(childId)}/mastery`,
        { method: "PUT", body: JSON.stringify({ mastery }) }
      );
      return response.ok;
    } catch {
      return false;
    }
  }

  private async putAttempts(childId: string, attempts: Attempt[]): Promise<boolean> {
    try {
      const response = await this.request(
        `/api/app/children/${encodeURIComponent(childId)}/attempts`,
        { method: "POST", body: JSON.stringify({ attempts }) }
      );
      return response.ok;
    } catch {
      return false;
    }
  }

  private request(path: string, init: RequestInit): Promise<Response> {
    const headers = new Headers(init.headers);
    if (init.body) headers.set("Content-Type", "application/json");
    return fetch(path, {
      credentials: "same-origin",
      ...init,
      keepalive: this.keepalive,
      headers,
    });
  }
}

export const cloudSync = new CloudSyncService();
