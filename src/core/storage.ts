import {
  ParentAccount,
  ChildProfile,
  ModuleProgress,
  Attempt,
  SkillMastery,
  CategoryId,
  AgeRange,
} from "../types";
import { ALL_BADGES } from "../data/badges";

const PREFIX = "bk:v1:";

export async function hashString(str: string): Promise<string> {
  try {
    const encoder = new TextEncoder();
    const data = encoder.encode(str + "_bk_salt_2026");
    const hashBuffer = await crypto.subtle.digest("SHA-256", data);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    return hashArray.map((b) => b.toString(16).padStart(2, "0")).join("");
  } catch {
    // Fallback if crypto is unavailable
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      hash = (hash << 5) - hash + str.charCodeAt(i);
      hash |= 0;
    }
    return `fallback_${Math.abs(hash)}`;
  }
}

class StorageRepository {
  private getItem<T>(key: string, defaultValue: T): T {
    try {
      const raw = localStorage.getItem(PREFIX + key);
      if (!raw) return defaultValue;
      return JSON.parse(raw) as T;
    } catch {
      return defaultValue;
    }
  }

  private setItem<T>(key: string, value: T): void {
    try {
      localStorage.setItem(PREFIX + key, JSON.stringify(value));
    } catch (e) {
      console.error("Storage error:", e);
    }
  }

  // Parent Account
  getParentAccount(): ParentAccount | null {
    return this.getItem<ParentAccount | null>("parent_account", null);
  }

  getParentAccounts(): ParentAccount[] {
    const accounts = this.getItem<ParentAccount[]>("parent_accounts", []);
    const currentAccount = this.getParentAccount();
    if (currentAccount && !accounts.some((account) => account.id === currentAccount.id)) {
      accounts.push(currentAccount);
      this.setItem("parent_accounts", accounts);
    }
    return accounts;
  }

  setParentAccount(account: ParentAccount): void {
    this.setItem("parent_account", account);
    const accounts = this.getParentAccounts();
    const existingIndex = accounts.findIndex((saved) => saved.id === account.id);
    if (existingIndex >= 0) {
      accounts[existingIndex] = account;
    } else {
      accounts.push(account);
    }
    this.setItem("parent_accounts", accounts);
  }

  // Active Child ID
  getActiveChildId(): string | null {
    return this.getItem<string | null>("active_child_id", null);
  }

  setActiveChildId(id: string | null): void {
    this.setItem("active_child_id", id);
  }

  // Children Profiles
  getChildren(): ChildProfile[] {
    return this.getItem<ChildProfile[]>("children", []);
  }

  getChild(childId: string): ChildProfile | null {
    const children = this.getChildren();
    return children.find((c) => c.id === childId) || null;
  }

  saveChild(child: ChildProfile): void {
    const children = this.getChildren();
    const index = children.findIndex((c) => c.id === child.id);
    if (index >= 0) {
      children[index] = child;
    } else {
      children.push(child);
    }
    this.setItem("children", children);
  }

  deleteChild(childId: string): void {
    const children = this.getChildren().filter((c) => c.id !== childId);
    this.setItem("children", children);

    // Clean up associated child data
    this.setItem(`progress_${childId}`, {});
    this.setItem(`attempts_${childId}`, []);
    this.setItem(`mastery_${childId}`, {});

    if (this.getActiveChildId() === childId) {
      this.setActiveChildId(children.length > 0 ? children[0].id : null);
    }
  }

  // Module Progress (keyed strictly by childId)
  getModuleProgress(childId: string): Record<string, ModuleProgress> {
    return this.getItem<Record<string, ModuleProgress>>(`progress_${childId}`, {});
  }

  saveModuleProgress(childId: string, progress: ModuleProgress): void {
    const all = this.getModuleProgress(childId);
    all[progress.moduleId] = progress;
    this.setItem(`progress_${childId}`, all);
    this.checkAndAwardBadges(childId);
  }

  // Attempts (isolated per childId)
  getAttempts(childId: string): Attempt[] {
    return this.getItem<Attempt[]>(`attempts_${childId}`, []);
  }

  addAttempt(childId: string, attempt: Attempt): void {
    const attempts = this.getAttempts(childId);
    attempts.unshift(attempt);
    // Keep last 300 attempts
    if (attempts.length > 300) attempts.length = 300;
    this.setItem(`attempts_${childId}`, attempts);
    this.updateMasteryFromAttempt(childId, attempt);
    this.checkAndAwardBadges(childId);
  }

  // Skill Mastery (isolated per childId)
  getMasteryMap(childId: string): Record<string, SkillMastery> {
    return this.getItem<Record<string, SkillMastery>>(`mastery_${childId}`, {});
  }

  private updateMasteryFromAttempt(childId: string, attempt: Attempt): void {
    const map = this.getMasteryMap(childId);
    const existing = map[attempt.skillId] || {
      childId,
      skillId: attempt.skillId,
      category: attempt.category,
      attempts: 0,
      correct: 0,
      hintsUsed: 0,
      lastPracticedAt: attempt.at,
      masteryScore: 0,
      history: [],
    };

    existing.attempts += 1;
    if (attempt.correct) existing.correct += 1;
    if (attempt.usedHint) existing.hintsUsed += 1;
    existing.lastPracticedAt = attempt.at;

    existing.history.unshift({
      t: attempt.at,
      correct: attempt.correct,
      difficulty: attempt.difficulty,
      usedHint: attempt.usedHint,
    });
    if (existing.history.length > 20) existing.history.length = 20;

    // Calculate weighted score from last 20 attempts
    // More recent attempts carry higher weight
    let weightSum = 0;
    let scoreSum = 0;
    existing.history.forEach((h, idx) => {
      const recencyWeight = Math.max(0.5, 1 - idx * 0.04);
      let point = h.correct ? 100 : 0;
      if (h.usedHint && h.correct) point = 50; // 0.5 value if hint used
      scoreSum += point * recencyWeight;
      weightSum += recencyWeight;
    });

    existing.masteryScore = weightSum > 0 ? Math.round(scoreSum / weightSum) : 0;
    map[attempt.skillId] = existing;
    this.setItem(`mastery_${childId}`, map);
  }

  // Rewards & Stars
  addStars(childId: string, count: number): void {
    const child = this.getChild(childId);
    if (!child) return;
    child.stars += count;
    child.coins += count * 5;
    this.saveChild(child);
    this.checkAndAwardBadges(childId);
  }

  // Automatic badge evaluation based on real child statistics
  checkAndAwardBadges(childId: string): string[] {
    const child = this.getChild(childId);
    if (!child) return [];

    const attempts = this.getAttempts(childId);
    const progress = this.getModuleProgress(childId);
    const completedModulesCount = Object.values(progress).filter(
      (p) => p.status === "done" || Boolean(p.completedAt)
    ).length;
    const totalActivities = attempts.length + completedModulesCount;

    const newlyEarned: string[] = [];
    const currentBadges = new Set(child.badges || []);

    ALL_BADGES.forEach((b) => {
      if (currentBadges.has(b.id)) return;

      let qualified = false;
      if (b.id === "badge_first_step") {
        qualified = totalActivities >= 1 || child.stars >= 1;
      } else if (b.id === "badge_star_10") {
        // Collect 10 stars
        qualified = child.stars >= 10;
      } else if (b.id === "badge_star_50") {
        // Collect 50 stars
        qualified = child.stars >= 50;
      } else if (b.id === "badge_word_master") {
        const wordAttempts = attempts.filter(
          (a) => a.category === "indonesian" || a.category === "english" || a.category === "stories"
        ).length;
        qualified = wordAttempts >= 3 || completedModulesCount >= 2;
      } else if (b.id === "badge_math_whiz") {
        const mathAttempts = attempts.filter((a) => a.category === "mathematics").length;
        qualified = mathAttempts >= 3 || child.stars >= 15;
      } else if (b.id === "badge_science_explorer") {
        const sciAttempts = attempts.filter((a) => a.category === "science").length;
        qualified = sciAttempts >= 2;
      } else if (b.id === "badge_streak_3") {
        qualified = child.stars >= 15 || totalActivities >= 3;
      } else if (b.id === "badge_streak_7") {
        qualified = child.stars >= 35 || totalActivities >= 7;
      } else if (b.id === "badge_coder_junior") {
        const codeAttempts = attempts.filter((a) => a.category === "coding").length;
        qualified = codeAttempts >= 2;
      } else if (b.id === "badge_brave_try") {
        qualified = attempts.length >= 5 || child.stars >= 15;
      }

      if (qualified) {
        currentBadges.add(b.id);
        newlyEarned.push(b.id);
      }
    });

    if (newlyEarned.length > 0) {
      child.badges = Array.from(currentBadges);
      this.saveChild(child);
    }

    return newlyEarned;
  }

  // Seed default demo data if nothing exists
  seedDemoData(): void {
    const existing = this.getChildren();
    if (existing.length > 0) return;

    // Parent
    const parent: ParentAccount = {
      id: "parent_1",
      name: "Bunda Rina",
      email: "bunda@keluargabahagia.id",
      passwordHash: "demo_hash",
      pinHash: "fc7f70f232b4ff95757dd3dd78ac84dfbcd698c8016a9f586defbc132ac9bc24", // PIN demo: 1234
      createdAt: new Date().toISOString(),
    };
    this.setParentAccount(parent);

    const allCategories: CategoryId[] = [
      "stories",
      "mathematics",
      "science",
      "social",
      "arabic",
      "mandarin",
      "indonesian",
      "english",
      "coding",
    ];

    // Child 1: Adit, 5 years old (Level 2: 4-5)
    const adit: ChildProfile = {
      id: "child_adit",
      parentId: parent.id,
      nickname: "Adit",
      birthDate: "2021-04-12",
      age: 5,
      avatar: "🐰",
      levelOverride: "4-5",
      enabledCategories: allCategories,
      languages: ["id", "en"],
      dailyLimitMin: 30,
      difficultyMode: "auto",
      audio: { volume: 80, narration: true, music: true, sfx: true },
      stars: 48,
      coins: 240,
      donuts: 6,
      badges: ["badge_first_step", "badge_star_10", "badge_word_master", "badge_streak_3"],
      ownedItems: ["item_cap_red", "item_glasses_star"],
      equippedHat: "item_cap_red",
      worldState: {
        unlockedAreas: ["home", "park", "library"],
        decorations: {
          home: ["item_flower_pot", "item_lamp_yellow"],
          park: ["item_swing_rainbow"],
          library: ["item_globe"],
        },
      },
      streak: 4,
      lastActiveDate: new Date().toISOString().slice(0, 10),
      todaySecondsPlayed: 480,
    };

    // Child 2: Budi, 8 years old (Level 4: 8-10)
    const budi: ChildProfile = {
      id: "child_budi",
      parentId: parent.id,
      nickname: "Budi",
      birthDate: "2018-08-20",
      age: 8,
      avatar: "🦁",
      levelOverride: "8-10",
      enabledCategories: allCategories,
      languages: ["id", "en", "ar"],
      dailyLimitMin: 45,
      difficultyMode: "auto",
      audio: { volume: 85, narration: true, music: false, sfx: true },
      stars: 82,
      coins: 410,
      donuts: 12,
      badges: [
        "badge_first_step",
        "badge_star_10",
        "badge_star_50",
        "badge_math_whiz",
        "badge_coder_junior",
      ],
      ownedItems: ["item_crown_gold", "item_glasses_cool"],
      equippedHat: "item_crown_gold",
      worldState: {
        unlockedAreas: ["home", "park", "library", "lab"],
        decorations: {
          lab: ["item_telescope"],
        },
      },
      streak: 7,
      lastActiveDate: new Date().toISOString().slice(0, 10),
      todaySecondsPlayed: 920,
    };

    this.saveChild(adit);
    this.saveChild(budi);
    this.setActiveChildId(adit.id);

    // Seed some attempts & mastery for Adit
    const now = Date.now();
    const skills = [
      { id: "number-recognition", cat: "mathematics" as CategoryId, score: 85, correct: 18, total: 20 },
      { id: "counting", cat: "mathematics" as CategoryId, score: 75, correct: 15, total: 20 },
      { id: "letter-recognition", cat: "indonesian" as CategoryId, score: 90, correct: 19, total: 20 },
      { id: "word-formation", cat: "indonesian" as CategoryId, score: 65, correct: 13, total: 20 },
      { id: "animal-classification", cat: "science" as CategoryId, score: 80, correct: 16, total: 20 },
      { id: "spatial-coding", cat: "coding" as CategoryId, score: 70, correct: 14, total: 20 },
    ];

    skills.forEach((s) => {
      for (let i = 0; i < s.total; i++) {
        const isCorrect = i < s.correct;
        const usedHint = !isCorrect || i % 4 === 0;
        this.addAttempt(adit.id, {
          id: `seed_${adit.id}_${s.id}_${i}`,
          childId: adit.id,
          gameId: "practice",
          skillId: s.id,
          category: s.cat,
          correct: isCorrect,
          usedHint,
          durationMs: 4000 + (i % 3) * 1500,
          difficulty: 1 + (i % 2),
          at: new Date(now - (s.total - i) * 3600 * 1000 * 8).toISOString(),
        });
      }
    });

    // Seed some progress
    this.saveModuleProgress(adit.id, {
      childId: adit.id,
      moduleId: "math-4-5-001",
      status: "done",
      stars: 3,
      lastStep: 5,
      completedAt: new Date().toISOString(),
    });
    this.saveModuleProgress(adit.id, {
      childId: adit.id,
      moduleId: "indo-4-5-001",
      status: "done",
      stars: 3,
      lastStep: 5,
      completedAt: new Date().toISOString(),
    });
    this.saveModuleProgress(adit.id, {
      childId: adit.id,
      moduleId: "science-4-5-001",
      status: "in-progress",
      stars: 2,
      lastStep: 3,
    });
  }
}

export const storage = new StorageRepository();
