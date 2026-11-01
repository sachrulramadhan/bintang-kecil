import React, { useState } from "react";
import { Lock, User, ShieldCheck, Sparkles, KeyRound } from "lucide-react";
import { BimoMascot } from "../../components/BimoMascot";
import { AppUser } from "../../types";

interface ParentAuthScreenProps {
  onAuthSuccess: (user: AppUser) => void;
}

export const ParentAuthScreen: React.FC<ParentAuthScreenProps> = ({ onAuthSuccess }) => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errorMsg, setErrorMsg] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!username.trim() || !password) {
      setErrorMsg("Mohon isi username dan kata sandi.");
      return;
    }

    setIsSubmitting(true);
    setErrorMsg("");
    try {
      const response = await fetch("/api/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "same-origin",
        body: JSON.stringify({ username: username.trim(), password }),
      });
      const body: unknown = await response.json().catch(() => ({}));
      if (!response.ok) {
        const message =
          body && typeof body === "object" && "error" in body && typeof body.error === "string"
            ? body.error
            : "Login gagal. Periksa koneksi lalu coba lagi.";
        throw new Error(message);
      }
      const user =
        body && typeof body === "object" && "user" in body
          ? (body as { user: AppUser }).user
          : null;
      if (!user) throw new Error("Respons login tidak valid.");
      setPassword("");
      onAuthSuccess(user);
    } catch (cause) {
      setErrorMsg(cause instanceof Error ? cause.message : "Login gagal. Coba lagi.");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="min-h-screen bg-child-pattern px-3 py-5 sm:px-5 lg:px-8 select-none">
      <div className="mx-auto max-w-6xl overflow-hidden rounded-[32px] border-4 border-white/80 bg-white/90 shadow-[0_28px_80px_-20px_rgba(37,71,106,0.3)] backdrop-blur-sm">
        <div className="grid lg:grid-cols-[1.02fr_1.38fr]">
          <aside className="relative overflow-hidden bg-gradient-to-b from-[#45A9FF] via-[#2E82F6] to-[#1659D6] p-6 sm:p-8 lg:p-10 text-white">
            <div className="absolute -left-10 top-8 h-32 w-32 rounded-full bg-white/15 blur-3xl" />
            <div className="absolute -bottom-10 right-6 h-36 w-36 rounded-full bg-cyan-200/20 blur-3xl" />
            <div className="absolute left-6 top-16 text-sm text-yellow-100/90">✦</div>
            <div className="absolute right-8 top-20 text-lg text-cyan-100/90">★</div>
            <div className="absolute bottom-16 right-12 text-xl text-orange-100/90">☁️</div>

            <div className="relative z-10 flex h-full flex-col justify-between">
              <div className="text-center lg:text-left">
                <div className="inline-flex items-center gap-2 rounded-full border border-white/30 bg-white/12 px-3 py-1 text-[10px] font-extrabold uppercase tracking-[0.2em] text-yellow-100 shadow-inner">
                  <Sparkles className="h-3.5 w-3.5 text-yellow-300" />
                  Edukasi Ramah Anak
                </div>
                <h1 className="mt-4 font-display text-3xl font-bold tracking-wide text-white sm:text-4xl">
                  BINTANG KECIL
                </h1>
                <p className="mt-2 text-sm font-semibold text-sky-100">
                  Belajar Seru Bersama Kelinci Bimo <span className="text-lg">🐰</span>
                </p>
              </div>

              <div className="my-8 flex justify-center">
                <div className="relative">
                  <div className="absolute inset-3 rounded-full bg-yellow-200/35 blur-2xl" />
                  <div className="relative rounded-full border-4 border-white/70 bg-white/10 p-4 shadow-[0_18px_40px_rgba(15,89,188,0.35)] backdrop-blur-sm">
                    <BimoMascot expression="happy" size="lg" className="drop-shadow-[0_12px_15px_rgba(10,40,90,0.2)]" />
                  </div>
                </div>
              </div>

              <div className="space-y-3 text-sm font-bold text-sky-50">
                <div className="flex items-center gap-3 rounded-2xl border border-white/20 bg-white/8 px-3 py-2">
                  <ShieldCheck className="h-4 w-4 text-amber-300" />
                  <span>100% Bebas Iklan & Pelacak</span>
                </div>
                <div className="flex items-center gap-3 rounded-2xl border border-white/20 bg-white/8 px-3 py-2">
                  <Sparkles className="h-4 w-4 text-amber-300" />
                  <span>Materi Literasi, Berhitung & Coding</span>
                </div>
                <div className="flex items-center gap-3 rounded-2xl border border-white/20 bg-white/8 px-3 py-2">
                  <KeyRound className="h-4 w-4 text-amber-300" />
                  <span>Pemisahan Ketat Mode Anak & Orang Tua</span>
                </div>
              </div>
            </div>
          </aside>

          <main className="relative bg-[radial-gradient(circle_at_top_left,_rgba(255,210,91,0.22),_transparent_22%),radial-gradient(circle_at_bottom_right,_rgba(74,163,255,0.18),_transparent_28%),#F9FDFF] p-5 sm:p-8 lg:p-10">
            <div className="absolute right-8 top-8 text-2xl text-yellow-300">✨</div>
            <div className="absolute left-8 bottom-10 text-xl text-sky-300">⭐</div>

            <div className="relative z-10 flex min-h-full flex-col justify-center">
              <div className="mb-6">
                <span className="inline-flex rounded-full bg-sky-100 px-3 py-1 text-[10px] font-extrabold uppercase tracking-[0.2em] text-sky-700">
                  Masuk akun
                </span>
                <h2 className="mt-3 font-display text-3xl font-bold text-[#21466D] sm:text-4xl">
                  Selamat datang kembali! 👋
                </h2>
                <p className="mt-2 text-sm font-semibold text-slate-500">
                  Masukkan username dan kata sandi akun Anda.
                </p>
              </div>

              {errorMsg && (
                <div role="alert" className="mb-5 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-bold text-rose-600">
                  {errorMsg}
                </div>
              )}

              <form onSubmit={handleLogin} className="space-y-4">
                <label className="relative block">
                  <User className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                  <input
                    type="text"
                    autoComplete="username"
                    placeholder="Username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    className="w-full rounded-2xl border border-slate-200 bg-white py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                    required
                  />
                </label>

                <label className="relative block">
                  <Lock className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                  <input
                    type="password"
                    autoComplete="current-password"
                    placeholder="Kata sandi"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    className="w-full rounded-2xl border border-slate-200 bg-white py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                    required
                  />
                </label>

                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="w-full rounded-2xl border border-amber-500 bg-gradient-to-r from-[#FFD75A] via-[#FFC933] to-[#FFB347] px-5 py-3.5 text-base font-black text-amber-950 shadow-[0_6px_0_#E39A00,0_18px_24px_-8px_rgba(255,179,71,0.65)] transition-transform active:scale-[0.98] disabled:cursor-not-allowed disabled:opacity-70"
                >
                  {isSubmitting ? "Memeriksa..." : "Masuk 🚀"}
                </button>
              </form>

              <div className="mt-6 rounded-2xl border border-sky-100 bg-white/80 px-4 py-3 text-xs font-semibold leading-5 text-slate-500">
                Belum punya akun? Pendaftaran hanya dilakukan oleh admin melalui halaman web admin.
                Hubungi admin Bintang Kecil untuk dibuatkan akun.
              </div>
            </div>
          </main>
        </div>
      </div>
    </div>
  );
};
