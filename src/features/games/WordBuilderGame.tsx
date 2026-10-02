import React, { useState, useEffect } from "react";
import { Volume2, Sparkles, RefreshCw, CheckCircle2 } from "lucide-react";
import { audio } from "../../core/audio";
import { WordBuilderItem } from "../../data/games";
import confetti from "canvas-confetti";

interface WordBuilderGameProps {
  item: WordBuilderItem;
  onSuccess: () => void;
  onHint?: () => void;
}

export const WordBuilderGame: React.FC<WordBuilderGameProps> = ({
  item,
  onSuccess,
}) => {
  const [placedLetters, setPlacedLetters] = useState<(string | null)[]>(
    new Array(item.word.length).fill(null)
  );
  const [availableTiles, setAvailableTiles] = useState<
    { id: string; letter: string; used: boolean }[]
  >([]);
  const [isCompleted, setIsCompleted] = useState(false);
  const [activeHintIndex, setActiveHintIndex] = useState<number | null>(null);

  useEffect(() => {
    setPlacedLetters(new Array(item.word.length).fill(null));
    setAvailableTiles(
      item.scrambled.map((letter, idx) => ({
        id: `${letter}_${idx}`,
        letter,
        used: false,
      }))
    );
    setIsCompleted(false);
    setActiveHintIndex(null);

    // Speak initial prompt
    audio.speak(`Ayo susun kata ${item.word}!`, {
      rate: 0.85,
    });
  }, [item]);

  // Tap an available tile to put into the next open slot
  const handleSelectTile = (tileId: string) => {
    if (isCompleted) return;
    const tileIndex = availableTiles.findIndex((t) => t.id === tileId);
    if (tileIndex === -1 || availableTiles[tileIndex].used) return;

    const firstEmptySlot = placedLetters.findIndex((slot) => slot === null);
    if (firstEmptySlot === -1) return;

    audio.playTapSound();
    const updatedPlaced = [...placedLetters];
    updatedPlaced[firstEmptySlot] = availableTiles[tileIndex].letter;
    setPlacedLetters(updatedPlaced);

    const updatedTiles = [...availableTiles];
    updatedTiles[tileIndex].used = true;
    setAvailableTiles(updatedTiles);

    // Check if fully filled
    if (updatedPlaced.every((l) => l !== null)) {
      const spelled = updatedPlaced.join("");
      if (spelled === item.word) {
        setIsCompleted(true);
        audio.playCorrectSound();
        try {
          confetti({ particleCount: 40, spread: 50, origin: { y: 0.7 } });
        } catch {}

        // Spell it out then say full word as required by Section 7.2:
        // "A-P-E-L... APEL!"
        const letterSpelling = item.word.split("").join(" - ");
        setTimeout(() => {
          audio.speak(`Hebat! Ini kata ${item.word}! ${letterSpelling}... ${item.word}!`, {
            rate: 0.85,
            onEnd: () => {
              onSuccess();
            },
          });
        }, 400);
      } else {
        // Not matching yet
        audio.playEncouragementSound();
        audio.speak("Hampir benar! Ayo coba susun kembali ya.", {
          rate: 0.85,
        });
      }
    }
  };

  // Remove a letter from a slot back to available
  const handleRemoveSlot = (slotIdx: number) => {
    if (isCompleted) return;
    const letter = placedLetters[slotIdx];
    if (!letter) return;

    audio.playTapSound();
    const updatedPlaced = [...placedLetters];
    updatedPlaced[slotIdx] = null;
    setPlacedLetters(updatedPlaced);

    // Free the first tile with this letter
    const tileIndex = availableTiles.findIndex(
      (t) => t.letter === letter && t.used
    );
    if (tileIndex !== -1) {
      const updatedTiles = [...availableTiles];
      updatedTiles[tileIndex].used = false;
      setAvailableTiles(updatedTiles);
    }
  };

  const handleReset = () => {
    audio.playTapSound();
    setPlacedLetters(new Array(item.word.length).fill(null));
    setAvailableTiles(availableTiles.map((t) => ({ ...t, used: false })));
    setIsCompleted(false);
  };

  const handleTriggerHint = () => {
    audio.playTapSound();
    // Highlight the next correct letter needed
    const firstEmpty = placedLetters.findIndex((l) => l === null);
    if (firstEmpty !== -1) {
      const targetLetter = item.word[firstEmpty];
      setActiveHintIndex(firstEmpty);
      audio.speak(`Huruf selanjutnya adalah ${targetLetter}`, { rate: 0.85 });
    }
  };

  return (
    <div className="flex flex-col items-center justify-center p-4 max-w-2xl mx-auto select-none">
      {/* Target Image Card */}
      <div className="relative mb-6">
        <div className="w-36 h-36 sm:w-44 sm:h-44 bg-gradient-to-tr from-sky-100 to-amber-50 rounded-3xl border-4 border-amber-300 flex items-center justify-center shadow-lg transform hover:scale-105 transition-transform">
          <span className="text-7xl sm:text-8xl drop-shadow-md animate-pulse">
            {item.imageEmoji}
          </span>
        </div>
        <button
          onClick={() => audio.speak(item.word)}
          className="absolute -bottom-3 right-0 bg-amber-400 hover:bg-amber-500 text-amber-950 p-2.5 rounded-full shadow-md transition-transform active:scale-90 border-2 border-white"
          title="Dengar Bunyi Kata"
        >
          <Volume2 className="w-5 h-5" />
        </button>
      </div>

      {/* Target Word Slots */}
      <div className="flex items-center gap-2.5 sm:gap-3.5 mb-8">
        {placedLetters.map((char, idx) => (
          <button
            key={idx}
            onClick={() => handleRemoveSlot(idx)}
            className={`w-14 h-16 sm:w-18 sm:h-20 rounded-2xl border-3 flex items-center justify-center font-child font-black text-2xl sm:text-3xl transition-all shadow-md ${
              char
                ? isCompleted
                  ? "bg-emerald-400 border-emerald-500 text-white animate-bounce"
                  : "bg-white border-amber-400 text-[#25476A] hover:bg-rose-50"
                : activeHintIndex === idx
                ? "bg-amber-100 border-dashed border-amber-500 animate-pulse text-amber-600"
                : "bg-white/60 border-dashed border-sky-300 text-slate-300"
            }`}
          >
            {char || (activeHintIndex === idx ? item.word[idx] : "_")}
          </button>
        ))}
      </div>

      {/* Available Letter Tiles to Tap */}
      <div className="flex items-center justify-center gap-3 sm:gap-4 flex-wrap mb-6">
        {availableTiles.map((tile) => (
          <button
            key={tile.id}
            onClick={() => handleSelectTile(tile.id)}
            disabled={tile.used || isCompleted}
            className={`w-14 h-14 sm:w-16 sm:h-16 rounded-2xl font-child font-black text-2xl sm:text-3xl flex items-center justify-center transition-all shadow-md active:scale-95 ${
              tile.used
                ? "opacity-20 pointer-events-none bg-slate-200 border-2 border-slate-300"
                : "bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-3 border-amber-400 text-amber-950 hover:scale-105"
            }`}
          >
            {tile.letter}
          </button>
        ))}
      </div>

      {/* Action Buttons */}
      <div className="flex items-center gap-4 mt-2">
        <button
          onClick={handleReset}
          className="flex items-center gap-2 px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl font-child font-bold text-sm shadow-sm transition-all"
        >
          <RefreshCw className="w-4 h-4" />
          <span>Ulangi</span>
        </button>
        <button
          onClick={handleTriggerHint}
          className="flex items-center gap-2 px-4 py-2 bg-pink-100 hover:bg-pink-200 text-pink-700 rounded-2xl font-child font-bold text-sm shadow-sm transition-all"
        >
          <Sparkles className="w-4 h-4" />
          <span>Bantuan Bimo</span>
        </button>
      </div>
    </div>
  );
};
