export type AgeRange = "2-3" | "4-5" | "6-7" | "8-10" | "11-12";

export type CategoryId =
  | "stories"
  | "mathematics"
  | "science"
  | "social"
  | "arabic"
  | "mandarin"
  | "indonesian"
  | "english"
  | "coding";

export type Difficulty = "beginner" | "developing" | "advanced";

export type PlayGameType =
  | "word-builder"
  | "fill-word"
  | "tracing"
  | "connect-pairs"
  | "sort-letters"
  | "guess-sound"
  | "word-image"
  | "find-letter"
  | "sentence-builder"
  | "memory-match"
  | "grid-coding";

export interface ParentAccount {
  id: string;
  name: string;
  email: string;
  passwordHash: string;
  pinHash: string;
  createdAt: string;
}

export interface ChildAudioSettings {
  volume: number;      // 0 - 100
  narration: boolean;  // TTS speech
  music: boolean;      // Background ambient
  sfx: boolean;        // Chimes & taps
}

export interface ChildWorldState {
  unlockedAreas: string[]; // "home", "park", "library", "lab", "rocket"
  decorations: Record<string, string[]>;
}

export interface ChildProfile {
  id: string;
  parentId: string;
  nickname: string;
  birthDate: string;
  age: number;
  avatar: string; // emoji or avatar id
  levelOverride?: AgeRange;
  enabledCategories: CategoryId[];
  languages: string[];
  dailyLimitMin: number; // 0 = unlimited, 15, 30, 45, 60
  difficultyMode: "auto" | "manual";
  manualDifficulty?: Difficulty;
  audio: ChildAudioSettings;
  stars: number;
  coins: number;
  donuts: number;
  badges: string[];
  ownedItems: string[];
  equippedHat?: string;
  equippedGlasses?: string;
  worldState: ChildWorldState;
  streak: number;
  lastActiveDate: string;
  todaySecondsPlayed: number;
}

export interface SkillMastery {
  childId: string;
  skillId: string;
  category: CategoryId;
  attempts: number;
  correct: number;
  hintsUsed: number;
  lastPracticedAt: string;
  masteryScore: number; // 0 - 100
  history: {
    t: string;
    correct: boolean;
    difficulty: number;
    usedHint: boolean;
  }[];
}

export interface ModuleActivity {
  type: "learn" | "explore" | "game" | "practice" | "review";
  title: string;
  bimoNarration: string;
  details?: string;
  exploreItems?: { label: string; icon: string; soundText: string; explanation?: string }[];
  gameType?: PlayGameType;
  gameConfig?: any;
  questions?: AssessmentQuestion[];
}

export interface AssessmentQuestion {
  id: string;
  text: string;
  audioText?: string;
  imageEmoji?: string;
  options: {
    id: string;
    text: string;
    imageEmoji?: string;
    isCorrect: boolean;
  }[];
  hint: string;
  skillId: string;
  difficulty: number; // 1 - 3
}

export interface LearningModule {
  id: string;
  category: CategoryId;
  subcategory?: string;
  title: string;
  description: string;
  ageRange: AgeRange;
  difficulty: Difficulty;
  learningObjectives: string[];
  skills: string[];
  activities: ModuleActivity[];
  assessment: {
    questionCount: number;
    passThreshold: number;
    adaptive: boolean;
  };
  estimatedDuration: number; // in minutes
  prerequisites: string[];
  curriculumReferences: string[];
  whyItMatters: string;
  nextModuleIds: string[];
}

export interface Attempt {
  id: string;
  childId: string;
  moduleId?: string;
  gameId: string;
  itemId?: string;
  skillId: string;
  category: CategoryId;
  correct: boolean;
  usedHint: boolean;
  durationMs: number;
  difficulty: number;
  at: string;
}

export interface ModuleProgress {
  childId: string;
  moduleId: string;
  status: "locked" | "open" | "in-progress" | "done";
  stars: number; // 0 - 3
  lastStep: number;
  completedAt?: string;
}

export interface Badge {
  id: string;
  title: string;
  description: string;
  icon: string;
  category: "literacy" | "math" | "science" | "streak" | "general";
  reqType: "stars" | "modules" | "streak" | "games" | "skill";
  reqValue: number;
}

export interface ShopItem {
  id: string;
  title: string;
  category: "hat" | "glasses" | "color" | "decoration";
  priceStars: number;
  icon: string;
  previewArea?: string;
}

export interface DailyMission {
  id: string;
  title: string;
  icon: string;
  target: number;
  current: number;
  rewardStars: number;
  completed: boolean;
}

export interface StoryPage {
  pageNum: number;
  text: string;
  illustration: string; // Emoji combination or SVG scene description
  keywords: string[];
}

export interface StoryQuestion {
  question: string;
  options: string[];
  answer: number;
  explanation: string;
}

export interface Story {
  id: string;
  title: string;
  category: "moral" | "adventure" | "animal" | "science" | "culture" | "world";
  ageRange: AgeRange;
  moralLesson: string;
  coverEmoji: string;
  pages: StoryPage[];
  questions: StoryQuestion[];
}
