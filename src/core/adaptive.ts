export interface AdaptiveState {
  currentDifficulty: number; // 1 (beginner), 2 (developing), 3 (advanced)
  consecutiveSuccesses: number;
  consecutiveStruggles: number;
  blockAttempts: boolean[]; // tracks last 3 tries in current block
  usedDemonstration: boolean;
}

export const initialAdaptiveState: AdaptiveState = {
  currentDifficulty: 1,
  consecutiveSuccesses: 0,
  consecutiveStruggles: 0,
  blockAttempts: [],
  usedDemonstration: false,
};

export const ENCOURAGEMENTS = [
  "Belum tepat, tapi kamu hebat sudah mencoba!",
  "Ayo coba sekali lagi, kamu pasti bisa!",
  "Hampir benar! Yuk teliti sedikit lagi 😊",
  "Tidak apa-apa, Bimo bantu ya!",
  "Ayo kita coba bersama-sama!",
  "Hebat! Terus semangat ya!",
];

export function getRandomEncouragement(): string {
  const idx = Math.floor(Math.random() * ENCOURAGEMENTS.length);
  return ENCOURAGEMENTS[idx];
}

export const PRAISES = [
  "Luar biasa! Benar sekali! ⭐",
  "Hebat sekali! Bimo bangga padamu! 🎉",
  "Wah, pintar sekali! Jawabanmu tepat! ✨",
  "Keren! Kamu semakin jago! 🚀",
  "Tepat sekali! Ayo lanjutkan ke yang berikutnya! 🐰",
];

export function getRandomPraise(): string {
  const idx = Math.floor(Math.random() * PRAISES.length);
  return PRAISES[idx];
}

/**
 * Calculates next adaptive state following Section 9 of the specification:
 * - 3/3 correct: difficulty steps up by 1 (max 3)
 * - 2/3 correct: remains stable with fresh variations
 * - 1/3 correct: provides repetition/gentle ease (difficulty - 1)
 * - >= 3 consecutive block struggles: flag demonstration mode and recommend a gentle pause or game
 */
export function evaluateAdaptiveStep(
  state: AdaptiveState,
  isCorrect: boolean,
  isAutoMode: boolean
): {
  nextState: AdaptiveState;
  difficultyChanged: boolean;
  message: string;
  recommendDemonstration: boolean;
} {
  const newBlock = [...state.blockAttempts, isCorrect];
  let nextDifficulty = state.currentDifficulty;
  let nextSuccesses = state.consecutiveSuccesses;
  let nextStruggles = state.consecutiveStruggles;
  let difficultyChanged = false;
  let message = isCorrect ? getRandomPraise() : getRandomEncouragement();
  let recommendDemonstration = false;

  // Once block reaches 3 questions:
  if (newBlock.length >= 3) {
    const correctCount = newBlock.filter(Boolean).length;

    if (isAutoMode) {
      if (correctCount === 3) {
        if (nextDifficulty < 3) {
          nextDifficulty += 1;
          difficultyChanged = true;
          message = "Wah, kamu hebat! Ayo coba tantangan yang lebih seru! 🌟";
        }
        nextSuccesses += 1;
        nextStruggles = 0;
      } else if (correctCount === 2) {
        // Keep steady
        message = "Bagus sekali! Mari kita mantapkan lagi ya!";
      } else {
        // 0 or 1 correct
        nextStruggles += 1;
        nextSuccesses = 0;
        if (nextDifficulty > 1) {
          nextDifficulty -= 1;
          difficultyChanged = true;
          message = "Yuk kita coba dengan cara yang lebih mudah dan menyenangkan 😊";
        }
      }

      if (nextStruggles >= 2) {
        recommendDemonstration = true;
      }
    }

    return {
      nextState: {
        currentDifficulty: nextDifficulty,
        consecutiveSuccesses: nextSuccesses,
        consecutiveStruggles: nextStruggles,
        blockAttempts: [], // reset block
        usedDemonstration: recommendDemonstration,
      },
      difficultyChanged,
      message,
      recommendDemonstration,
    };
  }

  return {
    nextState: {
      ...state,
      blockAttempts: newBlock,
    },
    difficultyChanged: false,
    message,
    recommendDemonstration: false,
  };
}
