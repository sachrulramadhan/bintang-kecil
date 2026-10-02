import React from "react";
import { motion } from "framer-motion";
import { Play, Trophy, Gift, User, Volume2, ArrowRight, Flame, Star } from "lucide-react";
import { ChildProfile, CategoryId } from "../../types";
import { CATEGORIES } from "../../data/categories";
import { DAILY_MISSIONS } from "../../data/badges";
import { BimoMascot } from "../../components/BimoMascot";
import { audio } from "../../core/audio";

interface ChildHomeProps {
  child: ChildProfile;
  onNavigateTab: (tab: any) => void;
  onSelectCategory: (catId: CategoryId) => void;
}

function greeting(): string {
  const h = new Date().getHours();
  if (h < 11) return "Selamat pagi";
  if (h < 15) return "Selamat siang";
  if (h < 18) return "Selamat sore";
  return "Selamat malam";
}

const QUICK = [
  { tab: "profile", label: "Profil", icon: User, bg: "from-sky-300 to-sky-500" },
  { tab: "achievements", label: "Piala", icon: Trophy, bg: "from-violet-300 to-violet-500" },
  { tab: "rewards", label: "Hadiah", icon: Gift, bg: "from-pink-300 to-rose-500" },
] as const;

export const ChildHome: React.FC<ChildHomeProps> = ({ child, onNavigateTab, onSelectCategory }) => {
  const available = CATEGORIES.filter(
    (c) => child.enabledCategories.length === 0 || child.enabledCategories.includes(c.id)
  );

  const askBimo = () => {
    audio.playTapSound();
    audio.speak(`${greeting()}, ${child.nickname}! Bimo senang sekali bermain bersamamu. Mau main permainan kata atau dengar cerita?`);
  };

  return (
    <div className="w-full max-w-6xl mx-auto space-y-6 sm:space-y-8 select-none">
      {/* ===== HERO ===== */}
      <section className="relative overflow-hidden rounded-[36px] border-4 border-white shadow-[0_8px_0_#7fb9e0,0_20px_30px_-14px_rgba(37,71,106,.45)] bg-gradient-to-br from-[#5CB8FF] via-[#7CCBFF] to-[#B4E4FF] p-5 sm:p-8">
        {/* dekor */}
        <span className="twinkle absolute top-4 left-[52%] text-2xl">⭐</span>
        <span className="twinkle absolute top-14 right-[8%] text-xl" style={{ animationDelay: ".8s" }}>✨</span>
        <span className="twinkle absolute bottom-10 left-[40%] text-xl" style={{ animationDelay: "1.4s" }}>⭐</span>
        <div className="absolute -bottom-10 -left-6 w-56 h-24 rounded-full bg-white/40" />
        <div className="absolute -bottom-12 left-32 w-72 h-28 rounded-full bg-white/30" />

        <div className="relative grid grid-cols-5 items-center gap-2">
          <div className="col-span-3">
            <div className="inline-flex items-center gap-2 bg-white/80 text-[#25476A] font-display font-bold text-xs sm:text-sm px-3 py-1 rounded-full mb-3 shadow-sm">
              <Star className="w-4 h-4 text-amber-500 fill-amber-400" /> Petualangan Belajar Bimo
            </div>
            <h1 className="font-display font-bold text-white text-[26px] sm:text-5xl leading-tight drop-shadow-[0_3px_0_rgba(37,71,106,.35)]">
              {greeting()},<br />{child.nickname}! 👋
            </h1>
            <p className="font-child font-bold text-[#17496e] bg-white/70 inline-block rounded-2xl px-3 py-1.5 mt-3 text-sm sm:text-base">
              Yuk belajar sambil bermain!
            </p>
            <div className="mt-5 flex flex-wrap items-center gap-3">
              <button
                onClick={() => { audio.playTapSound(); onNavigateTab("play"); }}
                className="btn-chunky pulse-ring text-lg sm:text-2xl whitespace-nowrap !px-5 sm:!px-8"
              >
                <Play className="w-6 h-6 fill-current" /> Ayo Main!
              </button>
              <button
                onClick={askBimo}
                aria-label="Dengarkan Bimo"
                className="w-14 h-14 rounded-full bg-white text-sky-600 border-3 border-sky-200 shadow-[0_5px_0_#9fcdee] flex items-center justify-center active:translate-y-1 active:shadow-none transition"
              >
                <Volume2 className="w-7 h-7" />
              </button>
            </div>
          </div>

          <div className="col-span-2 flex justify-end items-end">
            <div className="relative">
              <div style={{ transform: "scaleX(-1)" }}>
                <BimoMascot full view="three" size="xl" expression="happy" hat={child.equippedHat} glasses={child.equippedGlasses} className="scale-[.8] sm:scale-100 origin-bottom" />
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ===== STATISTIK ANAK (sederhana) + AKSES CEPAT ===== */}
      <section className="grid grid-cols-2 gap-3 sm:gap-4">
        <div className="bk-card p-3 sm:p-4 flex items-center gap-3">
          <div className="w-12 h-12 rounded-2xl bg-amber-100 flex items-center justify-center text-2xl">⭐</div>
          <div><div className="font-display font-bold text-2xl leading-none">{child.stars}</div><div className="text-xs font-bold text-slate-500">Bintang</div></div>
        </div>
        <div className="bk-card p-3 sm:p-4 flex items-center gap-3">
          <div className="w-12 h-12 rounded-2xl bg-orange-100 flex items-center justify-center"><Flame className="w-7 h-7 text-orange-500 fill-orange-400" /></div>
          <div><div className="font-display font-bold text-2xl leading-none">{child.streak}</div><div className="text-xs font-bold text-slate-500">Hari berturut</div></div>
        </div>
      </section>
      <section className="grid grid-cols-3 gap-3 sm:gap-4 -mt-2">
        {QUICK.map((q) => (
          <button
            key={q.tab}
            onClick={() => { audio.playTapSound(); onNavigateTab(q.tab); }}
            className={`tile bg-gradient-to-b ${q.bg} p-3 sm:p-4 flex flex-col sm:flex-row items-center justify-center gap-1 sm:gap-3 text-white`}
          >
            <q.icon className="w-7 h-7 sm:w-8 sm:h-8 drop-shadow" />
            <span className="font-display font-bold text-base sm:text-lg drop-shadow">{q.label}</span>
          </button>
        ))}
      </section>

      {/* ===== MISI HARIAN ===== */}
      <section className="bk-card p-4 sm:p-6">
        <div className="flex items-center justify-between mb-3">
          <h2 className="font-display font-bold text-xl sm:text-2xl flex items-center gap-2">🎯 Misi Harian Ceria</h2>
          <span className="text-xs font-bold bg-amber-100 text-amber-800 px-3 py-1 rounded-full">Bonus bintang ⭐</span>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
          {DAILY_MISSIONS.map((m) => {
            const pct = Math.min(100, Math.round((m.current / m.target) * 100));
            return (
              <div key={m.id} className="bg-sky-50 rounded-2xl p-3 border-2 border-sky-100">
                <div className="flex items-start justify-between gap-2 mb-2">
                  <span className="font-child font-bold text-sm leading-snug">{m.icon} {m.title}</span>
                  <span className="shrink-0 text-xs font-extrabold text-amber-600">+{m.rewardStars}⭐</span>
                </div>
                <div className="h-3.5 bg-white rounded-full overflow-hidden border border-sky-100">
                  <div className="h-full rounded-full bg-gradient-to-r from-emerald-400 to-lime-400 transition-all" style={{ width: `${pct}%` }} />
                </div>
              </div>
            );
          })}
        </div>
      </section>

      {/* ===== KATEGORI ===== */}
      <section>
        <div className="flex items-end justify-between mb-3 sm:mb-4">
          <h2 className="font-display font-bold text-2xl sm:text-3xl text-[#17496e] drop-shadow-[0_2px_0_rgba(255,255,255,.8)]">Mau belajar apa hari ini?</h2>
          <button onClick={() => onNavigateTab("library")} className="font-display font-bold text-sky-700 flex items-center gap-1 text-sm">
            Semua <ArrowRight className="w-4 h-4" />
          </button>
        </div>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3 sm:gap-5">
          {available.map((cat, i) => (
            <motion.button
              key={cat.id}
              initial={{ opacity: 0, y: 18, scale: 0.95 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              transition={{ delay: i * 0.05, type: "spring", stiffness: 260, damping: 20 }}
              onClick={() => { audio.playTapSound(); onSelectCategory(cat.id); }}
              className={`tile bg-gradient-to-br ${cat.gradient} text-white p-4 sm:p-5 min-h-[150px] sm:min-h-[180px] flex flex-col justify-between`}
            >
              <span className="absolute -right-3 -top-3 text-[84px] sm:text-[110px] opacity-25 rotate-12 leading-none">{cat.icon}</span>
              <span className="relative text-5xl sm:text-6xl drop-shadow-md">{cat.icon}</span>
              <span className="relative">
                <span className="block font-display font-bold text-xl sm:text-2xl leading-tight drop-shadow">{cat.name}</span>
                <span className="block font-child font-semibold text-xs sm:text-sm text-white/90 line-clamp-1">{cat.tagline}</span>
              </span>
            </motion.button>
          ))}
        </div>
      </section>
    </div>
  );
};
