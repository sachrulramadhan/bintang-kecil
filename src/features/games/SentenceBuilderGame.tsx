import React, { useState, useEffect } from "react";
import { Sparkles, RefreshCw, Volume2, CheckCircle2, RotateCcw } from "lucide-react";
import { SentenceBuilderItem } from "../../data/games";
import { audio } from "../../core/audio";
import confetti from "canvas-confetti";

interface SentenceBuilderGameProps {
  item: SentenceBuilderItem;
  onSuccess: () => void;
}

interface WordTile {
  id: string;
  word: string;
  used: boolean;
}

export const SentenceBuilderGame: React.FC<SentenceBuilderGameProps> = ({
  item,
  onSuccess,
}) => {
  // Extract target words from correctSentence
  const cleanTargetWords = item.correctSentence
    .replace(/[.!?]/g, "")
    .trim()
    .split(/\s+/);

  const totalSlots = cleanTargetWords.length;

  const [placedWords, setPlacedWords] = useState<(string | null)[]>(
    new Array(totalSlots).fill(null)
  );
  const [availableWords, setAvailableWords] = useState<WordTile[]>([]);
  const [isCompleted, setIsCompleted] = useState(false);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  useEffect(() => {
    resetGame();
    audio.speak(`Ayo susun kata-kata ini agar menjadi kalimat yang benar!`, {
      rate: 0.85,
    });
  }, [item]);

  const resetGame = () => {
    setPlacedWords(new Array(totalSlots).fill(null));
    setIsCompleted(false);
    setErrorMessage(null);

    // Prepare scrambled word tiles
    const wordsToScramble = [...cleanTargetWords];
    // Deterministic shuffle so adjacent duplicates don't confuse, but words are mixed
    const shuffled = wordsToScramble
      .map((value) => ({ value, sort: Math.random() }))
      .sort((a, b) => a.sort - b.sort)
      .map((item) => item.value);

    // If accidentally same as target, reverse it
    if (shuffled.join(" ") === cleanTargetWords.join(" ") && shuffled.length > 1) {
      shuffled.reverse();
    }

    setAvailableWords(
      shuffled.map((word, idx) => ({
        id: `${word}_${idx}_${Date.now()}`,
        word,
        used: false,
      }))
    );
  };

  // Place a word into the next empty slot
  const handleSelectWord = (tile: WordTile) => {
    if (isCompleted || tile.used) return;

    const firstEmpty = placedWords.findIndex((slot) => slot === null);
    if (firstEmpty === -1) return;

    audio.playTapSound();
    audio.speak(tile.word, { rate: 0.9 });
    setErrorMessage(null);

    const nextPlaced = [...placedWords];
    nextPlaced[firstEmpty] = tile.word;
    setPlacedWords(nextPlaced);

    setAvailableWords((prev) =>
      prev.map((t) => (t.id === tile.id ? { ...t, used: true } : t))
    );

    // If all slots are now filled, check the result!
    if (nextPlaced.every((w) => w !== null)) {
      checkSentence(nextPlaced as string[]);
    }
  };

  // Remove a placed word and return it to the bank
  const handleRemovePlacedWord = (index: number) => {
    if (isCompleted) return;
    const wordToRemove = placedWords[index];
    if (!wordToRemove) return;

    audio.playTapSound();
    setErrorMessage(null);

    const nextPlaced = [...placedWords];
    nextPlaced[index] = null;
    setPlacedWords(nextPlaced);

    // Return first matching used tile back to available
    setAvailableWords((prev) => {
      let restored = false;
      return prev.map((t) => {
        if (!restored && t.used && t.word === wordToRemove) {
          restored = true;
          return { ...t, used: false };
        }
        return t;
      });
    });
  };

  const checkSentence = (words: string[]) => {
    const userSentence = words.join(" ").trim().toLowerCase();
    const targetSentence = cleanTargetWords.join(" ").trim().toLowerCase();

    if (userSentence === targetSentence) {
      // Success!
      setIsCompleted(true);
      audio.playCorrectSound();
      audio.playTrophySound();
      try {
        confetti({ particleCount: 60, spread: 70, origin: { y: 0.6 } });
      } catch {}

      audio.speak(`Hebat sekali! "${item.correctSentence}"`, {
        rate: 0.85,
        onEnd: () => {
          setTimeout(onSuccess, 1200);
        },
      });
    } else {
      // Incorrect order, give friendly hint
      audio.playEncouragementSound();
      setErrorMessage("Urutan katanya belum pas. Sentuh kata untuk mengubah posisi ya!");
      audio.speak("Urutan katanya belum pas, coba susun lagi ya!", { rate: 0.85 });
    }
  };

  return (
    <div className="flex flex-col items-center justify-center p-4 max-w-xl mx-auto select-none">
      {/* Title */}
      <div className="text-center mb-4">
        <h3 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child flex items-center justify-center gap-2">
          <span>📖</span>
          <span>Ayo Susun Kalimat!</span>
        </h3>
        <p className="text-xs sm:text-sm font-bold text-slate-500 font-child mt-1">
          Sentuh kata-kata di bawah sesuai urutan kalimat yang tepat
        </p>
      </div>

      {/* Big Emoji Illustration */}
      <div className="text-6xl sm:text-7xl mb-4 transform hover:scale-105 transition-transform drop-shadow-sm">
        {item.imageEmoji}
      </div>

      {/* Sentence Slots (Assembly Area) */}
      <div className="w-full bg-white/95 rounded-3xl p-4 sm:p-5 border-3 border-amber-300 shadow-md mb-5">
        <div className="text-center text-xs font-bold text-amber-900 font-child uppercase tracking-wider mb-3">
          {isCompleted ? "✨ Kalimat Terbentuk Sempurna! ✨" : "Kotak Susunan Kalimat:"}
        </div>

        <div className="flex items-center justify-center gap-2 sm:gap-3 flex-wrap min-h-[56px]">
          {placedWords.map((word, idx) => (
            <div
              key={idx}
              onClick={() => handleRemovePlacedWord(idx)}
              className={`min-w-[70px] sm:min-w-[85px] h-12 sm:h-14 px-3 sm:px-4 rounded-2xl flex items-center justify-center font-child font-black text-base sm:text-lg transition-all ${
                word
                  ? isCompleted
                    ? "bg-gradient-to-r from-emerald-400 to-green-500 text-white shadow-md border-2 border-emerald-500 scale-102 cursor-default"
                    : "bg-amber-400 hover:bg-amber-500 text-amber-950 shadow-md border-2 border-amber-500 cursor-pointer active:scale-95"
                  : "border-2 border-dashed border-amber-300 bg-amber-50/60 text-amber-400/80 cursor-default"
              }`}
            >
              {word ? (
                <span>{word}</span>
              ) : (
                <span className="text-xs font-bold font-child opacity-60">Kata {idx + 1}</span>
              )}
            </div>
          ))}
        </div>

        {/* Friendly Error Hint */}
        {errorMessage && (
          <p className="text-center text-xs font-bold text-rose-600 font-child mt-3 bg-rose-50 py-1.5 px-3 rounded-xl border border-rose-200">
            {errorMessage}
          </p>
        )}
      </div>

      {/* Word Bank (Scrambled Words to Pick From) */}
      <div className="w-full">
        <div className="text-center text-xs font-bold text-slate-500 font-child uppercase mb-2.5">
          Pilihan Kata:
        </div>

        <div className="flex items-center justify-center gap-2.5 sm:gap-3.5 flex-wrap">
          {availableWords.map((tile) => (
            <button
              key={tile.id}
              disabled={tile.used || isCompleted}
              onClick={() => handleSelectWord(tile)}
              className={`px-4 sm:px-5 py-2.5 sm:py-3 rounded-2xl font-child font-black text-base sm:text-lg shadow-sm border-2 transition-all active:scale-95 ${
                tile.used
                  ? "bg-slate-100 border-slate-200 text-slate-300 opacity-40 cursor-not-allowed"
                  : "bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-amber-400 text-amber-950 shadow-md hover:shadow-lg hover:scale-105 cursor-pointer"
              }`}
            >
              {tile.word}
            </button>
          ))}
        </div>
      </div>

      {/* Control Actions */}
      <div className="flex items-center justify-center gap-3 mt-6">
        <button
          onClick={resetGame}
          className="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl font-child font-bold text-xs flex items-center gap-1.5 shadow-xs transition-transform active:scale-95"
          title="Ulangi Susunan"
        >
          <RotateCcw className="w-4 h-4" />
          <span>Susun Ulang</span>
        </button>

        <button
          onClick={() => audio.speak(item.correctSentence)}
          className="px-4 py-2 bg-amber-100 hover:bg-amber-200 text-amber-900 rounded-xl font-child font-bold text-xs flex items-center gap-1.5 shadow-xs transition-transform active:scale-95"
          title="Dengar Kalimat Lengkap"
        >
          <Volume2 className="w-4 h-4" />
          <span>Dengar Petunjuk</span>
        </button>
      </div>

      {/* Success Banner */}
      {isCompleted && (
        <div className="mt-4 p-3 bg-emerald-100 border-2 border-emerald-400 rounded-2xl flex items-center gap-2 text-emerald-800 animate-bounce">
          <CheckCircle2 className="w-5 h-5 text-emerald-600 shrink-0" />
          <span className="font-child font-black text-sm">
            Luar Biasa! Kalimat tersusun sempurna! ⭐
          </span>
        </div>
      )}
    </div>
  );
};
