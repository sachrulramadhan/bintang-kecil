import React, { useState } from "react";
import { Lock, Mail, User, ShieldCheck, Sparkles, KeyRound } from "lucide-react";
import { BimoMascot } from "../../components/BimoMascot";
import { storage, hashString } from "../../core/storage";
import { ParentAccount, ChildProfile, CategoryId } from "../../types";

interface ParentAuthScreenProps {
  onAuthSuccess: () => void;
}

export const ParentAuthScreen: React.FC<ParentAuthScreenProps> = ({
  onAuthSuccess,
}) => {
  const [parentName, setParentName] = useState("");
  const [parentEmail, setParentEmail] = useState("");
  const [parentPassword, setParentPassword] = useState("");
  const [parentPin, setParentPin] = useState("");
  const [childNickname, setChildNickname] = useState("");
  const [childAge, setChildAge] = useState(5);
  const [childAvatar, setChildAvatar] = useState("🐰");
  const [errorMsg, setErrorMsg] = useState("");

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!parentName.trim() || !parentEmail.trim() || !childNickname.trim()) {
      setErrorMsg("Mohon lengkapi nama orang tua, email, dan nama anak.");
      return;
    }

    const passHash = await hashString(parentPassword || "default_pass");
    if (!/^\d{4,6}$/.test(parentPin)) {
      setErrorMsg("PIN orang tua harus 4 sampai 6 angka.");
      return;
    }
    const pinHash = await hashString(parentPin);

    const parent: ParentAccount = {
      id: `parent_${Date.now()}`,
      name: parentName.trim(),
      email: parentEmail.trim(),
      passwordHash: passHash,
      pinHash: pinHash,
      createdAt: new Date().toISOString(),
    };
    storage.setParentAccount(parent);

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

  const handleQuickDemo = () => {
    storage.seedDemoData();
    onAuthSuccess();
  };

  return (
    <div className="min-h-screen flex items-center justify-center p-4 bg-child-pattern select-none">
      <div className="w-full max-w-4xl grid grid-cols-1 md:grid-cols-12 bg-white rounded-[36px] shadow-2xl border-4 border-amber-300 overflow-hidden animate-in zoom-in-95 duration-200">
        {/* Left Side: Mascot & Friendly Branding (Reference 1 center layout) */}
        <div className="md:col-span-5 bg-gradient-to-b from-[#4DA3FF] via-[#3B82F6] to-[#2563EB] p-8 text-white flex flex-col justify-between items-center text-center">
          <div>
            <div className="inline-flex items-center gap-1.5 px-3 py-1 bg-white/20 rounded-full text-xs font-bold font-child uppercase mb-3">
              <Sparkles className="w-3.5 h-3.5 text-amber-300" />
              Edukasi Ramah Anak
            </div>
            <h2 className="text-3xl font-black font-child tracking-wider">
              BINTANG KECIL
            </h2>
            <p className="text-xs font-semibold text-sky-100 font-child mt-1">
              Belajar Seru Bersama Kelinci Bimo 🐰
            </p>
          </div>

          <div className="my-6">
            <BimoMascot expression="happy" size="lg" />
          </div>

          <div className="text-xs text-sky-100 font-child space-y-1">
            <p>✓ 100% Bebas Iklan & Pelacak</p>
            <p>✓ Materi Literasi, Berhitung & Coding</p>
            <p>✓ Pemisahan Ketat Mode Anak & Orang Tua</p>
          </div>
        </div>

        {/* Right Side: Setup Form */}
        <div className="md:col-span-7 p-6 sm:p-8 flex flex-col justify-center">
          <div className="mb-6">
            <h3 className="text-2xl font-black text-[#25476A] font-child">
              Selamat Datang Ayah & Bunda! 👋
            </h3>
            <p className="text-xs font-semibold text-slate-500 font-child mt-1">
              Daftarkan akun orang tua dan buat profil buah hati Anda untuk memulai.
            </p>
          </div>

          {errorMsg && (
            <div className="mb-4 p-3 bg-rose-50 border border-rose-200 text-rose-600 rounded-xl text-xs font-semibold">
              {errorMsg}
            </div>
          )}

          <form onSubmit={handleRegister} className="space-y-4">
            {/* Parent Section */}
            <div className="space-y-3">
              <span className="text-xs font-bold text-sky-600 uppercase font-child tracking-wider">
                1. Akun Orang Tua
              </span>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <input
                  type="text"
                  placeholder="Nama Ayah / Bunda"
                  value={parentName}
                  onChange={(e) => setParentName(e.target.value)}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-sky-500 focus:outline-none"
                  required
                />
                <input
                  type="email"
                  placeholder="Email Orang Tua"
                  value={parentEmail}
                  onChange={(e) => setParentEmail(e.target.value)}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-sky-500 focus:outline-none"
                  required
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <input
                  type="password"
                  placeholder="Kata Sandi (opsional)"
                  value={parentPassword}
                  onChange={(e) => setParentPassword(e.target.value)}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-sky-500 focus:outline-none"
                />
                <input
                  type="password"
                  placeholder="PIN Orang Tua (4-6 angka)"
                  value={parentPin}
                  onChange={(e) => setParentPin(e.target.value.replace(/\D/g, ""))}
                  inputMode="numeric"
                  maxLength={6}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-sky-500 focus:outline-none"
                />
              </div>
            </div>

            {/* Child Section */}
            <div className="space-y-3 pt-2 border-t border-slate-100">
              <span className="text-xs font-bold text-amber-600 uppercase font-child tracking-wider">
                2. Profil Anak Pertama
              </span>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <input
                  type="text"
                  placeholder="Nama Panggilan Anak (cth: Adit)"
                  value={childNickname}
                  onChange={(e) => setChildNickname(e.target.value)}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-amber-500 focus:outline-none"
                  required
                />
                <select
                  value={childAge}
                  onChange={(e) => setChildAge(parseInt(e.target.value, 10))}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold focus:border-amber-500 focus:outline-none"
                >
                  <option value={2}>Usia 2-3 Tahun (Pemula 🌱)</option>
                  <option value={4}>Usia 4-5 Tahun (Berkembang 🌿)</option>
                  <option value={6}>Usia 6-7 Tahun (Lanjutan 🌳)</option>
                  <option value={8}>Usia 8-10 Tahun (Kritis 🚀)</option>
                  <option value={11}>Usia 11-12 Tahun (Penalaran 🧠)</option>
                </select>
              </div>

              <div>
                <label className="text-[11px] font-bold text-slate-500 font-child block mb-1">
                  Pilih Avatar Hewan Lucu:
                </label>
                <div className="flex gap-2">
                  {["🐰", "🦁", "🐼", "🦊", "🦄", "🐯"].map((av) => (
                    <button
                      key={av}
                      type="button"
                      onClick={() => setChildAvatar(av)}
                      className={`w-9 h-9 rounded-xl text-lg flex items-center justify-center border transition-all ${
                        childAvatar === av
                          ? "bg-amber-100 border-amber-500 scale-110 shadow-xs"
                          : "bg-slate-50 border-slate-200"
                      }`}
                    >
                      {av}
                    </button>
                  ))}
                </div>
              </div>
            </div>

            <div className="pt-4 flex flex-col sm:flex-row gap-3">
              <button
                type="submit"
                className="flex-1 py-3 bg-gradient-to-r from-amber-400 to-orange-400 hover:from-amber-500 hover:to-orange-500 text-amber-950 font-child font-black text-base rounded-2xl shadow-md transition-transform active:scale-95 border border-amber-500"
              >
                Mulai Petualangan Belajar 🚀
              </button>
              <button
                type="button"
                onClick={handleQuickDemo}
                className="px-5 py-3 bg-sky-100 hover:bg-sky-200 text-sky-800 font-child font-bold text-xs rounded-2xl transition-all"
                title="Langsung coba dengan data demo terisi"
              >
                Coba Demo Langsung
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
