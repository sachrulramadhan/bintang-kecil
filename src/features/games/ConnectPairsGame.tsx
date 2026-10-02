import React, { useState } from "react";
import { Sparkles, CheckCircle2, Volume2 } from "lucide-react";
import { ConnectPairItem } from "../../data/games";
import { audio } from "../../core/audio";
import confetti from "canvas-confetti";

interface ConnectPairsGameProps {
  pairs: ConnectPairItem[];
  onSuccess: () => void;
}

export const ConnectPairsGame: React.FC<ConnectPairsGameProps> = ({
  pairs,
  onSuccess,
}) => {
  const [selectedLeft, setSelectedLeft] = useState<string | null>(null);
  const [matchedIds, setMatchedIds] = useState<string[]>([]);

  // Shuffle right items initially
  const [rightItems] = useState(() =>
    [...pairs].sort(() => Math.random() - 0.5)
  );

  const handleSelectLeft = (id: string, matchId: string, label: string) => {
    if (matchedIds.includes(matchId)) return;
    audio.playTapSound();
    audio.speak(label);
    setSelectedLeft(id);
  };

  const handleSelectRight = (rightPair: ConnectPairItem) => {
    if (!selectedLeft) return;
    if (matchedIds.includes(rightPair.matchId)) return;

    audio.playTapSound();
    const leftPair = pairs.find((p) => p.left.id === selectedLeft);

    if (leftPair && leftPair.matchId === rightPair.matchId) {
      // Correct match!
      audio.playCorrectSound();
      const updated = [...matchedIds, rightPair.matchId];
      setMatchedIds(updated);
      setSelectedLeft(null);

      if (updated.length === pairs.length) {
        audio.playTrophySound();
        try {
          confetti({ particleCount: 50, spread: 60, origin: { y: 0.6 } });
        } catch {}
        audio.speak("Hebat! Semua pasangan berhasil kamu hubungkan!", {
          rate: 0.85,
          onEnd: () => onSuccess(),
        });
      }
    } else {
      // Mismatch
      audio.playEncouragementSound();
      audio.speak("Hampir tepat! Ayo cari pasangan yang cocok ya.", { rate: 0.85 });
      setSelectedLeft(null);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center p-4 max-w-2xl mx-auto select-none">
      <div className="text-center mb-6">
        <h3 className="text-2xl font-black text-[#25476A] font-child">
          🔗 Ayo Hubungkan Pasangan yang Cocok!
        </h3>
        <p className="text-sm text-slate-500 font-child">
          Pilih kartu di sebelah kiri, lalu sentuh pasangannya di sebelah kanan.
        </p>
      </div>

      <div className="w-full grid grid-cols-2 gap-6 sm:gap-12">
        {/* Left Column */}
        <div className="space-y-3.5">
          {pairs.map((p) => {
            const isMatched = matchedIds.includes(p.matchId);
            const isSelected = selectedLeft === p.left.id;
            return (
              <button
                key={p.left.id}
                onClick={() => handleSelectLeft(p.left.id, p.matchId, p.left.label)}
                disabled={isMatched}
                className={`w-full p-4 rounded-2xl border-3 flex items-center justify-between font-child font-bold text-xl sm:text-2xl transition-all shadow-md active:scale-95 ${
                  isMatched
                    ? "bg-emerald-100 border-emerald-400 text-emerald-800 opacity-60"
                    : isSelected
                    ? "bg-amber-100 border-amber-500 text-amber-900 scale-103 shadow-lg"
                    : "bg-white hover:bg-sky-50 border-sky-200 text-[#25476A]"
                }`}
              >
                <span>{p.left.label}</span>
                {isMatched ? (
                  <CheckCircle2 className="w-6 h-6 text-emerald-600" />
                ) : (
                  <span className="w-4 h-4 rounded-full bg-amber-400" />
                )}
              </button>
            );
          })}
        </div>

        {/* Right Column */}
        <div className="space-y-3.5">
          {rightItems.map((p) => {
            const isMatched = matchedIds.includes(p.matchId);
            return (
              <button
                key={p.right.id}
                onClick={() => handleSelectRight(p)}
                disabled={isMatched}
                className={`w-full p-4 rounded-2xl border-3 flex items-center justify-between font-child font-bold text-xl sm:text-2xl transition-all shadow-md active:scale-95 ${
                  isMatched
                    ? "bg-emerald-100 border-emerald-400 text-emerald-800 opacity-60"
                    : "bg-white hover:bg-amber-50 border-amber-200 text-[#25476A]"
                }`}
              >
                <div className="flex items-center gap-2">
                  {p.right.icon && <span className="text-2xl">{p.right.icon}</span>}
                  <span>{p.right.label}</span>
                </div>
                {isMatched ? (
                  <CheckCircle2 className="w-6 h-6 text-emerald-600" />
                ) : (
                  <span className="w-4 h-4 rounded-full bg-sky-400" />
                )}
              </button>
            );
          })}
        </div>
      </div>
    </div>
  );
};
