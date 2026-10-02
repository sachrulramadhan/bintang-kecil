import React, { useState } from "react";
import { Settings, HelpCircle, Calendar, Volume2 } from "lucide-react";
import { ChildProfile } from "../types";
import { audio } from "../core/audio";

interface StatusHeaderProps {
  child: ChildProfile;
  onOpenParentGate: () => void;
  onOpenStreakModal?: () => void;
  pageHelpText?: string;
}

export const StatusHeader: React.FC<StatusHeaderProps> = ({
  child,
  onOpenParentGate,
  onOpenStreakModal,
  pageHelpText = "Halo teman kecil! Pilih kartu yang kamu sukai untuk mulai belajar dan bermain!",
}) => {
  const [isSpeaking, setIsSpeaking] = useState(false);

  const handleHelp = () => {
    if (isSpeaking) {
      audio.stopSpeaking();
      setIsSpeaking(false);
      return;
    }
    setIsSpeaking(true);
    audio.playTapSound();
    audio.speak(pageHelpText, {
      onEnd: () => setIsSpeaking(false),
    });
  };

  return (
    <header className="w-full bg-white/95 backdrop-blur-md border-b-2 border-amber-200/70 shadow-xs px-3 sm:px-6 py-2 select-none transition-all">
      <div className="w-full max-w-6xl mx-auto flex items-center justify-between gap-2">
        {/* 
          Left: 3 Round Yellow Utility Buttons (Streak 📅, Help ❓, Parent Settings ⚙️)
          Integrated into top bar so they never squish the main content width on mobile phones!
        */}
        <div className="flex items-center gap-1.5 sm:gap-2">
          {/* Streak Calendar Button */}
          <button
            onClick={onOpenStreakModal}
            className="w-9 h-9 sm:w-11 sm:h-11 bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-2 border-amber-400 rounded-full flex items-center justify-center text-amber-950 shadow-sm transition-all active:scale-90 hover:scale-105"
            title="Streak Belajar Harian"
          >
            <Calendar className="w-4 h-4 sm:w-5 sm:h-5" />
          </button>

          {/* Voice Help Button */}
          <button
            onClick={handleHelp}
            className={`w-9 h-9 sm:w-11 sm:h-11 rounded-full flex items-center justify-center border-2 transition-all active:scale-90 hover:scale-105 shadow-sm ${
              isSpeaking
                ? "bg-pink-400 border-pink-500 text-white animate-bounce ring-3 ring-pink-200"
                : "bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-amber-400 text-amber-950"
            }`}
            title="Bantuan Suara Bimo"
          >
            {isSpeaking ? (
              <Volume2 className="w-4 h-4 sm:w-5 sm:h-5 animate-pulse" />
            ) : (
              <HelpCircle className="w-4 h-4 sm:w-5 sm:h-5" />
            )}
          </button>

          {/* Parental Settings Button */}
          <button
            onClick={onOpenParentGate}
            className="w-9 h-9 sm:w-11 sm:h-11 bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-2 border-amber-400 rounded-full flex items-center justify-center text-amber-950 shadow-sm transition-all active:scale-90 hover:scale-105"
            title="Pengaturan Orang Tua"
          >
            <Settings className="w-4 h-4 sm:w-5 sm:h-5" />
          </button>
        </div>

        {/* 
          Right: Stats Pills (⭐ Bintang, 🍩 Donat, 🪙 Koin)
          Comfortably spaced and clear
        */}
        <div className="flex items-center gap-1.5 sm:gap-2.5">
          {/* Star Pill */}
          <div className="flex items-center gap-1 sm:gap-1.5 bg-amber-50 border-2 border-amber-300 px-2.5 sm:px-3 py-1 rounded-full shadow-xs">
            <span className="text-sm sm:text-base text-amber-500 animate-pulse">⭐</span>
            <span className="font-extrabold text-[#25476A] text-xs sm:text-sm font-child">
              {child.stars}
            </span>
          </div>

          {/* Donut Pill */}
          <div className="flex items-center gap-1 sm:gap-1.5 bg-pink-50 border-2 border-pink-300 px-2.5 sm:px-3 py-1 rounded-full shadow-xs">
            <span className="text-sm sm:text-base">🍩</span>
            <span className="font-extrabold text-[#25476A] text-xs sm:text-sm font-child">
              {child.donuts}
            </span>
          </div>

          {/* Coins Pill */}
          <div className="flex items-center gap-1 sm:gap-1.5 bg-yellow-50 border-2 border-yellow-300 px-2.5 sm:px-3 py-1 rounded-full shadow-xs">
            <span className="text-sm sm:text-base">🪙</span>
            <span className="font-extrabold text-[#25476A] text-xs sm:text-sm font-child">
              {child.coins}
            </span>
          </div>
        </div>
      </div>
    </header>
  );
};
