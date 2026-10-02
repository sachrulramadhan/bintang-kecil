import React, { useState } from "react";
import { Lock, Mail, User, ShieldCheck, Sparkles, KeyRound } from "lucide-react";
import { BimoMascot } from "../../components/BimoMascot";
import { storage, hashString } from "../../core/storage";
import { ParentAccount, ChildProfile, CategoryId } from "../../types";

interface ParentAuthScreenProps {
  onAuthSuccess: () => void;
  existingParent: ParentAccount | null;
  onResumeSavedData: () => void;
}

export const ParentAuthScreen: React.FC<ParentAuthScreenProps> = ({
  onAuthSuccess,
  existingParent,
  onResumeSavedData,
}) => {
  const [parentName, setParentName] = useState("");
  const [parentEmail, setParentEmail] = useState("");
  const [parentPassword, setParentPassword] = useState("");
  const [parentPin, setParentPin] = useState("");
  const [childNickname, setChildNickname] = useState("");
  const [childAge, setChildAge] = useState(2);
  const [childAvatar, setChildAvatar] = useState("🐰");
  const [errorMsg, setErrorMsg] = useState("");
  const [isRegisteringNewParent, setIsRegisteringNewParent] = useState(!existingParent);

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!parentName.trim() || !parentEmail.trim() || !childNickname.trim()) {
      setErrorMsg("Mohon lengkapi nama orang tua, email, dan nama anak.");
      return;
    }

    if (!/^\d{4,6}$/.test(parentPin)) {
      setErrorMsg("PIN orang tua harus 4 sampai 6 angka.");
      return;
    }
    const pinHash = await hashString(parentPin);

    let parent: ParentAccount;
    if (existingParent && !isRegisteringNewParent) {
      const savedParent = storage
        .getParentAccounts()
        .find(
          (account) =>
            account.email.toLowerCase() === parentEmail.trim().toLowerCase()
        );
      if (!savedParent || savedParent.pinHash !== pinHash) {
        setErrorMsg("Email atau PIN tidak cocok dengan akun tersimpan.");
        return;
      }
      parent = savedParent;
      storage.setParentAccount(parent);

      const savedChild = storage
        .getChildren()
        .find(
          (child) =>
            child.parentId === parent.id &&
            child.nickname.toLowerCase() === childNickname.trim().toLowerCase()
        );
      if (savedChild) {
        storage.setActiveChildId(savedChild.id);
        onAuthSuccess();
        return;
      }
    } else {
      const emailAlreadyRegistered = storage
        .getParentAccounts()
        .some(
          (account) =>
            account.email.toLowerCase() === parentEmail.trim().toLowerCase()
        );
      if (emailAlreadyRegistered) {
        setErrorMsg("Email ini sudah terdaftar. Gunakan email lain atau lanjutkan profil tersimpan.");
        return;
      }

      const passHash = await hashString(parentPassword || "default_pass");
      parent = {
        id: `parent_${Date.now()}`,
        name: parentName.trim(),
        email: parentEmail.trim(),
        passwordHash: passHash,
        pinHash,
        createdAt: new Date().toISOString(),
      };
      storage.setParentAccount(parent);
    }

    const allCategories: CategoryId[] = [
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

    const child: ChildProfile = {
      id: `child_${Date.now()}`,
      parentId: parent.id,
      nickname: childNickname.trim(),
      birthDate: new Date(Date.now() - childAge * 365 * 24 * 3600 * 1000)
        .toISOString()
        .slice(0, 10),
      age: childAge,
      avatar: childAvatar,
      enabledCategories: allCategories,
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

    onAuthSuccess();
  };

  const handleResumeSavedData = async () => {
    if (!existingParent) return;
    if (!parentEmail.trim()) {
      setErrorMsg("Masukkan email akun orang tua yang ingin dilanjutkan.");
      return;
    }
    if (!/^\d{4,6}$/.test(parentPin)) {
      setErrorMsg("Masukkan PIN orang tua 4 sampai 6 angka untuk melanjutkan.");
      return;
    }
    const savedParent = storage
      .getParentAccounts()
      .find(
        (account) =>
          account.email.toLowerCase() === parentEmail.trim().toLowerCase()
      );
    if (!savedParent || (await hashString(parentPin)) !== savedParent.pinHash) {
      setErrorMsg("PIN orang tua tidak cocok.");
      return;
    }

    const children = storage
      .getChildren()
      .filter((child) => child.parentId === savedParent.id);
    if (children.length === 0) {
      setErrorMsg("Tidak ditemukan profil anak pada akun tersimpan.");
      return;
    }

    storage.setParentAccount(savedParent);
    const activeChildId = storage.getActiveChildId();
    const activeChild = children.find((child) => child.id === activeChildId);
    storage.setActiveChildId((activeChild || children[0]).id);
    onResumeSavedData();
  };

  const handleQuickDemo = () => {
    if (existingParent) {
      setErrorMsg("Gunakan PIN untuk melanjutkan ke profil yang tersimpan.");
      return;
    }
    storage.seedDemoData();
    onAuthSuccess();
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

            <div className="relative z-10">
              <div className="mb-6">
                <span className="inline-flex rounded-full bg-sky-100 px-3 py-1 text-[10px] font-extrabold uppercase tracking-[0.2em] text-sky-700">
                  {existingParent && !isRegisteringNewParent
                    ? "Akun tersimpan"
                    : "Daftar akun"}
                </span>
                <h2 className="mt-3 font-display text-3xl font-bold text-[#21466D] sm:text-4xl">
                  {existingParent && !isRegisteringNewParent
                    ? "Selamat datang kembali! 👋"
                    : "Selamat Datang Ayah & Bunda! 👋"}
                </h2>
                <p className="mt-2 text-sm font-semibold text-slate-500">
                  {existingParent && !isRegisteringNewParent
                    ? "Masukkan email dan PIN akun tersimpan, atau daftar sebagai pengguna baru."
                    : "Daftarkan akun orang tua dan buat profil buah hati Anda untuk memulai."}
                </p>
                {existingParent && (
                  <button
                    type="button"
                    onClick={() => {
                      setIsRegisteringNewParent((registering) => !registering);
                      setErrorMsg("");
                    }}
                    className="mt-3 rounded-xl border border-sky-200 bg-white px-4 py-2 text-sm font-extrabold text-sky-700 transition hover:bg-sky-50"
                  >
                    {isRegisteringNewParent
                      ? "Kembali ke akun tersimpan"
                      : "Daftar akun orang tua baru"}
                  </button>
                )}
              </div>

              {errorMsg && (
                <div className="mb-5 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-bold text-rose-600">
                  {errorMsg}
                </div>
              )}

              <form onSubmit={handleRegister} className="space-y-5">
                <div className="rounded-[28px] border border-sky-100 bg-white/80 p-4 shadow-[0_14px_35px_-18px_rgba(39,105,174,0.3)]">
                  <div className="mb-4 flex items-center gap-2 text-xs font-extrabold uppercase tracking-[0.2em] text-sky-600">
                    <span className="inline-flex h-6 w-6 items-center justify-center rounded-full bg-sky-100 text-sky-700">1</span>
                    Akun Orang Tua
                  </div>

                  <div className="grid gap-3 sm:grid-cols-2">
                    <label className="relative block">
                      <User className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                      <input
                        type="text"
                        placeholder="Nama Ayah / Bunda"
                        value={parentName}
                        onChange={(e) => setParentName(e.target.value)}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                        required
                      />
                    </label>

                    <label className="relative block">
                      <Mail className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                      <input
                        type="email"
                        placeholder="Email Orang Tua"
                        value={parentEmail}
                        onChange={(e) => setParentEmail(e.target.value)}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                        required
                      />
                    </label>
                  </div>

                  <div className="mt-3 grid gap-3 sm:grid-cols-2">
                    <label className="relative block">
                      <Lock className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                      <input
                        type="password"
                        placeholder="Kata Sandi"
                        value={parentPassword}
                        onChange={(e) => setParentPassword(e.target.value)}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                      />
                    </label>

                    <label className="relative block">
                      <KeyRound className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-sky-500" />
                      <input
                        type="password"
                        placeholder="PIN Orang Tua (4-6 angka)"
                        value={parentPin}
                        onChange={(e) => setParentPin(e.target.value.replace(/\D/g, ""))}
                        inputMode="numeric"
                        maxLength={6}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-sky-400 focus:bg-white focus:outline-none"
                      />
                    </label>
                  </div>
                </div>

                <div className="rounded-[28px] border border-amber-100 bg-white/80 p-4 shadow-[0_14px_35px_-18px_rgba(255,157,0,0.3)]">
                  <div className="mb-4 flex items-center gap-2 text-xs font-extrabold uppercase tracking-[0.2em] text-amber-600">
                    <span className="inline-flex h-6 w-6 items-center justify-center rounded-full bg-amber-100 text-amber-700">2</span>
                    Profil Anak Pertama
                  </div>

                  <div className="grid gap-3 sm:grid-cols-2">
                    <label className="relative block sm:col-span-2">
                      <User className="pointer-events-none absolute left-4 top-3.5 h-4 w-4 text-amber-500" />
                      <input
                        type="text"
                        placeholder="Nama Panggilan Anak (cth: Adit)"
                        value={childNickname}
                        onChange={(e) => setChildNickname(e.target.value)}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 pl-10 pr-3 text-sm font-semibold text-slate-700 placeholder:text-slate-400 focus:border-amber-400 focus:bg-white focus:outline-none"
                        required
                      />
                    </label>

                    <label className="relative block sm:col-span-2">
                      <span className="mb-2 block text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-500">
                        Usia anak
                      </span>
                      <select
                        value={childAge}
                        onChange={(e) => setChildAge(parseInt(e.target.value, 10))}
                        className="w-full rounded-2xl border border-slate-200 bg-slate-50 py-3 px-3 text-sm font-semibold text-slate-700 focus:border-amber-400 focus:bg-white focus:outline-none"
                      >
                        <option value={2}>Usia 2-3 Tahun (Pemula 🌱)</option>
                        <option value={4}>Usia 4-5 Tahun (Berkembang 🌿)</option>
                        <option value={6}>Usia 6-7 Tahun (Lanjutan 🌳)</option>
                        <option value={8}>Usia 8-10 Tahun (Kritis 🚀)</option>
                        <option value={11}>Usia 11-12 Tahun (Penalaran 🧠)</option>
                      </select>
                    </label>
                  </div>

                  <div className="mt-4">
                    <p className="mb-2 text-[11px] font-extrabold uppercase tracking-[0.2em] text-slate-500">
                      Pilih Avatar Hewan Lucu
                    </p>
                    <div className="flex flex-wrap gap-2">
                      {["🐰", "🦁", "🐼", "🦊", "🦄", "🐯"].map((av) => (
                        <button
                          key={av}
                          type="button"
                          onClick={() => setChildAvatar(av)}
                          className={`flex h-11 w-11 items-center justify-center rounded-2xl border text-xl transition-all ${
                            childAvatar === av
                              ? "scale-105 border-amber-400 bg-amber-100 shadow-[0_8px_18px_rgba(251,191,36,0.35)]"
                              : "border-slate-200 bg-slate-50 hover:border-sky-200 hover:bg-sky-50"
                          }`}
                        >
                          {av}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>

                <div className="flex flex-col gap-3 pt-2 sm:flex-row">
                  {(!existingParent || isRegisteringNewParent) && (
                    <button
                      type="submit"
                      className="flex-1 rounded-2xl border border-amber-500 bg-gradient-to-r from-[#FFD75A] via-[#FFC933] to-[#FFB347] px-5 py-3 text-base font-black text-amber-950 shadow-[0_6px_0_#E39A00,0_18px_24px_-8px_rgba(255,179,71,0.65)] transition-transform active:scale-[0.98]"
                    >
                      {existingParent
                        ? "Daftarkan Pengguna Baru 🚀"
                        : "Mulai Petualangan Belajar 🚀"}
                    </button>
                  )}
                  {!existingParent && (
                    <button
                      type="button"
                      onClick={handleQuickDemo}
                      className="rounded-2xl border border-sky-200 bg-sky-100 px-5 py-3 text-sm font-extrabold text-sky-700 transition hover:bg-sky-200"
                      title="Langsung coba dengan data demo terisi"
                    >
                      Coba Demo Langsung
                    </button>
                  )}
                  {existingParent && !isRegisteringNewParent && (
                    <button
                      type="button"
                      onClick={handleResumeSavedData}
                      className="rounded-2xl border border-emerald-200 bg-emerald-50 px-5 py-3 text-sm font-extrabold text-emerald-700 transition hover:bg-emerald-100"
                    >
                      Lanjutkan Profil Tersimpan
                    </button>
                  )}
                </div>
              </form>
            </div>
          </main>
        </div>
      </div>
    </div>
  );
};
