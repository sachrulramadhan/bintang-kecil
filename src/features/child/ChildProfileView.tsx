import React from "react";
import { User, Star, Trophy, Sparkles, RefreshCw, LogOut } from "lucide-react";
import { ChildProfile } from "../../types";
import { storage } from "../../core/storage";
import { audio } from "../../core/audio";

interface ChildProfileViewProps {
  child: ChildProfile;
  onSwitchProfile: () => void;
  onProfileUpdated: (updated: ChildProfile) => void;
}

export const ChildProfileView: React.FC<ChildProfileViewProps> = ({
  child,
  onSwitchProfile,
  onProfileUpdated,
}) => {
  const avatarOptions = ["🐰", "🦁", "🐼", "🦊", "🐯", "🐨", "🐸", "🦄"];

  const handleSelectAvatar = (av: string) => {
    audio.playTapSound();
    const updated = { ...child, avatar: av };
    storage.saveChild(updated);
    onProfileUpdated(updated);
  };

  return (
    <div className="w-full max-w-3xl mx-auto p-4 sm:p-6 animate-in fade-in select-none">
      <div className="bg-white rounded-3xl border-4 border-amber-300 shadow-xl p-6 sm:p-8">
        {/* Child Identity Card */}
        <div className="flex flex-col sm:flex-row items-center gap-6 pb-6 border-b border-slate-100">
          <div className="w-28 h-28 rounded-full bg-gradient-to-tr from-amber-200 to-yellow-100 border-4 border-amber-400 flex items-center justify-center text-6xl shadow-md">
            {child.avatar || "🐰"}
          </div>

          <div className="text-center sm:text-left">
            <span className="text-xs font-bold text-sky-600 uppercase font-child tracking-wider">
              Profil Bintang Kecil
            </span>
            <h2 className="text-3xl font-black text-[#25476A] font-child">
              {child.nickname}
            </h2>
            <p className="text-sm font-semibold text-slate-500 font-child mt-0.5">
              Usia: {child.age} Tahun • Level {child.levelOverride || `${child.age - 1}-${child.age}`}
            </p>
          </div>
        </div>

        {/* Child Friendly Stats (Section 6.2 - strictly no complex charts) */}
        <div className="grid grid-cols-3 gap-4 py-6">
          <div className="bg-amber-50 border-2 border-amber-200 rounded-2xl p-4 text-center">
            <span className="text-2xl block mb-1">⭐</span>
            <span className="text-2xl font-black text-amber-950 font-child block">
              {child.stars}
            </span>
            <span className="text-xs font-bold text-amber-700 font-child">
              Total Bintang
            </span>
          </div>

          <div className="bg-purple-50 border-2 border-purple-200 rounded-2xl p-4 text-center">
            <span className="text-2xl block mb-1">🏆</span>
            <span className="text-2xl font-black text-purple-950 font-child block">
              {child.badges.length}
            </span>
            <span className="text-xs font-bold text-purple-700 font-child">
              Piala Diraih
            </span>
          </div>

          <div className="bg-emerald-50 border-2 border-emerald-200 rounded-2xl p-4 text-center">
            <span className="text-2xl block mb-1">🔥</span>
            <span className="text-2xl font-black text-emerald-950 font-child block">
              {child.streak} Hari
            </span>
            <span className="text-xs font-bold text-emerald-700 font-child">
              Streak Rajin
            </span>
          </div>
        </div>

        {/* Change Avatar */}
        <div className="py-4 border-t border-slate-100">
          <h4 className="text-base font-black text-[#25476A] font-child mb-3">
            Pilih Foto Hewan Kesukaanmu:
          </h4>
          <div className="flex items-center gap-3 flex-wrap">
            {avatarOptions.map((av) => (
              <button
                key={av}
                onClick={() => handleSelectAvatar(av)}
                className={`w-13 h-13 rounded-2xl text-3xl flex items-center justify-center transition-all shadow-sm active:scale-95 ${
                  child.avatar === av
                    ? "bg-amber-300 border-3 border-amber-500 scale-110 shadow-md"
                    : "bg-slate-100 hover:bg-amber-100 border border-slate-200"
                }`}
              >
                {av}
              </button>
            ))}
          </div>
        </div>

        {/* Switch Profile Button */}
        <div className="pt-6 border-t border-slate-100 flex justify-center">
          <button
            onClick={onSwitchProfile}
            className="flex items-center gap-2 px-6 py-3 bg-sky-100 hover:bg-sky-200 text-sky-800 rounded-2xl font-child font-black text-base shadow-sm transition-transform active:scale-95"
          >
            <RefreshCw className="w-5 h-5 text-sky-600" />
            <span>Ganti Anak / Pilih Profil</span>
          </button>
        </div>
      </div>
    </div>
  );
};
