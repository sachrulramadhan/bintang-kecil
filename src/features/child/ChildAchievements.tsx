import React, { useState, useEffect } from "react";
import {
  Trophy,
  Star,
  CheckCircle2,
  Lock,
  Sparkles,
  Volume2,
  Gift,
  X,
  Flame,
  Award,
} from "lucide-react";
import { ChildProfile, Badge } from "../../types";
import { ALL_BADGES } from "../../data/badges";
import { storage } from "../../core/storage";
import { audio } from "../../core/audio";
import confetti from "canvas-confetti";

interface ChildAchievementsProps {
  child: ChildProfile;
  onProfileUpdated?: () => void;
}

export const ChildAchievements: React.FC<ChildAchievementsProps> = ({
  child,
  onProfileUpdated,
}) => {
  const [filter, setFilter] = useState<"all" | "unlocked" | "locked">("all");
  const [selectedBadge, setSelectedBadge] = useState<Badge | null>(null);
  const [newlyUnlockedCount, setNewlyUnlockedCount] = useState(0);

  // Auto-evaluate badges based on current child progress (e.g. 18 stars => unlocks star_10 badge!)
  useEffect(() => {
    const earned = storage.checkAndAwardBadges(child.id);
    if (earned.length > 0) {
      setNewlyUnlockedCount(earned.length);
      audio.playCorrectSound();
      audio.playTrophySound();
      try {
        confetti({ particleCount: 80, spread: 80, origin: { y: 0.5 } });
      } catch {}
      audio.speak(
        `Horeee! Selamat ${child.nickname}! Kamu berhasil membuka piala baru dari prestasimu!`,
        { rate: 0.85 }
      );
      onProfileUpdated?.();
    }
  }, [child.id, child.stars]);

  // Read latest child data directly from storage
  const currentChild = storage.getChild(child.id) || child;
  const unlockedBadges = new Set(currentChild.badges || []);
  const earnedCount = unlockedBadges.size;

  // Calculate real progress for any badge
  const getBadgeProgress = (badge: Badge) => {
    const isUnlocked = unlockedBadges.has(badge.id);
    if (isUnlocked) {
      return { current: badge.reqValue, target: badge.reqValue, percent: 100, label: "Terbuka! ⭐" };
    }

    let current = 0;
    const target = badge.reqValue;

    if (badge.reqType === "stars") {
      current = currentChild.stars;
    } else if (badge.reqType === "modules") {
      const prog = storage.getModuleProgress(child.id);
      current = Object.values(prog).filter(
        (p) => p.status === "done" || Boolean(p.completedAt)
      ).length;
    } else if (badge.reqType === "games") {
      const attempts = storage.getAttempts(child.id);
      current = attempts.length;
    } else if (badge.reqType === "skill") {
      const attempts = storage.getAttempts(child.id);
      if (badge.category === "literacy") {
        current = attempts.filter((a) => a.category === "indonesian" || a.category === "english").length;
      } else if (badge.category === "math") {
        current = attempts.filter((a) => a.category === "mathematics").length;
      } else if (badge.category === "science") {
        current = attempts.filter((a) => a.category === "science").length;
      } else {
        current = attempts.length;
      }
    } else if (badge.reqType === "streak") {
      current = Math.min(target, Math.floor(currentChild.stars / 5));
    }

    const percent = Math.min(100, Math.round((current / target) * 100));
    const remaining = Math.max(0, target - current);
    const label = `${current} / ${target} (Kurang ${remaining} lagi)`;

    return { current, target, percent, label };
  };

  const filteredBadges = ALL_BADGES.filter((b) => {
    const isUnlocked = unlockedBadges.has(b.id);
    if (filter === "unlocked") return isUnlocked;
    if (filter === "locked") return !isUnlocked;
    return true;
  });

  const handleBadgeClick = (badge: Badge) => {
    audio.playTapSound();
    setSelectedBadge(badge);

    const isUnlocked = unlockedBadges.has(badge.id);
    if (isUnlocked) {
      audio.speak(`Piala ${badge.title}! ${badge.description}`, { rate: 0.85 });
    } else {
      const prog = getBadgeProgress(badge);
      audio.speak(
        `Piala ${badge.title}. ${badge.description}. Progresmu saat ini ${prog.current} dari ${prog.target}. Ayo terus bermain!`,
        { rate: 0.85 }
      );
    }
  };

  return (
    <div className="w-full max-w-6xl mx-auto space-y-6 select-none animate-in fade-in">
      {/* Top Banner */}
      <div className="relative overflow-hidden bg-gradient-to-r from-amber-400 via-amber-300 to-yellow-300 p-5 sm:p-7 rounded-[32px] border-4 border-amber-400 text-amber-950 shadow-xl flex flex-col sm:flex-row items-center justify-between gap-4">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-3xl bg-white/90 text-amber-600 flex items-center justify-center text-4xl sm:text-5xl shadow-md border-2 border-amber-200 shrink-0 transform hover:rotate-6 transition-transform">
            🏆
          </div>
          <div>
            <div className="inline-flex items-center gap-1.5 bg-amber-900/15 px-3 py-1 rounded-full text-xs font-bold font-child uppercase tracking-wider mb-1">
              <Sparkles className="w-3.5 h-3.5" />
              Koleksi Kebanggaan
            </div>
            <h2 className="text-2xl sm:text-3xl font-black font-child tracking-wide">
              Ruang Piala & Lencana Hebat!
            </h2>
            <p className="text-xs sm:text-sm font-bold text-amber-900/90 font-child max-w-lg mt-0.5">
              Setiap aktivitas belajarmu mengumpulkan piala juara bersama Bimo!
            </p>
          </div>
        </div>

        {/* Counter Badge */}
        <div className="flex items-center gap-3 bg-white/95 px-5 py-3 rounded-2xl border-2 border-amber-300 shadow-md shrink-0">
          <Award className="w-8 h-8 text-amber-500" />
          <div>
            <span className="text-[11px] font-bold text-slate-500 uppercase font-child block">
              Piala Diraih
            </span>
            <span className="text-xl sm:text-2xl font-black text-amber-950 font-child">
              {earnedCount} <span className="text-sm text-slate-400">/ {ALL_BADGES.length}</span>
            </span>
          </div>
        </div>
      </div>

      {/* Filter Tabs */}
      <div className="flex items-center justify-between flex-wrap gap-2">
        <div className="flex items-center gap-2 bg-white/80 p-1.5 rounded-2xl border-2 border-sky-100 shadow-xs">
          <button
            onClick={() => {
              audio.playTapSound();
              setFilter("all");
            }}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-child font-bold transition-all ${
              filter === "all"
                ? "bg-amber-400 text-amber-950 shadow-sm"
                : "text-slate-600 hover:bg-slate-100"
            }`}
          >
            Semua ({ALL_BADGES.length})
          </button>
          <button
            onClick={() => {
              audio.playTapSound();
              setFilter("unlocked");
            }}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-child font-bold transition-all ${
              filter === "unlocked"
                ? "bg-amber-400 text-amber-950 shadow-sm"
                : "text-slate-600 hover:bg-slate-100"
            }`}
          >
            ⭐ Terbuka ({earnedCount})
          </button>
          <button
            onClick={() => {
              audio.playTapSound();
              setFilter("locked");
            }}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-child font-bold transition-all ${
              filter === "locked"
                ? "bg-amber-400 text-amber-950 shadow-sm"
                : "text-slate-600 hover:bg-slate-100"
            }`}
          >
            🔒 Terkunci ({ALL_BADGES.length - earnedCount})
          </button>
        </div>

        <span className="text-xs font-bold text-slate-500 font-child bg-white px-3 py-1.5 rounded-full border border-slate-200">
          💡 Sentuh piala untuk melihat cara membukanya!
        </span>
      </div>

      {/* Badges Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-5">
        {filteredBadges.map((badge) => {
          const isUnlocked = unlockedBadges.has(badge.id);
          const prog = getBadgeProgress(badge);

          return (
            <div
              key={badge.id}
              onClick={() => handleBadgeClick(badge)}
              className={`relative p-5 rounded-3xl border-3 transition-all duration-200 cursor-pointer flex flex-col justify-between group active:scale-97 ${
                isUnlocked
                  ? "bg-white hover:bg-amber-50/50 border-amber-300 shadow-md hover:shadow-xl hover:border-amber-400"
                  : "bg-white/60 hover:bg-white border-slate-200/90 opacity-80 hover:opacity-100 shadow-xs"
              }`}
            >
              {/* Top Row: Icon + Title + Unlocked Badge */}
              <div className="flex items-start gap-3.5 mb-3">
                <div
                  className={`w-14 h-14 sm:w-16 sm:h-16 rounded-2xl flex items-center justify-center text-3xl shadow-sm shrink-0 transition-transform group-hover:scale-105 ${
                    isUnlocked
                      ? "bg-gradient-to-tr from-amber-300 to-yellow-400 border-2 border-amber-400 text-amber-950"
                      : "bg-slate-100 border border-slate-200 text-slate-400"
                  }`}
                >
                  {isUnlocked ? (
                    badge.icon
                  ) : (
                    <Lock className="w-6 h-6 text-slate-400" />
                  )}
                </div>

                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-1.5 mb-0.5">
                    <h4 className="font-child font-black text-base text-[#25476A] truncate">
                      {badge.title}
                    </h4>
                    {isUnlocked && (
                      <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0" />
                    )}
                  </div>
                  <p className="text-xs text-slate-500 font-child line-clamp-2 leading-relaxed">
                    {badge.description}
                  </p>
                </div>
              </div>

              {/* Bottom Progress Bar */}
              <div className="pt-2 border-t border-slate-100 mt-auto">
                <div className="flex items-center justify-between text-[11px] font-child font-bold mb-1">
                  <span
                    className={
                      isUnlocked
                        ? "text-emerald-600 flex items-center gap-1"
                        : "text-amber-700"
                    }
                  >
                    {isUnlocked ? "Sudah Terbuka 🎉" : prog.label}
                  </span>
                  <span className="text-slate-400 font-extrabold">{prog.percent}%</span>
                </div>

                <div className="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden border border-slate-200">
                  <div
                    className={`h-full rounded-full transition-all duration-300 ${
                      isUnlocked
                        ? "bg-gradient-to-r from-emerald-400 to-green-500"
                        : "bg-gradient-to-r from-amber-400 to-orange-400"
                    }`}
                    style={{ width: `${prog.percent}%` }}
                  />
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {/* Selected Badge Detail Modal */}
      {selectedBadge && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs animate-in fade-in">
          <div className="bg-white rounded-[36px] max-w-md w-full p-6 sm:p-8 border-4 border-amber-300 shadow-2xl relative text-center flex flex-col items-center">
            {/* Close Button */}
            <button
              onClick={() => {
                audio.playTapSound();
                setSelectedBadge(null);
              }}
              className="absolute top-4 right-4 w-10 h-10 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-full flex items-center justify-center transition-all"
            >
              <X className="w-5 h-5" />
            </button>

            {/* Big Icon */}
            <div
              className={`w-24 h-24 rounded-3xl flex items-center justify-center text-6xl shadow-xl my-2 border-3 ${
                unlockedBadges.has(selectedBadge.id)
                  ? "bg-gradient-to-tr from-amber-300 via-yellow-300 to-amber-400 border-amber-400 animate-bounce"
                  : "bg-slate-100 border-slate-200 text-slate-400"
              }`}
            >
              {unlockedBadges.has(selectedBadge.id) ? (
                selectedBadge.icon
              ) : (
                <Lock className="w-10 h-10 text-slate-400" />
              )}
            </div>

            {/* Title & Status */}
            <h3 className="text-2xl font-black text-[#25476A] font-child mt-3">
              {selectedBadge.title}
            </h3>

            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold font-child uppercase tracking-wider my-2 bg-amber-100 text-amber-900">
              {unlockedBadges.has(selectedBadge.id) ? (
                <>
                  <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                  <span>Piala Berhasil Diraih!</span>
                </>
              ) : (
                <>
                  <Lock className="w-3.5 h-3.5 text-amber-700" />
                  <span>Masih Terkunci</span>
                </>
              )}
            </div>

            <p className="text-sm font-semibold text-slate-600 font-child my-2 leading-relaxed">
              {selectedBadge.description}
            </p>

            {/* Progress Info */}
            <div className="w-full bg-sky-50 rounded-2xl p-4 border border-sky-100 my-3 text-left">
              <div className="flex items-center justify-between text-xs font-bold text-[#25476A] font-child mb-1.5">
                <span>Target Prestasi:</span>
                <span>{getBadgeProgress(selectedBadge).label}</span>
              </div>
              <div className="w-full bg-slate-200 h-3 rounded-full overflow-hidden">
                <div
                  className="bg-emerald-500 h-full rounded-full transition-all"
                  style={{ width: `${getBadgeProgress(selectedBadge).percent}%` }}
                />
              </div>
            </div>

            {/* Action Buttons */}
            <div className="flex items-center gap-3 w-full mt-2">
              <button
                onClick={() => {
                  audio.playTapSound();
                  audio.speak(
                    `Piala ${selectedBadge.title}. ${selectedBadge.description}`
                  );
                }}
                className="flex-1 py-3 px-4 rounded-2xl bg-amber-100 hover:bg-amber-200 text-amber-950 font-child font-bold text-sm flex items-center justify-center gap-2 transition-all active:scale-95"
              >
                <Volume2 className="w-4 h-4" />
                <span>Dengar Bimo</span>
              </button>

              <button
                onClick={() => {
                  audio.playTrophySound();
                  try {
                    confetti({ particleCount: 50, spread: 60, origin: { y: 0.6 } });
                  } catch {}
                }}
                className="py-3 px-5 rounded-2xl bg-gradient-to-r from-amber-400 to-yellow-400 hover:from-amber-500 hover:to-yellow-500 text-amber-950 font-child font-black text-sm flex items-center justify-center gap-1.5 transition-all shadow-md active:scale-95 border border-amber-400"
              >
                <Sparkles className="w-4 h-4" />
                <span>Kembang Api!</span>
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
