import React, { FormEvent, useCallback, useEffect, useMemo, useState } from "react";
import {
  Activity,
  ArrowLeft,
  BookOpen,
  Boxes,
  Check,
  ChevronRight,
  CircleAlert,
  FileQuestion,
  FolderKanban,
  Gamepad2,
  Image,
  LayoutDashboard,
  LogOut,
  Menu,
  Pencil,
  Plus,
  Search,
  Shield,
  Trash2,
  Users,
  X,
} from "lucide-react";

type AdminView =
  | "dashboard"
  | "users"
  | "roles"
  | "categories"
  | "modules"
  | "lessons"
  | "materials"
  | "media"
  | "games"
  | "questions";

interface CmsUser {
  id: string;
  name: string;
  email: string;
  username: string;
  roleId: string;
  roleName: string;
  status: string;
  lastLogin: string | null;
  createdAt: string;
  notes?: string;
}

interface CmsRole {
  id: string;
  name: string;
  description: string;
  systemRole: number;
  userCount: number;
  permissionIds: string[];
}

interface CmsPermission {
  id: string;
  label: string;
  groupName: string;
}

interface AdminIdentity {
  id: string;
  name: string;
  email: string;
  username: string;
  roleId: string;
  roleName: string;
  permissions: string[];
}

interface Field {
  name: string;
  label: string;
  type?: "text" | "textarea" | "number" | "select" | "json" | "url" | "email" | "password" | "category" | "module" | "lesson" | "game" | "template" | "blocks";
  required?: boolean;
  options?: { value: string; label: string }[];
  defaultValue?: string | number;
  placeholder?: string;
}

interface ResourceConfig {
  title: string;
  singular: string;
  endpoint: string;
  permission: string;
  fields: Field[];
  columns: { key: string; label: string }[];
  archive?: boolean;
}

const API = "/api/cms";

const difficultyOptions = [
  { value: "beginner", label: "Pemula" },
  { value: "developing", label: "Berkembang" },
  { value: "advanced", label: "Lanjutan" },
];
const contentStatusOptions = [
  { value: "draft", label: "Draft" },
  { value: "published", label: "Terbit" },
  { value: "archived", label: "Arsip" },
];
const materialStatusOptions = [
  { value: "draft", label: "Draft" },
  { value: "review", label: "Menunggu review" },
  { value: "published", label: "Terbit" },
  { value: "archived", label: "Arsip" },
];
const questionTypeOptions = [
  { value: "multiple_choice", label: "Pilihan ganda" },
  { value: "true_false", label: "Benar / salah" },
  { value: "matching", label: "Mencocokkan" },
  { value: "fill_blank", label: "Isi bagian kosong" },
  { value: "ordering", label: "Urutan" },
  { value: "image_selection", label: "Pilih gambar" },
  { value: "audio", label: "Pertanyaan audio" },
  { value: "letter_selection", label: "Pilih huruf" },
  { value: "word_builder", label: "Susun kata" },
  { value: "number_builder", label: "Susun angka" },
  { value: "tracing", label: "Menebalkan" },
];

const NAVIGATION: { view: AdminView; label: string; icon: React.FC<{ className?: string }>; permission: string }[] = [
  { view: "dashboard", label: "Dashboard", icon: LayoutDashboard, permission: "dashboard.view" },
  { view: "users", label: "Manajemen akun", icon: Users, permission: "users.read" },
  { view: "roles", label: "Role & permission", icon: Shield, permission: "users.read" },
  { view: "categories", label: "Kategori", icon: Boxes, permission: "categories.read" },
  { view: "modules", label: "Modul", icon: BookOpen, permission: "modules.read" },
  { view: "lessons", label: "Lesson", icon: FolderKanban, permission: "lessons.read" },
  { view: "materials", label: "Materi", icon: BookOpen, permission: "materials.read" },
  { view: "media", label: "Media library", icon: Image, permission: "media.read" },
  { view: "games", label: "Game", icon: Gamepad2, permission: "games.read" },
  { view: "questions", label: "Bank soal", icon: FileQuestion, permission: "games.read" },
];

const RESOURCE_CONFIG: Partial<Record<AdminView, ResourceConfig>> = {
  categories: {
    title: "Kategori pembelajaran",
    singular: "Kategori",
    endpoint: "categories",
    permission: "categories",
    archive: true,
    fields: [
      { name: "name", label: "Nama kategori", required: true },
      { name: "description", label: "Deskripsi", type: "textarea" },
      { name: "icon", label: "Ikon (emoji)", defaultValue: "📚" },
      { name: "color", label: "Warna HEX", defaultValue: "#4DA3FF" },
      { name: "sortOrder", label: "Urutan", type: "number", defaultValue: 0 },
      { name: "status", label: "Status", type: "select", options: [{ value: "active", label: "Aktif" }, { value: "archived", label: "Arsip" }], defaultValue: "active" },
    ],
    columns: [
      { key: "icon", label: "" },
      { key: "name", label: "Kategori" },
      { key: "description", label: "Deskripsi" },
      { key: "sortOrder", label: "Urutan" },
      { key: "status", label: "Status" },
    ],
  },
  modules: {
    title: "Modul pembelajaran",
    singular: "Modul",
    endpoint: "modules",
    permission: "modules",
    fields: [
      { name: "title", label: "Judul modul", required: true },
      { name: "categoryId", label: "Kategori", type: "category", required: true },
      { name: "description", label: "Deskripsi", type: "textarea" },
      { name: "ageMin", label: "Usia minimum", type: "number", defaultValue: 2 },
      { name: "ageMax", label: "Usia maksimum", type: "number", defaultValue: 12 },
      { name: "difficulty", label: "Kesulitan", type: "select", options: difficultyOptions, defaultValue: "beginner" },
      { name: "durationMinutes", label: "Durasi (menit)", type: "number", defaultValue: 10 },
      { name: "objectives", label: "Tujuan pembelajaran (satu per baris)", type: "textarea" },
      { name: "skills", label: "Kompetensi (satu per baris)", type: "textarea" },
      { name: "prerequisites", label: "Prasyarat (ID modul, satu per baris)", type: "textarea" },
      { name: "status", label: "Status", type: "select", options: contentStatusOptions, defaultValue: "draft" },
    ],
    columns: [
      { key: "title", label: "Modul" },
      { key: "categoryId", label: "Kategori" },
      { key: "ageMin", label: "Usia" },
      { key: "difficulty", label: "Kesulitan" },
      { key: "status", label: "Status" },
    ],
  },
  lessons: {
    title: "Lesson",
    singular: "Lesson",
    endpoint: "lessons",
    permission: "lessons",
    fields: [
      { name: "title", label: "Judul lesson", required: true },
      { name: "moduleId", label: "Modul induk", type: "module", required: true },
      { name: "durationMinutes", label: "Durasi (menit)", type: "number", defaultValue: 5 },
      { name: "sortOrder", label: "Urutan", type: "number", defaultValue: 0 },
      { name: "content", label: "Konten lesson", type: "blocks" },
      { name: "status", label: "Status", type: "select", options: contentStatusOptions, defaultValue: "draft" },
    ],
    columns: [
      { key: "title", label: "Lesson" },
      { key: "moduleId", label: "Modul" },
      { key: "durationMinutes", label: "Durasi" },
      { key: "status", label: "Status" },
    ],
  },
  materials: {
    title: "Materi pembelajaran",
    singular: "Materi",
    endpoint: "materials",
    permission: "materials",
    fields: [
      { name: "title", label: "Judul materi", required: true },
      { name: "slug", label: "Slug URL", required: true, placeholder: "mengenal-huruf-a" },
      { name: "categoryId", label: "Kategori", type: "category", required: true },
      { name: "lessonId", label: "Lesson (opsional)", type: "lesson" },
      { name: "summary", label: "Deskripsi singkat", type: "textarea" },
      { name: "thumbnailUrl", label: "URL thumbnail HTTPS", type: "url" },
      { name: "coverUrl", label: "URL cover HTTPS", type: "url" },
      { name: "ageMin", label: "Usia minimum", type: "number", defaultValue: 2 },
      { name: "ageMax", label: "Usia maksimum", type: "number", defaultValue: 12 },
      { name: "difficulty", label: "Kesulitan", type: "select", options: difficultyOptions, defaultValue: "beginner" },
      { name: "objectives", label: "Tujuan pembelajaran (satu per baris)", type: "textarea" },
      { name: "skills", label: "Kompetensi (satu per baris)", type: "textarea" },
      { name: "content", label: "Susun konten materi", type: "blocks" },
      { name: "status", label: "Status", type: "select", options: materialStatusOptions, defaultValue: "draft" },
    ],
    columns: [
      { key: "title", label: "Materi" },
      { key: "categoryId", label: "Kategori" },
      { key: "ageMin", label: "Usia" },
      { key: "status", label: "Status" },
    ],
  },
  media: {
    title: "Media library",
    singular: "Media",
    endpoint: "media",
    permission: "media",
    fields: [
      { name: "filename", label: "Nama media", required: true },
      { name: "mediaType", label: "Tipe", type: "select", options: [{ value: "image", label: "Gambar" }, { value: "audio", label: "Audio" }, { value: "video", label: "Video" }, { value: "document", label: "Dokumen" }], defaultValue: "image" },
      { name: "url", label: "URL media HTTPS", type: "url", required: true },
      { name: "sizeBytes", label: "Ukuran (byte)", type: "number", defaultValue: 0 },
      { name: "altText", label: "Alt text", type: "textarea" },
    ],
    columns: [
      { key: "filename", label: "Nama" },
      { key: "mediaType", label: "Tipe" },
      { key: "url", label: "URL" },
      { key: "altText", label: "Alt text" },
    ],
  },
  games: {
    title: "Game",
    singular: "Game",
    endpoint: "games",
    permission: "games",
    fields: [
      { name: "title", label: "Nama game", required: true },
      { name: "description", label: "Deskripsi", type: "textarea" },
      { name: "categoryId", label: "Kategori", type: "category", required: true },
      { name: "templateId", label: "Template game", type: "template" },
      { name: "gameType", label: "Jenis game", required: true, placeholder: "word-builder" },
      { name: "ageMin", label: "Usia minimum", type: "number", defaultValue: 2 },
      { name: "ageMax", label: "Usia maksimum", type: "number", defaultValue: 12 },
      { name: "difficulty", label: "Kesulitan", type: "select", options: difficultyOptions, defaultValue: "beginner" },
      { name: "durationMinutes", label: "Durasi (menit)", type: "number", defaultValue: 5 },
      { name: "skills", label: "Kompetensi (satu per baris)", type: "textarea" },
      { name: "configuration", label: "Konfigurasi permainan", type: "json", placeholder: "{\"items\":[]}" },
      { name: "rewardStars", label: "Reward bintang", type: "number", defaultValue: 1 },
      { name: "status", label: "Status", type: "select", options: contentStatusOptions, defaultValue: "draft" },
    ],
    columns: [
      { key: "title", label: "Game" },
      { key: "gameType", label: "Jenis" },
      { key: "categoryId", label: "Kategori" },
      { key: "difficulty", label: "Kesulitan" },
      { key: "status", label: "Status" },
    ],
  },
  questions: {
    title: "Bank soal",
    singular: "Soal",
    endpoint: "questions",
    permission: "games",
    fields: [
      { name: "prompt", label: "Pertanyaan", type: "textarea", required: true },
      { name: "categoryId", label: "Kategori", type: "category", required: true },
      { name: "gameId", label: "Game (opsional)", type: "game" },
      { name: "questionType", label: "Jenis soal", type: "select", options: questionTypeOptions, defaultValue: "multiple_choice" },
      { name: "options", label: "Pilihan jawaban (JSON list)", type: "json", placeholder: "[{\"text\":\"A\",\"correct\":true}]" },
      { name: "answer", label: "Jawaban benar (JSON)", type: "json", placeholder: "{\"value\":\"A\"}" },
      { name: "hint", label: "Petunjuk", type: "textarea" },
      { name: "explanation", label: "Penjelasan jawaban", type: "textarea" },
      { name: "ageMin", label: "Usia minimum", type: "number", defaultValue: 2 },
      { name: "ageMax", label: "Usia maksimum", type: "number", defaultValue: 12 },
      { name: "difficulty", label: "Kesulitan", type: "select", options: difficultyOptions, defaultValue: "beginner" },
      { name: "status", label: "Status", type: "select", options: contentStatusOptions, defaultValue: "draft" },
    ],
    columns: [
      { key: "prompt", label: "Pertanyaan" },
      { key: "questionType", label: "Jenis" },
      { key: "categoryId", label: "Kategori" },
      { key: "status", label: "Status" },
    ],
  },
};

async function api<T>(path: string, init: RequestInit = {}): Promise<T> {
  const headers = new Headers(init.headers);
  if (init.body && !headers.has("Content-Type")) headers.set("Content-Type", "application/json");
  const response = await fetch(`${API}${path}`, {
    ...init,
    headers,
    credentials: "same-origin",
  });
  const body: unknown = await response.json().catch(() => ({}));
  if (!response.ok) {
    const message =
      body && typeof body === "object" && "error" in body && typeof body.error === "string"
        ? body.error
        : "Permintaan gagal. Periksa koneksi dan coba lagi.";
    throw new Error(message);
  }
  return body as T;
}

export const AdminApp: React.FC = () => {
  const [identity, setIdentity] = useState<AdminIdentity | null>(null);
  const [configured, setConfigured] = useState<boolean | null>(null);
  const [setupAvailable, setSetupAvailable] = useState(false);
  const [loading, setLoading] = useState(true);
  const [view, setView] = useState<AdminView>("dashboard");
  const [error, setError] = useState("");
  const [mobileNavOpen, setMobileNavOpen] = useState(false);

  const refreshIdentity = useCallback(async () => {
    try {
      const status = await api<{ configured: boolean; setupAvailable: boolean }>("/setup/status");
      setConfigured(status.configured);
      setSetupAvailable(status.setupAvailable);
      if (status.configured) {
        const me = await api<AdminIdentity>("/me");
        setIdentity(me);
      }
    } catch (cause) {
      setIdentity(null);
      setError(cause instanceof Error ? cause.message : "Tidak dapat memuat status CMS.");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void refreshIdentity();
  }, [refreshIdentity]);

  const logout = async () => {
    try {
      await api("/logout", { method: "POST" });
      setIdentity(null);
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Logout gagal.");
    }
  };

  const visibleNavigation = NAVIGATION.filter((item) =>
    identity?.permissions.includes(item.permission),
  );

  if (loading) return <AdminShell><div className="p-10 text-center text-slate-500">Memuat CMS...</div></AdminShell>;

  if (window.location.pathname === "/admin/activate") {
    return (
      <AdminShell>
        <InvitationActivation />
      </AdminShell>
    );
  }

  if (!configured) {
    if (!setupAvailable) {
      return (
        <AdminShell>
          <div className="space-y-4">
            <p className="text-xs font-bold uppercase tracking-[.18em] text-amber-600">Setup belum siap</p>
            <h1 className="font-display text-2xl font-bold text-slate-900">Secret Cloudflare belum dikonfigurasi</h1>
            <p className="text-sm leading-6 text-slate-500">Admin Master pertama hanya dapat dibuat setelah pemilik proyek menetapkan secret setup di Cloudflare Worker. Jalankan <code className="rounded bg-slate-100 px-1.5 py-1 text-slate-700">npx wrangler secret put CMS_SETUP_TOKEN</code>, lalu muat ulang halaman ini.</p>
          </div>
        </AdminShell>
      );
    }
    return (
      <AdminShell>
        <AdminSetup onComplete={refreshIdentity} />
        {error && <InlineError message={error} />}
      </AdminShell>
    );
  }

  if (!identity) {
    return (
      <AdminShell>
        <AdminLogin onSuccess={refreshIdentity} />
        {error && <InlineError message={error} />}
      </AdminShell>
    );
  }

  const activeItem = visibleNavigation.find((item) => item.view === view);
  return (
    <div className="min-h-screen bg-slate-100 text-slate-800">
      {mobileNavOpen && (
        <button
          className="fixed inset-0 z-40 bg-slate-950/40 lg:hidden"
          aria-label="Tutup navigasi"
          onClick={() => setMobileNavOpen(false)}
        />
      )}
      <aside className={`fixed inset-y-0 left-0 z-50 flex w-72 flex-col bg-slate-950 text-white transition-transform lg:translate-x-0 ${mobileNavOpen ? "translate-x-0" : "-translate-x-full"}`}>
        <div className="flex h-20 items-center gap-3 border-b border-white/10 px-6">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-sky-400 text-xl">🌟</div>
          <div>
            <p className="font-display text-lg font-bold">Bintang Kecil</p>
            <p className="text-xs text-slate-400">CMS Admin Master</p>
          </div>
        </div>
        <nav className="flex-1 space-y-1 overflow-y-auto p-4" aria-label="Navigasi CMS">
          {visibleNavigation.map((item) => {
            const Icon = item.icon;
            const selected = view === item.view;
            return (
              <button
                key={item.view}
                onClick={() => {
                  setView(item.view);
                  setMobileNavOpen(false);
                  setError("");
                }}
                className={`flex w-full items-center gap-3 rounded-xl px-4 py-3 text-left text-sm font-semibold transition ${selected ? "bg-sky-500 text-white shadow-lg shadow-sky-950/30" : "text-slate-300 hover:bg-white/10 hover:text-white"}`}
              >
                <Icon className="h-4 w-4" />
                {item.label}
                {selected && <ChevronRight className="ml-auto h-4 w-4" />}
              </button>
            );
          })}
        </nav>
        <div className="border-t border-white/10 p-4">
          <div className="mb-3 rounded-xl bg-white/5 p-3">
            <p className="truncate text-sm font-bold">{identity.name}</p>
            <p className="truncate text-xs text-slate-400">{identity.roleName}</p>
          </div>
          <button onClick={() => void logout()} className="flex w-full items-center gap-3 rounded-xl px-4 py-3 text-sm font-semibold text-rose-200 hover:bg-rose-400/10">
            <LogOut className="h-4 w-4" /> Keluar CMS
          </button>
          <a href="/" className="mt-2 flex items-center gap-3 rounded-xl px-4 py-3 text-sm font-semibold text-slate-300 hover:bg-white/10">
            <ArrowLeft className="h-4 w-4" /> Kembali ke aplikasi
          </a>
        </div>
      </aside>

      <div className="min-h-screen lg:pl-72">
        <header className="sticky top-0 z-30 flex h-16 items-center justify-between border-b border-slate-200 bg-white/95 px-4 backdrop-blur sm:px-8">
          <div className="flex items-center gap-3">
            <button className="rounded-lg p-2 hover:bg-slate-100 lg:hidden" aria-label="Buka navigasi" onClick={() => setMobileNavOpen(true)}>
              <Menu className="h-5 w-5" />
            </button>
            <div>
              <p className="text-xs font-semibold uppercase tracking-wider text-slate-400">Admin / {activeItem?.label || "CMS"}</p>
              <h1 className="font-display text-lg font-bold text-slate-900 sm:text-xl">{activeItem?.label || "CMS Admin"}</h1>
            </div>
          </div>
          <div className="hidden items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-3 py-1.5 text-xs font-semibold text-slate-600 sm:flex">
            <span className="h-2 w-2 rounded-full bg-emerald-500" /> Data tersimpan aman di Cloudflare D1
          </div>
        </header>
        <main className="p-4 sm:p-8">
          {error && <InlineError message={error} onClose={() => setError("")} />}
          {view === "dashboard" && <AdminDashboard />}
          {view === "users" && <UserManagement currentUser={identity} />}
          {view === "roles" && <RoleManagement />}
          {RESOURCE_CONFIG[view] && (
            <ResourcePage
              key={view}
              view={view}
              config={RESOURCE_CONFIG[view]!}
              permissions={identity.permissions}
              onError={setError}
            />
          )}
        </main>
      </div>
    </div>
  );
};

function AdminShell({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-[radial-gradient(circle_at_top_left,_#dbeafe,_transparent_38%),#f1f5f9] px-4 py-8 sm:grid sm:place-items-center sm:px-6">
      <a href="/" className="fixed left-4 top-4 inline-flex items-center gap-2 rounded-xl bg-white/80 px-3 py-2 text-sm font-bold text-slate-600 shadow-sm hover:bg-white">
        <ArrowLeft className="h-4 w-4" /> Aplikasi Bintang Kecil
      </a>
      <div className="w-full max-w-lg rounded-3xl border border-white bg-white p-6 shadow-[0_24px_80px_-25px_rgba(15,23,42,.35)] sm:p-9">
        <div className="mb-7 flex items-center gap-3">
          <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-sky-100 text-2xl">🌟</span>
          <div>
            <p className="font-display text-lg font-bold text-slate-900">Bintang Kecil CMS</p>
            <p className="text-sm text-slate-500">Content & Learning Management</p>
          </div>
        </div>
        {children}
      </div>
    </div>
  );
}

function AdminSetup({ onComplete }: { onComplete: () => Promise<void> }) {
  const [form, setForm] = useState({ setupToken: "", name: "", email: "", username: "", password: "" });
  const [error, setError] = useState("");
  const [saving, setSaving] = useState(false);
  const submit = async (event: FormEvent) => {
    event.preventDefault();
    setSaving(true);
    setError("");
    try {
      await api("/setup", { method: "POST", body: JSON.stringify(form) });
      await onComplete();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Setup Admin Master gagal.");
    } finally {
      setSaving(false);
    }
  };
  return (
    <form onSubmit={(event) => void submit(event)} className="space-y-4">
      <div>
        <p className="text-xs font-bold uppercase tracking-[.18em] text-sky-600">Setup pertama kali</p>
        <h1 className="mt-2 font-display text-2xl font-bold text-slate-900">Buat Admin Master</h1>
        <p className="mt-2 text-sm leading-6 text-slate-500">Gunakan kode setup yang hanya Anda simpan di Cloudflare. Akun pertama ini memiliki akses penuh ke CMS.</p>
      </div>
      <FormInput label="Kode setup Cloudflare" type="password" autoComplete="off" value={form.setupToken} onChange={(value) => setForm({ ...form, setupToken: value })} required />
      <div className="grid gap-4 sm:grid-cols-2">
        <FormInput label="Nama lengkap" value={form.name} onChange={(value) => setForm({ ...form, name: value })} required />
        <FormInput label="Username" value={form.username} onChange={(value) => setForm({ ...form, username: value })} required />
      </div>
      <FormInput label="Email" type="email" autoComplete="email" value={form.email} onChange={(value) => setForm({ ...form, email: value })} required />
      <FormInput label="Kata sandi (minimal 12 karakter)" type="password" autoComplete="new-password" value={form.password} onChange={(value) => setForm({ ...form, password: value })} minLength={12} required />
      {error && <InlineError message={error} />}
      <button disabled={saving} className="w-full rounded-xl bg-slate-950 px-5 py-3 font-bold text-white hover:bg-slate-800 disabled:opacity-60">{saving ? "Menyimpan..." : "Buat Admin Master"}</button>
    </form>
  );
}

function AdminLogin({ onSuccess }: { onSuccess: () => Promise<void> }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [saving, setSaving] = useState(false);
  const submit = async (event: FormEvent) => {
    event.preventDefault();
    setSaving(true);
    setError("");
    try {
      await api("/login", { method: "POST", body: JSON.stringify({ email, password }) });
      await onSuccess();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Login CMS gagal.");
    } finally {
      setSaving(false);
    }
  };
  return (
    <form onSubmit={(event) => void submit(event)} className="space-y-4">
      <div>
        <p className="text-xs font-bold uppercase tracking-[.18em] text-sky-600">Area administrator</p>
        <h1 className="mt-2 font-display text-2xl font-bold text-slate-900">Masuk ke CMS</h1>
        <p className="mt-2 text-sm text-slate-500">Gunakan akun admin atau staff yang telah diundang.</p>
      </div>
      <FormInput label="Email atau username" autoComplete="username" value={email} onChange={setEmail} required />
      <FormInput label="Kata sandi" type="password" autoComplete="current-password" value={password} onChange={setPassword} required />
      {error && <InlineError message={error} />}
      <button disabled={saving} className="w-full rounded-xl bg-slate-950 px-5 py-3 font-bold text-white hover:bg-slate-800 disabled:opacity-60">{saving ? "Memeriksa..." : "Masuk"}</button>
    </form>
  );
}

function InvitationActivation() {
  const token = new URLSearchParams(window.location.search).get("token") || "";
  const [password, setPassword] = useState("");
  const [confirmation, setConfirmation] = useState("");
  const [error, setError] = useState("");
  const [done, setDone] = useState(false);
  const [saving, setSaving] = useState(false);
  const submit = async (event: FormEvent) => {
    event.preventDefault();
    if (!token) {
      setError("Tautan undangan tidak memiliki token.");
      return;
    }
    if (password !== confirmation) {
      setError("Konfirmasi kata sandi tidak cocok.");
      return;
    }
    setSaving(true);
    setError("");
    try {
      await api("/invitations/accept", { method: "POST", body: JSON.stringify({ token, password }) });
      setDone(true);
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Aktivasi akun gagal.");
    } finally {
      setSaving(false);
    }
  };
  if (done) {
    return (
      <div className="space-y-4">
        <h1 className="font-display text-2xl font-bold text-slate-900">Akun berhasil diaktifkan</h1>
        <p className="text-sm text-slate-500">Kata sandi tersimpan dengan aman. Silakan login menggunakan email atau username Anda.</p>
        <a href="/admin" className="block rounded-xl bg-slate-950 px-5 py-3 text-center font-bold text-white">Lanjut ke halaman login</a>
      </div>
    );
  }
  return (
    <form onSubmit={(event) => void submit(event)} className="space-y-4">
      <p className="text-xs font-bold uppercase tracking-[.18em] text-sky-600">Undangan CMS</p>
      <h1 className="font-display text-2xl font-bold text-slate-900">Aktifkan akun Anda</h1>
      <p className="text-sm leading-6 text-slate-500">Buat kata sandi minimal 12 karakter. Tautan undangan hanya dapat digunakan sekali.</p>
      <FormInput label="Kata sandi baru" type="password" autoComplete="new-password" value={password} onChange={setPassword} minLength={12} required />
      <FormInput label="Ulangi kata sandi" type="password" autoComplete="new-password" value={confirmation} onChange={setConfirmation} minLength={12} required />
      {error && <InlineError message={error} />}
      <button disabled={saving} className="w-full rounded-xl bg-slate-950 px-5 py-3 font-bold text-white disabled:opacity-60">{saving ? "Mengaktifkan..." : "Aktifkan akun"}</button>
    </form>
  );
}

function FormInput({
  label,
  value,
  onChange,
  type = "text",
  required = false,
  autoComplete,
  minLength,
  placeholder,
}: {
  label: string;
  value: string;
  onChange: (value: string) => void;
  type?: string;
  required?: boolean;
  autoComplete?: string;
  minLength?: number;
  placeholder?: string;
}) {
  return (
    <label className="block">
      <span className="mb-1.5 block text-sm font-bold text-slate-700">{label}</span>
      <input
        type={type}
        value={value}
        onChange={(event) => onChange(event.target.value)}
        required={required}
        autoComplete={autoComplete}
        minLength={minLength}
        placeholder={placeholder}
        className="w-full rounded-xl border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-800 outline-none transition focus:border-sky-500 focus:ring-4 focus:ring-sky-100"
      />
    </label>
  );
}

function InlineError({ message, onClose }: { message: string; onClose?: () => void }) {
  return (
    <div role="alert" className="mb-4 flex items-start gap-2 rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-semibold text-rose-700">
      <CircleAlert className="mt-0.5 h-4 w-4 shrink-0" />
      <span className="flex-1">{message}</span>
      {onClose && <button aria-label="Tutup pesan" onClick={onClose}><X className="h-4 w-4" /></button>}
    </div>
  );
}

function AdminDashboard() {
  const [data, setData] = useState<{
    user: { name: string; role: string };
    counts: Record<string, number>;
    needsAttention: { status: string; count: number }[];
    activity: Record<string, string>[];
  } | null>(null);
  const [error, setError] = useState("");
  useEffect(() => {
    api<NonNullable<typeof data>>("/dashboard").then(setData).catch((cause: unknown) => setError(cause instanceof Error ? cause.message : "Dashboard gagal dimuat."));
  }, []);
  if (error) return <InlineError message={error} />;
  if (!data) return <p className="py-12 text-center text-slate-500">Memuat ringkasan...</p>;

  const stats = [
    ["Akun CMS", data.counts.users, "🛡️"],
    ["Akun orang tua CMS", data.counts.parents, "👨‍👩‍👧"],
    ["Kategori aktif", data.counts.categories, "📚"],
    ["Modul", data.counts.modules, "🧩"],
    ["Lesson", data.counts.lessons, "📖"],
    ["Materi", data.counts.materials, "📝"],
    ["Game", data.counts.games, "🎮"],
    ["Soal", data.counts.questions, "❓"],
  ];
  return (
    <div className="space-y-7">
      <div className="rounded-3xl bg-gradient-to-r from-slate-950 via-slate-900 to-sky-950 p-6 text-white sm:p-8">
        <p className="text-sm font-bold text-sky-300">Selamat datang, {data.user.name}</p>
        <h2 className="mt-2 font-display text-2xl font-bold sm:text-3xl">Pusat pengelolaan pembelajaran</h2>
        <p className="mt-2 max-w-2xl text-sm leading-6 text-slate-300">Kelola akun tim, materi, modul, media, game, dan bank soal dari satu tempat. Data ringkasan berikut berasal dari Cloudflare D1.</p>
      </div>
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        {stats.map(([label, count, icon]) => (
          <div key={label} className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
            <div className="flex items-center justify-between">
              <span className="text-sm font-semibold text-slate-500">{label}</span>
              <span className="text-2xl">{icon}</span>
            </div>
            <p className="mt-3 font-display text-3xl font-bold text-slate-900">{count}</p>
          </div>
        ))}
      </div>
      <div className="grid gap-5 xl:grid-cols-2">
        <section className="rounded-2xl border border-slate-200 bg-white p-5">
          <h3 className="font-display text-lg font-bold">Perlu perhatian</h3>
          <div className="mt-4 space-y-3">
            {data.needsAttention.length === 0 ? (
              <p className="rounded-xl bg-emerald-50 px-4 py-3 text-sm font-semibold text-emerald-700">Tidak ada materi draft atau menunggu review.</p>
            ) : data.needsAttention.map((item) => (
              <div key={item.status} className="flex items-center justify-between rounded-xl bg-amber-50 px-4 py-3 text-sm">
                <span className="font-semibold capitalize text-amber-900">{item.status === "review" ? "Menunggu review" : "Draft"}</span>
                <strong className="text-amber-800">{item.count}</strong>
              </div>
            ))}
          </div>
        </section>
        <section className="rounded-2xl border border-slate-200 bg-white p-5">
          <h3 className="flex items-center gap-2 font-display text-lg font-bold"><Activity className="h-5 w-5 text-sky-600" /> Aktivitas terbaru</h3>
          <div className="mt-4 space-y-3">
            {data.activity.length === 0 ? (
              <p className="rounded-xl bg-slate-50 px-4 py-3 text-sm text-slate-500">Belum ada aktivitas admin.</p>
            ) : data.activity.map((item, index) => (
              <div key={`${item.createdAt}-${index}`} className="flex items-start justify-between gap-4 border-b border-slate-100 pb-3 last:border-0">
                <div><p className="text-sm font-semibold text-slate-700">{item.action}</p><p className="text-xs text-slate-400">{item.targetType}</p></div>
                <time className="shrink-0 text-xs text-slate-400">{formatDate(item.createdAt)}</time>
              </div>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
}

function UserManagement({ currentUser }: { currentUser: AdminIdentity }) {
  const [users, setUsers] = useState<CmsUser[]>([]);
  const [roles, setRoles] = useState<CmsRole[]>([]);
  const [query, setQuery] = useState("");
  const [showCreate, setShowCreate] = useState(false);
  const [inviteUrl, setInviteUrl] = useState("");
  const [error, setError] = useState("");
  const can = (permission: string) => currentUser.permissions.includes(permission);
  const refresh = useCallback(async () => {
    try {
      const [allUsers, roleData] = await Promise.all([
        api<CmsUser[]>("/users"),
        api<{ roles: CmsRole[] }>("/roles"),
      ]);
      setUsers(allUsers);
      setRoles(roleData.roles);
      setError("");
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Daftar akun gagal dimuat.");
    }
  }, []);
  useEffect(() => { void refresh(); }, [refresh]);
  const filtered = users.filter((user) => `${user.name} ${user.email} ${user.username} ${user.roleName}`.toLowerCase().includes(query.toLowerCase()));
  const createAccount = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const form = new FormData(event.currentTarget);
    setError("");
    try {
      const result = await api<{ invitationUrl: string }>("/users", {
        method: "POST",
        body: JSON.stringify({
          name: form.get("name"),
          email: form.get("email"),
          username: form.get("username"),
          roleId: form.get("roleId"),
          notes: form.get("notes"),
        }),
      });
      setInviteUrl(result.invitationUrl);
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Akun gagal dibuat.");
    }
  };
  const setStatus = async (user: CmsUser, status: "active" | "suspended") => {
    try {
      await api(`/users/${encodeURIComponent(user.id)}`, { method: "PATCH", body: JSON.stringify({ status }) });
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Status akun gagal diubah.");
    }
  };
  const suspend = async (user: CmsUser) => {
    if (!window.confirm(`Nonaktifkan akun ${user.name}? Sesi yang aktif akan dicabut.`)) return;
    try {
      await api(`/users/${encodeURIComponent(user.id)}`, { method: "DELETE" });
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Akun gagal dinonaktifkan.");
    }
  };
  return (
    <div className="space-y-5">
      <PageHeading title="Manajemen akun" description="Buat undangan staff dan atur akses akun CMS. Kata sandi tidak dikirim lewat email." action={can("users.create") ? <button onClick={() => { setShowCreate(true); setInviteUrl(""); }} className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-4 py-2.5 text-sm font-bold text-white hover:bg-slate-800"><Plus className="h-4 w-4" /> Tambah akun</button> : undefined} />
      {error && <InlineError message={error} onClose={() => setError("")} />}
      <div className="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-3 py-2 sm:max-w-md">
        <Search className="h-4 w-4 text-slate-400" /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Cari nama, email, username, role..." className="w-full text-sm outline-none" />
      </div>
      <div className="overflow-x-auto rounded-2xl border border-slate-200 bg-white">
        <table className="w-full min-w-[760px] text-left text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500"><tr><th className="px-4 py-3">Nama / email</th><th className="px-4 py-3">Username</th><th className="px-4 py-3">Role</th><th className="px-4 py-3">Status</th><th className="px-4 py-3">Login terakhir</th><th className="px-4 py-3">Aksi</th></tr></thead>
          <tbody className="divide-y divide-slate-100">
            {filtered.map((user) => <tr key={user.id} className="hover:bg-slate-50">
              <td className="px-4 py-3"><p className="font-bold">{user.name}</p><p className="text-xs text-slate-500">{user.email}</p></td>
              <td className="px-4 py-3">{user.username}</td><td className="px-4 py-3">{user.roleName}</td>
              <td className="px-4 py-3"><StatusBadge status={user.status} /></td>
              <td className="px-4 py-3 text-slate-500">{formatDate(user.lastLogin)}</td>
              <td className="px-4 py-3"><div className="flex gap-2">
                {can("users.update") && user.status !== "active" && <button onClick={() => void setStatus(user, "active")} className="rounded-lg border px-2 py-1 text-xs font-bold text-emerald-700 hover:bg-emerald-50">Aktifkan</button>}
                {can("users.delete") && user.status !== "suspended" && user.id !== currentUser.id && <button onClick={() => void suspend(user)} aria-label={`Nonaktifkan ${user.name}`} className="rounded-lg p-1.5 text-rose-600 hover:bg-rose-50"><Trash2 className="h-4 w-4" /></button>}
              </div></td>
            </tr>)}
            {filtered.length === 0 && <tr><td colSpan={6} className="px-4 py-14 text-center text-slate-500">Belum ada akun yang cocok dengan pencarian.</td></tr>}
          </tbody>
        </table>
      </div>
      {showCreate && <Modal title="Undang pengguna CMS" onClose={() => setShowCreate(false)}>
        {inviteUrl ? <div className="space-y-4"><p className="rounded-xl bg-emerald-50 p-4 text-sm font-semibold text-emerald-800">Akun menunggu aktivasi. Salin tautan undangan ini dan kirim melalui kanal tepercaya. Tautan kedaluwarsa dalam 48 jam.</p><textarea readOnly value={inviteUrl} className="min-h-24 w-full rounded-xl border border-slate-300 p-3 text-sm" /><div className="flex justify-end gap-2"><button onClick={() => void navigator.clipboard.writeText(inviteUrl)} className="rounded-xl border px-4 py-2 text-sm font-bold hover:bg-slate-50">Salin tautan</button><button onClick={() => setShowCreate(false)} className="rounded-xl bg-slate-950 px-4 py-2 text-sm font-bold text-white">Selesai</button></div></div> : <form onSubmit={(event) => void createAccount(event)} className="space-y-4">
          <ModalField name="name" label="Nama lengkap" required /><ModalField name="email" label="Email" type="email" required /><ModalField name="username" label="Username" required />
          <label className="block"><span className="mb-1 block text-sm font-bold">Role</span><select name="roleId" className="w-full rounded-xl border border-slate-300 px-3 py-2.5" required>{roles.filter((role) => role.id !== "admin_master" || currentUser.roleId === "admin_master").map((role) => <option key={role.id} value={role.id}>{role.name}</option>)}</select></label>
          <ModalField name="notes" label="Catatan (opsional)" />
          <p className="text-xs leading-5 text-slate-500">Pengguna membuat kata sandi sendiri melalui undangan sekali pakai. Jangan kirim kata sandi lewat email.</p>
          <div className="flex justify-end gap-2"><button type="button" onClick={() => setShowCreate(false)} className="rounded-xl border px-4 py-2 text-sm font-bold">Batal</button><button className="rounded-xl bg-slate-950 px-4 py-2 text-sm font-bold text-white">Buat undangan</button></div>
        </form>}
      </Modal>}
    </div>
  );
}

function RoleManagement() {
  const [roles, setRoles] = useState<CmsRole[]>([]);
  const [permissions, setPermissions] = useState<CmsPermission[]>([]);
  const [selectedId, setSelectedId] = useState("");
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [permissionIds, setPermissionIds] = useState<string[]>([]);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const refresh = useCallback(async () => {
    try {
      const result = await api<{ roles: CmsRole[]; permissions: CmsPermission[] }>("/roles");
      setRoles(result.roles);
      setPermissions(result.permissions);
      if (!selectedId && result.roles.length) setSelectedId(result.roles[0].id);
      const selected = result.roles.find((role) => role.id === selectedId) || result.roles[0];
      if (selected) {
        setName(selected.name);
        setDescription(selected.description);
        setPermissionIds(selected.permissionIds);
      }
      setError("");
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Role gagal dimuat.");
    }
  }, [selectedId]);
  useEffect(() => { void refresh(); }, [refresh]);
  const select = (role: CmsRole) => {
    setSelectedId(role.id);
    setName(role.name);
    setDescription(role.description);
    setPermissionIds(role.permissionIds);
    setSuccess("");
  };
  const save = async () => {
    try {
      await api(`/roles/${encodeURIComponent(selectedId)}`, { method: "PUT", body: JSON.stringify({ name, description, permissionIds }) });
      setSuccess("Perubahan role dan permission berhasil disimpan.");
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Perubahan role gagal disimpan.");
    }
  };
  const createRole = async () => {
    const roleName = window.prompt("Nama role baru");
    if (!roleName?.trim()) return;
    try {
      const role = await api<{ id: string; name: string; description: string; permissionIds: string[] }>("/roles", { method: "POST", body: JSON.stringify({ name: roleName.trim() }) });
      await refresh();
      select({ ...role, systemRole: 0, userCount: 0 });
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Role gagal dibuat.");
    }
  };
  const grouped = useMemo(() => permissions.reduce<Record<string, CmsPermission[]>>((groups, permission) => {
    (groups[permission.groupName] ||= []).push(permission);
    return groups;
  }, {}), [permissions]);
  const selectedRole = roles.find((role) => role.id === selectedId);
  return (
    <div className="space-y-5">
      <PageHeading title="Role & permission" description="Atur izin granular. Perubahan langsung divalidasi dan disimpan di database." action={<button onClick={() => void createRole()} className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-4 py-2.5 text-sm font-bold text-white"><Plus className="h-4 w-4" /> Role baru</button>} />
      {error && <InlineError message={error} onClose={() => setError("")} />}{success && <p role="status" className="rounded-xl bg-emerald-50 px-4 py-3 text-sm font-bold text-emerald-700">{success}</p>}
      <div className="grid gap-5 xl:grid-cols-[280px_1fr]">
        <section className="space-y-2 rounded-2xl border border-slate-200 bg-white p-3">
          {roles.map((role) => <button key={role.id} onClick={() => select(role)} className={`w-full rounded-xl p-3 text-left ${role.id === selectedId ? "bg-sky-50 ring-1 ring-sky-200" : "hover:bg-slate-50"}`}><span className="flex items-center justify-between gap-2 text-sm font-bold">{role.name}{role.id === "admin_master" && <Shield className="h-4 w-4 text-amber-500" />}</span><span className="mt-1 block text-xs text-slate-500">{role.userCount} pengguna</span></button>)}
        </section>
        {selectedRole && <section className="rounded-2xl border border-slate-200 bg-white p-5">
          <div className="grid gap-4 sm:grid-cols-2">
            <ModalField value={name} onChange={setName} label="Nama role" disabled={Boolean(selectedRole.systemRole)} />
            <ModalField value={description} onChange={setDescription} label="Deskripsi" />
          </div>
          <div className="mt-5 space-y-4">
            {Object.entries(grouped).map(([group, items]) => <fieldset key={group} className="rounded-xl border border-slate-200 p-4">
              <legend className="px-2 text-sm font-extrabold text-slate-700">{group}</legend>
              <div className="grid gap-2 sm:grid-cols-2">
                {items.map((permission) => <label key={permission.id} className="flex items-center gap-2 rounded-lg p-2 text-sm hover:bg-slate-50">
                  <input type="checkbox" checked={permissionIds.includes(permission.id)} disabled={selectedRole.id === "admin_master"} onChange={(event) => setPermissionIds((current) => event.target.checked ? [...current, permission.id] : current.filter((item) => item !== permission.id))} className="rounded border-slate-300 text-sky-600 focus:ring-sky-500" />
                  {permission.label}
                </label>)}
              </div>
            </fieldset>)}
          </div>
          <div className="mt-5 flex justify-end"><button onClick={() => void save()} disabled={selectedRole.id === "admin_master"} className="rounded-xl bg-slate-950 px-5 py-2.5 text-sm font-bold text-white disabled:opacity-50">Simpan role</button></div>
        </section>}
      </div>
    </div>
  );
}

function ResourcePage({ view, config, permissions, onError }: { view: AdminView; config: ResourceConfig; permissions: string[]; onError: (message: string) => void }) {
  const [rows, setRows] = useState<Record<string, unknown>[]>([]);
  const [categories, setCategories] = useState<Record<string, unknown>[]>([]);
  const [modules, setModules] = useState<Record<string, unknown>[]>([]);
  const [lessons, setLessons] = useState<Record<string, unknown>[]>([]);
  const [games, setGames] = useState<Record<string, unknown>[]>([]);
  const [templates, setTemplates] = useState<Record<string, unknown>[]>([]);
  const [query, setQuery] = useState("");
  const [editing, setEditing] = useState<Record<string, unknown> | null>(null);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const canCreate = permissions.includes(`${config.permission}.create`);
  const canUpdate = permissions.includes(`${config.permission}.update`);
  const canDelete = permissions.includes(`${config.permission}.delete`);
  const canPublish = permissions.includes(`${config.permission}.publish`);
  const refresh = useCallback(async () => {
    try {
      const [result, categoryResult, moduleResult, lessonResult, gameResult, templateResult] = await Promise.all([
        api<Record<string, unknown>[]>(`/${config.endpoint}?q=${encodeURIComponent(query)}`),
        api<Record<string, unknown>[]>("/categories"),
        api<Record<string, unknown>[]>("/modules"),
        api<Record<string, unknown>[]>("/lessons"),
        api<Record<string, unknown>[]>("/games"),
        api<Record<string, unknown>[]>("/game-templates"),
      ]);
      setRows(result);
      setCategories(categoryResult);
      setModules(moduleResult);
      setLessons(lessonResult);
      setGames(gameResult);
      setTemplates(templateResult);
      setError("");
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Data gagal dimuat.");
    }
  }, [config.endpoint, query]);
  useEffect(() => { void refresh(); }, [refresh]);
  const save = async (form: Record<string, unknown>) => {
    setSaving(true);
    setError("");
    try {
      const payload = convertFormData(form, config.fields);
      const id = editing?.id;
      await api(id ? `/${config.endpoint}/${encodeURIComponent(String(id))}` : `/${config.endpoint}`, {
        method: id ? "PUT" : "POST",
        body: JSON.stringify(payload),
      });
      setEditing(null);
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : `${config.singular} gagal disimpan.`);
    } finally {
      setSaving(false);
    }
  };
  const remove = async (row: Record<string, unknown>) => {
    if (config.archive) {
      if (!window.confirm(`Arsipkan ${config.singular.toLowerCase()} "${displayValue(row, config.columns[0]?.key)}"?`)) return;
      try {
        await api(`/${config.endpoint}/${encodeURIComponent(String(row.id))}`, {
          method: "PATCH",
          body: JSON.stringify({ status: "archived" }),
        });
        await refresh();
      } catch (cause) {
        setError(cause instanceof Error ? cause.message : "Arsip gagal disimpan.");
      }
      return;
    }
    if (!window.confirm(`Hapus ${config.singular.toLowerCase()} ini? Tindakan ini tidak dapat dibatalkan.`)) return;
    try {
      await api(`/${config.endpoint}/${encodeURIComponent(String(row.id))}`, { method: "DELETE" });
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Data gagal dihapus.");
    }
  };
  const filtered = rows.filter((row) => JSON.stringify(row).toLowerCase().includes(query.toLowerCase()));
  return (
    <div className="space-y-5">
      <PageHeading title={config.title} description={view === "media" ? "Daftarkan URL eksternal yang aman untuk gambar, audio, video, dan dokumen. Upload file langsung tersedia setelah menambahkan R2." : "Kelola data CMS yang tersimpan di Cloudflare D1."} action={canCreate ? <button onClick={() => setEditing({})} className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-4 py-2.5 text-sm font-bold text-white hover:bg-slate-800"><Plus className="h-4 w-4" /> Tambah {config.singular.toLowerCase()}</button> : undefined} />
      {error && <InlineError message={error} onClose={() => setError("")} />}
      <div className="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-3 py-2 sm:max-w-md"><Search className="h-4 w-4 text-slate-400" /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder={`Cari ${config.title.toLowerCase()}...`} className="w-full text-sm outline-none" /></div>
      <div className="overflow-x-auto rounded-2xl border border-slate-200 bg-white">
        <table className="w-full min-w-[680px] text-left text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500"><tr>{config.columns.map((column) => <th key={column.key} className="px-4 py-3">{column.label}</th>)}<th className="px-4 py-3">Aksi</th></tr></thead>
          <tbody className="divide-y divide-slate-100">
            {filtered.map((row) => <tr key={String(row.id)} className="hover:bg-slate-50">
              {config.columns.map((column) => <td key={column.key} className="max-w-[360px] px-4 py-3">{column.key === "status" ? <StatusBadge status={String(row[column.key] || "")} /> : <span className="line-clamp-2">{displayValue(row, column.key)}</span>}</td>)}
              <td className="px-4 py-3"><div className="flex gap-1">
                {canUpdate && <button onClick={() => setEditing(row)} aria-label={`Edit ${config.singular}`} className="rounded-lg p-2 text-sky-700 hover:bg-sky-50"><Pencil className="h-4 w-4" /></button>}
                {canDelete && <button onClick={() => void remove(row)} aria-label={`${config.archive ? "Arsipkan" : "Hapus"} ${config.singular}`} className="rounded-lg p-2 text-rose-600 hover:bg-rose-50"><Trash2 className="h-4 w-4" /></button>}
                {canPublish && row.status === "review" && <button onClick={() => void api(`/${config.endpoint}/${encodeURIComponent(String(row.id))}`, { method: "PATCH", body: JSON.stringify({ status: "published" }) }).then(refresh).catch((cause: unknown) => setError(cause instanceof Error ? cause.message : "Publish gagal."))} className="rounded-lg p-2 text-emerald-700 hover:bg-emerald-50" aria-label={`Terbitkan ${config.singular}`}><Check className="h-4 w-4" /></button>}
              </div></td>
            </tr>)}
            {filtered.length === 0 && <tr><td colSpan={config.columns.length + 1} className="px-4 py-16 text-center"><div className="mx-auto max-w-sm"><div className="text-3xl">📚</div><p className="mt-2 font-bold text-slate-700">Belum ada {config.title.toLowerCase()}</p><p className="mt-1 text-sm text-slate-500">Tambahkan entri pertama. Data kosong ditampilkan apa adanya, bukan angka contoh.</p></div></td></tr>}
          </tbody>
        </table>
      </div>
      {editing && <Modal title={`${editing.id ? "Edit" : "Tambah"} ${config.singular.toLowerCase()}`} onClose={() => setEditing(null)} wide>
        <ResourceForm config={config} value={editing} categories={categories} modules={modules} lessons={lessons} games={games} templates={templates} saving={saving} onCancel={() => setEditing(null)} onSubmit={save} onError={(message) => setError(message)} />
      </Modal>}
    </div>
  );
}

function ResourceForm({
  config,
  value,
  categories,
  modules,
  lessons,
  games,
  templates,
  saving,
  onCancel,
  onSubmit,
  onError,
}: {
  config: ResourceConfig;
  value: Record<string, unknown>;
  categories: Record<string, unknown>[];
  modules: Record<string, unknown>[];
  lessons: Record<string, unknown>[];
  games: Record<string, unknown>[];
  templates: Record<string, unknown>[];
  saving: boolean;
  onCancel: () => void;
  onSubmit: (form: Record<string, unknown>) => Promise<void>;
  onError: (message: string) => void;
}) {
  const initial = useMemo(() => {
    const parsed: Record<string, unknown> = { ...value };
    for (const field of config.fields) {
      const key = storedFieldName(field.name);
      if (parsed[field.name] === undefined && parsed[key] !== undefined) parsed[field.name] = parsed[key];
      if (field.type === "blocks" && typeof parsed[field.name] === "string") {
        try { parsed[field.name] = JSON.parse(parsed[field.name] as string); } catch { parsed[field.name] = []; }
      }
    }
    return parsed;
  }, [config.fields, value]);
  const [form, setForm] = useState<Record<string, unknown>>(initial);
  const submit = (event: FormEvent) => {
    event.preventDefault();
    try {
      void onSubmit(form);
    } catch (cause) {
      onError(cause instanceof Error ? cause.message : "Periksa kembali formulir.");
    }
  };
  return (
    <form onSubmit={submit} className="space-y-4">
      <div className="grid gap-4 sm:grid-cols-2">
        {config.fields.map((field) => {
          const valueForField = form[field.name] ?? field.defaultValue ?? "";
          if (field.type === "category" || field.type === "module" || field.type === "lesson" || field.type === "game" || field.type === "template" || field.type === "select") {
            const options = field.type === "category" ? categories.map((item) => ({ value: String(item.id), label: `${item.icon || ""} ${item.name}`.trim() })) :
              field.type === "module" ? modules.map((item) => ({ value: String(item.id), label: String(item.title) })) :
                field.type === "lesson" ? lessons.map((item) => ({ value: String(item.id), label: String(item.title) })) :
                  field.type === "game" ? games.map((item) => ({ value: String(item.id), label: String(item.title) })) :
                    field.type === "template" ? templates.map((item) => ({ value: String(item.id), label: String(item.name) })) :
                      field.options || [];
            return <label key={field.name} className="block">
              <span className="mb-1.5 block text-sm font-bold text-slate-700">{field.label}{field.required && <span className="text-rose-500"> *</span>}</span>
              <select required={field.required} value={String(valueForField)} onChange={(event) => setForm({ ...form, [field.name]: event.target.value })} className="w-full rounded-xl border border-slate-300 bg-white px-3 py-2.5 text-sm focus:border-sky-500 focus:outline-none">
                {!field.required && <option value="">— Tidak dipilih —</option>}
                {options.map((option) => <option key={option.value} value={option.value}>{option.label}</option>)}
              </select>
            </label>;
          }
          if (field.type === "blocks") {
            return <div key={field.name} className="sm:col-span-2"><ContentBlockEditor value={Array.isArray(valueForField) ? valueForField as ContentBlock[] : []} onChange={(blocks) => setForm({ ...form, [field.name]: blocks })} /></div>;
          }
          if (field.type === "textarea" || field.type === "json") {
            let textValue: string;
            if (Array.isArray(valueForField)) textValue = valueForField.join("\n");
            else if (valueForField && typeof valueForField === "object") textValue = JSON.stringify(valueForField, null, 2);
            else textValue = String(valueForField);
            return <label key={field.name} className={`block ${field.type === "json" ? "sm:col-span-2" : ""}`}>
              <span className="mb-1.5 block text-sm font-bold text-slate-700">{field.label}{field.required && <span className="text-rose-500"> *</span>}</span>
              <textarea required={field.required} rows={field.type === "json" ? 5 : 3} value={textValue} onChange={(event) => setForm({ ...form, [field.name]: event.target.value })} placeholder={field.placeholder} className="w-full rounded-xl border border-slate-300 bg-white px-3 py-2.5 text-sm focus:border-sky-500 focus:outline-none" />
              {field.type === "json" && <span className="mt-1 block text-xs text-slate-500">Masukkan JSON yang valid. Array/objek akan divalidasi saat disimpan.</span>}
            </label>;
          }
          return <label key={field.name} className="block">
            <span className="mb-1.5 block text-sm font-bold text-slate-700">{field.label}{field.required && <span className="text-rose-500"> *</span>}</span>
            <input type={field.type === "number" ? "number" : field.type === "url" ? "url" : field.type === "email" ? "email" : "text"} min={field.type === "number" ? 0 : undefined} required={field.required} value={String(valueForField)} onChange={(event) => setForm({ ...form, [field.name]: field.type === "number" ? Number(event.target.value) : event.target.value })} placeholder={field.placeholder} className="w-full rounded-xl border border-slate-300 bg-white px-3 py-2.5 text-sm focus:border-sky-500 focus:outline-none" />
          </label>;
        })}
      </div>
      <div className="flex justify-end gap-2 border-t border-slate-100 pt-4">
        <button type="button" onClick={onCancel} className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-bold">Batal</button>
        <button disabled={saving} className="rounded-xl bg-slate-950 px-5 py-2 text-sm font-bold text-white disabled:opacity-60">{saving ? "Menyimpan..." : "Simpan"}</button>
      </div>
    </form>
  );
}

interface ContentBlock {
  type: string;
  title: string;
  body: string;
}

function ContentBlockEditor({ value, onChange }: { value: ContentBlock[]; onChange: (blocks: ContentBlock[]) => void }) {
  const add = (type: string) => onChange([...value, { type, title: "", body: "" }]);
  const update = (index: number, key: keyof ContentBlock, next: string) => onChange(value.map((block, current) => current === index ? { ...block, [key]: next } : block));
  const remove = (index: number) => onChange(value.filter((_, current) => current !== index));
  return (
    <fieldset className="rounded-2xl border border-slate-200 p-4">
      <legend className="px-2 text-sm font-extrabold text-slate-700">Blok konten</legend>
      <p className="mb-3 text-xs text-slate-500">Susun teks, pertanyaan, media, flashcard, aktivitas, atau referensi game secara berurutan.</p>
      <div className="space-y-3">
        {value.map((block, index) => <div key={`${block.type}-${index}`} className="rounded-xl border border-slate-200 bg-slate-50 p-3">
          <div className="mb-2 flex items-center justify-between gap-3"><span className="rounded-full bg-sky-100 px-2.5 py-1 text-xs font-bold uppercase text-sky-700">{block.type.replaceAll("_", " ")}</span><button type="button" onClick={() => remove(index)} className="rounded-lg p-1 text-rose-600 hover:bg-rose-50" aria-label="Hapus blok"><Trash2 className="h-4 w-4" /></button></div>
          <input value={block.title} onChange={(event) => update(index, "title", event.target.value)} placeholder="Judul blok" className="mb-2 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm" />
          <textarea value={block.body} onChange={(event) => update(index, "body", event.target.value)} placeholder={block.type === "image" || block.type === "audio" || block.type === "video" ? "URL media HTTPS" : "Teks/konten blok"} rows={3} className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm" />
          {block.type === "text" && <p className="mt-2 text-xs text-slate-500">Format sederhana: **tebal**, *miring*, # judul, atau - daftar.</p>}
        </div>)}
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        {["text", "image", "audio", "video", "question", "quiz", "matching", "drag_drop", "flashcard", "story", "game"].map((type) => <button key={type} type="button" onClick={() => add(type)} className="rounded-lg border border-slate-300 bg-white px-2.5 py-1.5 text-xs font-bold capitalize hover:border-sky-300 hover:bg-sky-50"><Plus className="mr-1 inline h-3 w-3" />{type.replaceAll("_", " ")}</button>)}
      </div>
    </fieldset>
  );
}

function convertFormData(form: Record<string, unknown>, fields: Field[]): Record<string, unknown> {
  const payload: Record<string, unknown> = {};
  for (const field of fields) {
    const value = form[field.name];
    if (field.type === "json") {
      if (typeof value !== "string" || !value.trim()) {
        payload[field.name] = field.name === "options" ? [] : {};
      } else {
        try { payload[field.name] = JSON.parse(value); } catch { throw new Error(`Format JSON pada "${field.label}" tidak valid.`); }
      }
    } else if (field.type === "textarea" && ["objectives", "skills", "prerequisites"].includes(field.name)) {
      payload[field.name] = typeof value === "string" ? value.split(/\r?\n/).map((line) => line.trim()).filter(Boolean) : [];
    } else {
      payload[field.name] = value ?? field.defaultValue ?? "";
    }
  }
  return payload;
}

function storedFieldName(field: string): string {
  return field.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);
}

function displayValue(row: Record<string, unknown>, key: string): string {
  const value = row[key];
  if (value === null || value === undefined || value === "") {
    const snake = storedFieldName(key);
    if (snake !== key && row[snake] !== undefined) return displayValue(row, snake);
    return "—";
  }
  if (key === "categoryId" && typeof value === "string") {
    const category = RESOURCE_CATEGORY_LABELS[value];
    return category ? `${category.icon} ${category.name}` : value;
  }
  if (key === "ageMin") return `${value}–${row.ageMax ?? "12"} th`;
  if (typeof value === "string" && value.length > 130) return `${value.slice(0, 127)}...`;
  return String(value);
}

const RESOURCE_CATEGORY_LABELS: Record<string, { name: string; icon: string }> = {
  stories: { name: "Cerita Anak", icon: "📚" },
  mathematics: { name: "Matematika", icon: "🔢" },
  science: { name: "Sains", icon: "🔬" },
  social: { name: "IPS", icon: "🌎" },
  arabic: { name: "Bahasa Arab", icon: "🕌" },
  mandarin: { name: "Bahasa Mandarin", icon: "🇨🇳" },
  indonesian: { name: "Bahasa Indonesia", icon: "🇮🇩" },
  english: { name: "Bahasa Inggris", icon: "🇬🇧" },
  coding: { name: "Coding", icon: "💻" },
};

function StatusBadge({ status }: { status: string }) {
  const styles: Record<string, string> = {
    active: "bg-emerald-50 text-emerald-700",
    published: "bg-emerald-50 text-emerald-700",
    pending: "bg-amber-50 text-amber-800",
    review: "bg-amber-50 text-amber-800",
    draft: "bg-slate-100 text-slate-600",
    archived: "bg-slate-100 text-slate-500",
    suspended: "bg-rose-50 text-rose-700",
  };
  return <span className={`inline-flex rounded-full px-2.5 py-1 text-xs font-bold capitalize ${styles[status] || "bg-slate-100 text-slate-600"}`}>{status}</span>;
}

function PageHeading({ title, description, action }: { title: string; description: string; action?: React.ReactNode }) {
  return <div className="flex flex-col justify-between gap-4 sm:flex-row sm:items-end"><div><h2 className="font-display text-2xl font-bold text-slate-950">{title}</h2><p className="mt-1 max-w-3xl text-sm text-slate-500">{description}</p></div>{action}</div>;
}

function Modal({ title, children, onClose, wide = false }: { title: string; children: React.ReactNode; onClose: () => void; wide?: boolean }) {
  return (
    <div className="fixed inset-0 z-[70] grid place-items-center overflow-y-auto bg-slate-950/50 p-3 sm:p-6" role="presentation" onMouseDown={(event) => { if (event.target === event.currentTarget) onClose(); }}>
      <section role="dialog" aria-modal="true" aria-label={title} className={`my-auto w-full rounded-2xl bg-white p-5 shadow-2xl sm:p-6 ${wide ? "max-w-3xl" : "max-w-xl"}`}>
        <header className="mb-5 flex items-center justify-between gap-4"><h3 className="font-display text-xl font-bold">{title}</h3><button onClick={onClose} className="rounded-lg p-2 text-slate-500 hover:bg-slate-100" aria-label="Tutup dialog"><X className="h-5 w-5" /></button></header>
        {children}
      </section>
    </div>
  );
}

function ModalField({ name, label, type = "text", required = false, value, onChange, disabled = false }: { name?: string; label: string; type?: string; required?: boolean; value?: string; onChange?: (value: string) => void; disabled?: boolean }) {
  return <label className="block"><span className="mb-1 block text-sm font-bold text-slate-700">{label}</span><input name={name} type={type} required={required} value={value} disabled={disabled} onChange={onChange ? (event) => onChange(event.target.value) : undefined} className="w-full rounded-xl border border-slate-300 px-3 py-2.5 text-sm outline-none focus:border-sky-500 disabled:bg-slate-100" /></label>;
}

function formatDate(value: unknown): string {
  if (typeof value !== "string" || !value) return "Belum pernah";
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? "—" : new Intl.DateTimeFormat("id-ID", { dateStyle: "medium", timeStyle: "short" }).format(date);
}
