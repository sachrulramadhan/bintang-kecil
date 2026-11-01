import React, { useState } from "react";
import { User, LogOut, Sparkles } from "lucide-react";
import { BimoMascot } from "../../components/BimoMascot";
import { storage } from "../../core/storage";
import { CategoryId, ChildProfile, ParentAccount } from "../../types";

interface FirstChildScreenProps {
  parent: ParentAccount;
  onDone: () => void;
  onLogout: () => void;
}

const ALL_CATEGORIES: CategoryId[] = [
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

export const FirstChildScreen: React.FC<FirstChildScreenProps> = ({
  parent,
  onDone,
  onLogout,
}) => {
  const [nickname, setNickname] = useState("");
  const [age, setAge] = useState(2);
  const [avatar, setAvatar] = useState("🐰");
  const [errorMsg, setErrorMsg] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!nickname.trim()) {
      setErrorMsg("Mohon isi nama panggilan anak.");
      return;
    }

    const child: ChildProfile = {
      id: `child_${Date.now()}`,
      parentId: parent.id,
      nickname: nickname.trim(),
      birthDate: new Date(Date.now() - age * 365 * 24 * 3600 * 1000)
        .toISOString()
        .slice(0, 10),
      age,
      avatar,
      enabledCategories: ALL_CATEGORIES,
      languages: ["id"],
      dailyLimitMin: 30,
      difficultyMode: "auto",
      audio: { volume: 80, narration: true, music: true, sfx: true },
      stars: 15,
      coins: 75,
      donuts: 3,
      badges: ["badge_first_step"],
      ownedItems: [],
      worldState: {
        unlockedAreas: ["home", "park"],
        decorations: {},
      },
      streak: 1,
      lastActiveDate: new Date().toISOString().slice(0, 10),
      todaySecondsPlayed: 0,
    };
    storage.saveChild(child);
    storage.setActiveChildId(child.id);
    onDone();
  };

  return (
    <div className="min-h-screen bg-child-pattern px-3 py-6 sm:px-5 lg:px-8 select-none">
      <div className="mx-auto max-w-2xl">
        <div className="mb-5 flex items-center justify-between gap-3 rounded-2xl border border-white/70 bg-white/80 px-4 py-3 shadow-sm backdrop-blur-sm">
          <div>
            <p className="text-sm font-black text-[#25476A]">Halo, {parent.name} 👋</p>
            <p className="text-xs font-semibold text-slate-500">
              Masuk sebagai @{parent.username || parent.email}
            </p>
          </div>
          <button
            type="button"
            onClick={onLogout}
            className="inline-flex items-center gap-1.5 rounded-xl border border-rose-200 bg-rose-50 px-3 py-2 text-xs font-extrabold text-rose-700 transition hover:bg-rose-100"
          >
            <LogOut className="h-3.5 w-3.5" /> Keluar
          </button>
        </div>

        <div className="overflow-hidden rounded-[32px] border-4 border-white/80 bg-white/95 shadow-[0_24px_70px_-24px_rgba(37,71,106,0.35)] backdrop-blur-sm">
          <div className="flex flex-col items-center gap-3 bg-gradient-to-b from-sky-50 to-white px-6 py-7 text-center">
            <BimoMascot expression="happy" size="md" />
            <span className="inline-flex items-center gap-1.5 rounded-full bg-amber-100 px-3 py-1 text-[10px] font-extrabold uppercase tracking-[0.2em] text-amber-800">
              <Sparkles className="h-3 w-3" /> Langkah pertama
            </span>
            <h1 className="font-display text-2xl font-bold text-[#21466D] sm:text-3xl">
              Buat profil anak pertama
            </h1>
            <p className="max-w-md text-sm font-semibold text-slate-500">
              Akun Anda sudah aktif. Tambahkan profil buah hati untuk mulai belajar bersama
              Bimo.
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-5 px-5 py-6 sm:px-8">
            {errorMsg && (
              <div role="alert" className="rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-bold text-rose-600">
                {errorMsg}
              </div>
            )}

            <label className="relative block">
              <User className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
              <input
                type="text"
                placeholder="Nama panggilan anak (cth: Adit)"
                value={nickname}
                onChange={(e) => setNickname(e.target.value)}
                className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                required
              />
            </label>

            <label className="block">
              <span className="mb-2 block text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-500">
                Usia anak
              </span>
              <select
                value={age}
                onChange={(e) => setAge(parseInt(e.target.value, 10))}
                className="w-full rounded-2xl border border-slate-200 bg-slate-50 px-3 py-3 text-sm font-semibold text-slate-700 focus:border-sky-400 focus:bg-white focus:outline-none"
              >
                <option value={2}>Usia 2-3 Tahun (Pemula 🌱)</option>
                <option value={4}>Usia 4-5 Tahun (Berkembang 🌿)</option>
                <option value={6}>Usia 6-7 Tahun (Lanjutan 🌳)</option>
                <option value={8}>Usia 8-10 Tahun (Kritis 🚀)</option>
                <option value={11}>Usia 11-12 Tahun (Penalaran 🧠)</option>
              </select>
            </label>

            <div>
              <p className="mb-2 text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-500">
                Pilih Avatar Hewan Lucu
              </p>
              <div className="flex flex-wrap gap-2">
                {["🐰", "🦁", "🐼", "🦊", "🦄", "🐯"].map((option) => (
                  <button
                    key={option}
                    type="button"
                    onClick={() => setAvatar(option)}
                    className={`flex h-12 w-12 items-center justify-center rounded-2xl border text-xl transition-all ${
                      avatar === option
                        ? "scale-105 border-amber-400 bg-amber-100 shadow-[0_8px_18px_rgba(251,191,36,0.35)]"
                        : "border-slate-200 bg-slate-50 hover:border-sky-200 hover:bg-sky-50"
                    }`}
                  >
                    {option}
                  </button>
                ))}
              </div>
            </div>

            <button
              type="submit"
              className="w-full rounded-2xl border border-amber-500 bg-gradient-to-r from-[#FFD75A] via-[#FFC933] to-[#FFB347] px-5 py-3.5 text-base font-black text-amber-950 shadow-[0_6px_0_#E39A00,0_18px_24px_-8px_rgba(255,179,71,0.65)] transition-transform active:scale-[0.98]"
            >
              Simpan & Mulai Belajar 🚀
            </button>
          </form>
        </div>
      </div>
    </div>
  );
};
