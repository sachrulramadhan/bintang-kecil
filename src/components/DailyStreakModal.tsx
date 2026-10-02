import React from "react";
import { X, Calendar, Star, Flame, Sparkles } from "lucide-react";
import { ChildProfile } from "../types";

interface DailyStreakModalProps {
  isOpen: boolean;
  child: ChildProfile;
  onClose: () => void;
}

export const DailyStreakModal: React.FC<DailyStreakModalProps> = ({
  isOpen,
  child,
  onClose,
}) => {
  if (!isOpen) return null;

  const days = ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"];
  const currentStreak = child.streak || 1;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 animate-in fade-in select-none">
      <div className="relative bg-white rounded-3xl max-w-md w-full border-4 border-amber-300 p-6 text-center shadow-2xl">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-10 h-10 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-full flex items-center justify-center transition-all"
        >
          <X className="w-5 h-5" />
        </button>

        <div className="w-16 h-16 rounded-2xl bg-amber-100 text-amber-500 mx-auto flex items-center justify-center text-3xl mb-3 shadow-inner">
          🔥
        </div>

        <h3 className="text-2xl font-black text-[#25476A] font-child mb-1">
          Streak Belajar Ceria!
        </h3>
        <p className="text-xs text-slate-500 font-child mb-6">
          Kamu sudah belajar <strong className="text-amber-600">{currentStreak} hari</strong> berturut-turut!
        </p>

        {/* 7 Days Streak Row */}
        <div className="grid grid-cols-7 gap-1.5 mb-6">
          {days.map((day, idx) => {
            const isDone = idx < currentStreak;
            return (
              <div
                key={day}
                className={`p-2.5 rounded-2xl border-2 flex flex-col items-center justify-between min-h-[72px] transition-all ${
                  isDone
                    ? "bg-amber-100 border-amber-400 text-amber-900 shadow-xs"
                    : "bg-slate-50 border-slate-200 text-slate-400"
                }`}
              >
                <span className="text-[10px] font-bold font-child uppercase">
                  {day}
                </span>
                <span className="text-xl">
                  {isDone ? "⭐" : "⚪"}
                </span>
              </div>
            );
          })}
        </div>

        <button
          onClick={onClose}
          className="w-full py-3 bg-gradient-to-r from-amber-400 to-orange-400 text-white rounded-2xl font-child font-black text-base shadow-md transition-transform active:scale-95"
        >
          Semangat Belajar Terus! 🐰
        </button>
      </div>
    </div>
  );
};
