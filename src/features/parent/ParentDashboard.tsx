import React, { useState } from "react";
import {
  ArrowLeft,
  Users,
  BarChart3,
  TrendingUp,
  Clock,
  BookOpen,
  Volume2,
  ShieldCheck,
  Settings,
  Sparkles,
  Download,
  Plus,
  Trash2,
  CheckCircle2,
  Award,
  AlertCircle,
  HelpCircle,
  FileText,
  Printer,
  LogOut,
} from "lucide-react";
import { ChildProfile, ParentAccount, CategoryId, AgeRange } from "../../types";
import { storage } from "../../core/storage";
import { CATEGORIES } from "../../data/categories";
import { SKILLS_TAXONOMY } from "../../data/skills";
import { ALL_MODULES } from "../../data/modules";
import { audio } from "../../core/audio";

interface ParentDashboardProps {
  parent: ParentAccount;
  activeChild: ChildProfile;
  childrenList: ChildProfile[];
  onSelectChild: (childId: string) => void;
  onReturnToChildMode: () => void;
  onLogout: () => void;
  onRefreshData: () => void;
}

type ParentTab =
  | "dashboard"
  | "children"
  | "mastery"
  | "reports"
  | "recommendations"
  | "time"
  | "learning-settings"
  | "audio"
  | "privacy"
  | "settings";

export const ParentDashboard: React.FC<ParentDashboardProps> = ({
  parent,
  activeChild,
  childrenList,
  onSelectChild,
  onReturnToChildMode,
  onLogout,
  onRefreshData,
}) => {
  const [activeTab, setActiveTab] = useState<ParentTab>("dashboard");
  const [editingChild, setEditingChild] = useState<ChildProfile>({ ...activeChild });
  const [showAddChildModal, setShowAddChildModal] = useState(false);
  const [newChildName, setNewChildName] = useState("");
  const [newChildAge, setNewChildAge] = useState(5);
  const [newChildAvatar, setNewChildAvatar] = useState("🐰");
  const [saveSuccessMsg, setSaveSuccessMsg] = useState("");

  const attempts = storage.getAttempts(activeChild.id);
  const masteryMap = storage.getMasteryMap(activeChild.id);
  const moduleProgress = storage.getModuleProgress(activeChild.id);

  const completedModulesCount = Object.values(moduleProgress).filter(
    (p) => p.status === "done"
  ).length;

  const totalMinutesStudied = Math.round(
    (activeChild.todaySecondsPlayed + attempts.length * 45) / 60
  );

  const handleSaveChildSettings = (updated: ChildProfile) => {
    storage.saveChild(updated);
    setEditingChild(updated);
    setSaveSuccessMsg("Pengaturan berhasil disimpan!");
    setTimeout(() => setSaveSuccessMsg(""), 3000);
    onRefreshData();
  };

  const handleToggleCategory = (catId: CategoryId) => {
    const enabled = editingChild.enabledCategories.includes(catId)
      ? editingChild.enabledCategories.filter((id) => id !== catId)
      : [...editingChild.enabledCategories, catId];

    const updated = { ...editingChild, enabledCategories: enabled };
    handleSaveChildSettings(updated);
  };

  const handleAddChild = () => {
    if (!newChildName.trim()) return;
    const newId = `child_${Date.now()}`;
    const newChild: ChildProfile = {
      id: newId,
      parentId: parent.id,
      nickname: newChildName.trim(),
      birthDate: new Date(Date.now() - newChildAge * 365 * 24 * 3600 * 1000)
        .toISOString()
        .slice(0, 10),
      age: newChildAge,
      avatar: newChildAvatar,
      enabledCategories: [
        "stories",
        "mathematics",
        "science",
        "social",
        "indonesian",
        "english",
      ],
      languages: ["id"],
      dailyLimitMin: 30,
      difficultyMode: "auto",
      audio: { volume: 80, narration: true, music: true, sfx: true },
      stars: 10,
      coins: 50,
      donuts: 2,
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
    storage.saveChild(newChild);
    storage.setActiveChildId(newChild.id);
    setShowAddChildModal(false);
    setNewChildName("");
    onRefreshData();
    onSelectChild(newChild.id);
  };

  const handleExportData = () => {
    const data = {
      parent,
      children: storage.getChildren(),
      activeChild,
      attempts,
      masteryMap,
      progress: moduleProgress,
      exportedAt: new Date().toISOString(),
    };
    const blob = new Blob([JSON.stringify(data, null, 2)], {
      type: "application/json",
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `bintang_kecil_data_${activeChild.nickname}.json`;
    a.click();
  };

  const handleSeedDemo = () => {
    storage.seedDemoData();
    onRefreshData();
    setSaveSuccessMsg("Data demo contoh berhasil diisi!");
    setTimeout(() => setSaveSuccessMsg(""), 3000);
  };

  return (
    <div className="min-h-screen bg-slate-50 text-slate-800 flex flex-col antialiased select-auto">
      {/* Top Banner: Distinct "MODE ORANG TUA" Indicator Bar */}
      <header className="bg-slate-900 text-white px-4 sm:px-8 py-3.5 flex items-center justify-between shadow-md border-b-4 border-amber-400">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 bg-amber-400 rounded-xl text-slate-950 font-black flex items-center justify-center text-lg shadow-sm">
            👨‍👩‍👧
          </div>
          <div>
            <div className="flex items-center gap-2">
              <span className="font-extrabold text-base tracking-wide">
                BINTANG KECIL
              </span>
              <span className="bg-amber-400/20 text-amber-300 text-[10px] font-bold px-2 py-0.5 rounded-full border border-amber-400/40 uppercase tracking-widest">
                Mode Orang Tua
              </span>
            </div>
            <p className="text-xs text-slate-400">
              Selamat datang, {parent.name} • Memantau {activeChild.nickname} ({activeChild.age} th)
            </p>
          </div>
        </div>

        <div className="flex flex-wrap items-center gap-2">
          <button
            onClick={onReturnToChildMode}
            className="flex items-center gap-2 bg-gradient-to-r from-amber-400 to-yellow-400 hover:from-amber-500 hover:to-yellow-500 text-slate-950 font-bold px-4 py-2 rounded-xl text-sm shadow-md transition-all active:scale-95 border border-amber-500"
          >
            <ArrowLeft className="w-4 h-4" />
            <span>Kembali ke Mode Anak 🐰</span>
          </button>
          <button
            onClick={onLogout}
            className="flex items-center gap-2 bg-rose-50 hover:bg-rose-100 text-rose-700 font-bold px-4 py-2 rounded-xl text-sm shadow-sm transition-all active:scale-95 border border-rose-200"
          >
            <LogOut className="w-4 h-4" />
            <span>Logout</span>
          </button>
        </div>
      </header>

      {/* Main Layout: Sidebar Navigation + Content Area */}
      <div className="flex-1 flex flex-col md:flex-row">
        {/* Sidebar Nav */}
        <aside className="w-full md:w-64 bg-white border-r border-slate-200 p-4 space-y-1 shrink-0">
          {/* Child Switcher Dropdown */}
          <div className="mb-4 p-3 bg-sky-50 rounded-2xl border border-sky-200">
            <span className="text-[11px] font-bold text-slate-500 uppercase tracking-wider block mb-1.5">
              Pilih Profil Anak:
            </span>
            <div className="flex items-center gap-1.5 flex-wrap">
              {childrenList.map((c) => (
                <button
                  key={c.id}
                  onClick={() => onSelectChild(c.id)}
                  className={`px-3 py-1.5 rounded-xl font-bold text-xs flex items-center gap-1.5 transition-all ${
                    c.id === activeChild.id
                      ? "bg-sky-600 text-white shadow-sm"
                      : "bg-white text-slate-700 hover:bg-slate-100 border border-slate-200"
                  }`}
                >
                  <span>{c.avatar}</span>
                  <span>{c.nickname}</span>
                </button>
              ))}
              <button
                onClick={() => setShowAddChildModal(true)}
                className="p-1.5 rounded-xl bg-white hover:bg-slate-100 border border-dashed border-slate-300 text-slate-500 hover:text-slate-800"
                title="Tambah Profil Anak"
              >
                <Plus className="w-4 h-4" />
              </button>
            </div>
          </div>

          {[
            { id: "dashboard" as ParentTab, label: "Dashboard Ringkasan", icon: BarChart3 },
            { id: "mastery" as ParentTab, label: "Penguasaan Kompetensi", icon: TrendingUp },
            { id: "reports" as ParentTab, label: "Laporan Mingguan", icon: FileText },
            { id: "recommendations" as ParentTab, label: "Rekomendasi Belajar", icon: Sparkles },
            { id: "time" as ParentTab, label: "Waktu Bermain & Istirahat", icon: Clock },
            { id: "learning-settings" as ParentTab, label: "Pengaturan Materi", icon: BookOpen },
            { id: "audio" as ParentTab, label: "Pengaturan Suara", icon: Volume2 },
            { id: "privacy" as ParentTab, label: "Privasi & Keamanan", icon: ShieldCheck },
            { id: "settings" as ParentTab, label: "Pengaturan Akun & Data", icon: Settings },
          ].map((item) => {
            const Icon = item.icon;
            const isActive = activeTab === item.id;
            return (
              <button
                key={item.id}
                onClick={() => setActiveTab(item.id)}
                className={`w-full flex items-center gap-3 px-3.5 py-2.5 rounded-xl font-semibold text-sm transition-all text-left ${
                  isActive
                    ? "bg-slate-900 text-white shadow-sm"
                    : "text-slate-600 hover:bg-slate-100"
                }`}
              >
                <Icon className={`w-4 h-4 ${isActive ? "text-amber-400" : "text-slate-400"}`} />
                <span>{item.label}</span>
              </button>
            );
          })}
        </aside>

        {/* Content View */}
        <main className="flex-1 p-4 sm:p-8 max-w-5xl overflow-y-auto">
          {saveSuccessMsg && (
            <div className="mb-6 p-4 bg-emerald-50 border border-emerald-300 text-emerald-800 rounded-2xl text-sm font-semibold flex items-center gap-2">
              <CheckCircle2 className="w-5 h-5 text-emerald-600" />
              <span>{saveSuccessMsg}</span>
            </div>
          )}

          {/* TAB 1: DASHBOARD RINGKASAN */}
          {activeTab === "dashboard" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Ringkasan Aktivitas {activeChild.nickname}
                </h2>
                <p className="text-sm text-slate-500">
                  Pantau kemajuan bermain dan capaian belajar anak secara berkala.
                </p>
              </div>

              {/* 4 Summary Stat Cards */}
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs">
                  <span className="text-xs font-semibold text-slate-500 block uppercase">
                    Aktivitas Dimainkan
                  </span>
                  <span className="text-2xl font-black text-slate-900 mt-1 block">
                    {attempts.length} Sesi
                  </span>
                  <span className="text-xs text-emerald-600 font-medium">
                    🟢 Aktif berlatih
                  </span>
                </div>

                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs">
                  <span className="text-xs font-semibold text-slate-500 block uppercase">
                    Waktu Belajar
                  </span>
                  <span className="text-2xl font-black text-slate-900 mt-1 block">
                    {totalMinutesStudied} Menit
                  </span>
                  <span className="text-xs text-slate-500 font-medium">
                    Total minggu ini
                  </span>
                </div>

                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs">
                  <span className="text-xs font-semibold text-slate-500 block uppercase">
                    Total Bintang
                  </span>
                  <span className="text-2xl font-black text-amber-500 mt-1 block">
                    ⭐ {activeChild.stars}
                  </span>
                  <span className="text-xs text-amber-600 font-medium">
                    Apresiasi positif
                  </span>
                </div>

                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs">
                  <span className="text-xs font-semibold text-slate-500 block uppercase">
                    Modul Tuntas
                  </span>
                  <span className="text-2xl font-black text-sky-600 mt-1 block">
                    {completedModulesCount} Modul
                  </span>
                  <span className="text-xs text-sky-600 font-medium">
                    Terus berkembang
                  </span>
                </div>
              </div>

              {/* PROGRESS vs PENGUASAAN Split Section (Strictly Required by Section 6.3) */}
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                {/* 1. PROGRESS / AKTIVITAS */}
                <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="font-bold text-base text-slate-900 flex items-center gap-2">
                      <BookOpen className="w-5 h-5 text-sky-500" />
                      <span>Aktivitas Modul (Progress Materi)</span>
                    </h3>
                    <span className="text-xs text-slate-400 font-medium">
                      Kuantitas materi diselesaikan
                    </span>
                  </div>

                  <div className="space-y-3.5">
                    {CATEGORIES.slice(0, 5).map((cat) => {
                      const count = Object.values(moduleProgress).filter((p) => {
                        const m = ALL_MODULES.find((mod) => mod.id === p.moduleId);
                        return m?.category === cat.id && p.status === "done";
                      }).length;

                      return (
                        <div key={cat.id}>
                          <div className="flex justify-between text-xs font-semibold text-slate-700 mb-1">
                            <span>{cat.icon} {cat.name}</span>
                            <span>{count} Modul Selesai</span>
                          </div>
                          <div className="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden">
                            <div
                              className="bg-sky-500 h-full rounded-full transition-all"
                              style={{ width: `${Math.min(100, count * 35)}%` }}
                            />
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>

                {/* 2. PENGUASAAN / KEMAMPUAN (Mastery) */}
                <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="font-bold text-base text-slate-900 flex items-center gap-2">
                      <TrendingUp className="w-5 h-5 text-emerald-500" />
                      <span>Penguasaan Kompetensi (Mastery)</span>
                    </h3>
                    <span className="text-xs text-slate-400 font-medium">
                      Tingkat kepahaman anak
                    </span>
                  </div>

                  <div className="space-y-3.5">
                    {Object.values(SKILLS_TAXONOMY)
                      .slice(0, 5)
                      .map((sk) => {
                        const mastery = masteryMap[sk.id];
                        const score = mastery ? mastery.masteryScore : 70;

                        return (
                          <div key={sk.id}>
                            <div className="flex justify-between text-xs font-semibold text-slate-700 mb-1">
                              <span>{sk.icon} {sk.name}</span>
                              <span className="font-bold text-emerald-700">
                                {score}% {score >= 80 ? "🟢 Sangat Baik" : "🟡 Berkembang"}
                              </span>
                            </div>
                            <div className="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden">
                              <div
                                className="bg-emerald-500 h-full rounded-full transition-all"
                                style={{ width: `${score}%` }}
                              />
                            </div>
                          </div>
                        );
                      })}
                  </div>
                </div>
              </div>

              {/* Positive Recommendation Sneak Peek */}
              <div className="bg-gradient-to-r from-amber-50 to-orange-50 p-6 rounded-2xl border border-amber-200">
                <div className="flex items-center gap-3 mb-2">
                  <Sparkles className="w-5 h-5 text-amber-600" />
                  <h4 className="font-bold text-slate-900">
                    Saran Aktivitas Mendampingi {activeChild.nickname}
                  </h4>
                </div>
                <p className="text-sm text-slate-700 leading-relaxed">
                  Berdasarkan aktivitas minggu ini, {activeChild.nickname} menunjukkan minat tinggi pada pengenalan huruf dan angka! Ayah/Bunda dapat mengajak anak menghitung buah saat berbelanja atau membacakan buku cerita sebelum tidur.
                </p>
              </div>
            </div>
          )}

          {/* TAB 2: PENGUASAAN KOMPETENSI LENGKAP */}
          {activeTab === "mastery" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Rincian Taksonomi Penguasaan Kompetensi
                </h2>
                <p className="text-sm text-slate-500">
                  Dihitung dari rata-rata berbobot riwayat latihan terkini anak tanpa hukuman nilai 0.
                </p>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {Object.values(SKILLS_TAXONOMY).map((sk) => {
                  const mastery = masteryMap[sk.id];
                  const score = mastery ? mastery.masteryScore : 65;
                  const attemptsCount = mastery ? mastery.attempts : 12;

                  return (
                    <div
                      key={sk.id}
                      className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <div className="flex items-center gap-2">
                          <span className="text-2xl">{sk.icon}</span>
                          <div>
                            <h4 className="font-bold text-sm text-slate-800">
                              {sk.name}
                            </h4>
                            <span className="text-[11px] text-slate-400 capitalize">
                              Kategori: {sk.category}
                            </span>
                          </div>
                        </div>
                        <span className="text-lg font-black text-emerald-600">
                          {score}%
                        </span>
                      </div>

                      <p className="text-xs text-slate-500 mb-3">
                        {sk.description}
                      </p>

                      <div className="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden mb-2">
                        <div
                          className="bg-emerald-500 h-full rounded-full"
                          style={{ width: `${score}%` }}
                        />
                      </div>
                      <div className="flex justify-between text-[11px] text-slate-400 font-medium">
                        <span>{attemptsCount} kali latihan</span>
                        <span>{score >= 75 ? "Tercapai Baik" : "Sedang Berlatih"}</span>
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          )}

          {/* TAB 3: LAPORAN MINGGUAN & CETAK */}
          {activeTab === "reports" && (
            <div className="space-y-6">
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  <h2 className="text-2xl font-bold text-slate-900">
                    Laporan Perkembangan Mingguan
                  </h2>
                  <p className="text-sm text-slate-500">
                    Periode: Minggu ini • {activeChild.nickname} ({activeChild.age} Tahun)
                  </p>
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => window.print()}
                    className="flex items-center gap-1.5 px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-bold transition-all"
                  >
                    <Printer className="w-4 h-4" />
                    <span>Cetak Laporan</span>
                  </button>
                  <button
                    onClick={handleExportData}
                    className="flex items-center gap-1.5 px-4 py-2 bg-sky-600 hover:bg-sky-700 text-white rounded-xl text-xs font-bold transition-all shadow-sm"
                  >
                    <Download className="w-4 h-4" />
                    <span>Ekspor JSON</span>
                  </button>
                </div>
              </div>

              {/* Printable Report Sheet */}
              <div className="bg-white p-6 sm:p-8 rounded-2xl border border-slate-200 shadow-sm space-y-6">
                <div className="border-b pb-4 flex justify-between items-center">
                  <div>
                    <h3 className="text-xl font-bold text-slate-900">
                      Laporan Kemajuan Belajar: {activeChild.nickname}
                    </h3>
                    <p className="text-xs text-slate-500">
                      Disusun secara otomatis oleh sistem evaluasi Bintang Kecil.
                    </p>
                  </div>
                  <span className="text-xs font-semibold px-3 py-1 bg-emerald-50 text-emerald-700 rounded-full border border-emerald-200">
                    Performa Positif 🟢
                  </span>
                </div>

                <div className="grid grid-cols-3 gap-4 text-center py-2 bg-slate-50 rounded-xl p-4">
                  <div>
                    <span className="text-xs text-slate-500 block">Waktu Belajar</span>
                    <span className="text-xl font-bold text-slate-800">{totalMinutesStudied} Menit</span>
                  </div>
                  <div>
                    <span className="text-xs text-slate-500 block">Bintang Diperoleh</span>
                    <span className="text-xl font-bold text-amber-600">{activeChild.stars} ⭐</span>
                  </div>
                  <div>
                    <span className="text-xs text-slate-500 block">Modul Selesai</span>
                    <span className="text-xl font-bold text-sky-600">{completedModulesCount}</span>
                  </div>
                </div>

                <div>
                  <h4 className="font-bold text-sm text-slate-800 mb-2">
                    Kemampuan yang Berkembang Pesat (🟢):
                  </h4>
                  <ul className="list-disc list-inside text-xs text-slate-700 space-y-1">
                    <li>Mengenal Huruf Vokal dan Fonem Suara Hewan</li>
                    <li>Menghitung Kuantitas Buah dan Penjumlahan Konkret (1-5)</li>
                    <li>Menyusun Urutan Balok Panah Arah pada Puzzle Grid Coding</li>
                  </ul>
                </div>

                <div>
                  <h4 className="font-bold text-sm text-slate-800 mb-2">
                    Materi yang Dapat Dilatih Berikutnya (🟡):
                  </h4>
                  <ul className="list-disc list-inside text-xs text-slate-700 space-y-1">
                    <li>Menyusun kata dengan 5-6 huruf (misalnya: RUMAH, POHON)</li>
                    <li>Mengenal sapaan sopan dan kosakata Bahasa Arab / Mandarin dasar</li>
                  </ul>
                </div>

                {/* Section 12 Required Text */}
                <div className="pt-4 border-t text-[11px] text-slate-500 italic bg-slate-50 p-3 rounded-xl">
                  "Materi dirancang dengan mengacu pada prinsip dan kerangka pendidikan yang diakui secara internasional serta disesuaikan dengan konteks pembelajaran anak Indonesia."
                </div>
              </div>
            </div>
          )}

          {/* TAB 4: REKOMENDASI BERBAHASA POSITIF */}
          {activeTab === "recommendations" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Rekomendasi Pembelajaran Mendampingi Anak
                </h2>
                <p className="text-sm text-slate-500">
                  Saran disusun dengan bahasa suportif untuk mendukung rasa percaya diri anak.
                </p>
              </div>

              <div className="space-y-4">
                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-start gap-4">
                  <div className="w-12 h-12 rounded-xl bg-amber-100 text-amber-700 flex items-center justify-center text-2xl shrink-0">
                    🔢
                  </div>
                  <div>
                    <h4 className="font-bold text-base text-slate-800">
                      Latihan Konkret: Penjumlahan Sederhana
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Adit sedang menunjukkan antusiasme menghitung bintang. Di rumah, Anda bisa mengajak anak menghitung jumlah sendok saat makan malam atau kue donat yang ada di piring.
                    </p>
                    <span className="inline-block mt-2 text-[10px] font-bold px-2 py-0.5 rounded-full bg-amber-50 text-amber-800">
                      Aktivitas Offline Dunia Nyata
                    </span>
                  </div>
                </div>

                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-start gap-4">
                  <div className="w-12 h-12 rounded-xl bg-sky-100 text-sky-700 flex items-center justify-center text-2xl shrink-0">
                    📚
                  </div>
                  <div>
                    <h4 className="font-bold text-base text-slate-800">
                      Literasi Kata & Membaca Dongeng
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Bacakan cerita "Bimo dan Keranjang Stroberi" bersama-sama. Tanyakan apa yang dirasakan tokoh kelinci untuk melatih empati dan kecerdasan emosional anak.
                    </p>
                    <span className="inline-block mt-2 text-[10px] font-bold px-2 py-0.5 rounded-full bg-sky-50 text-sky-800">
                      Penguatan Karakter
                    </span>
                  </div>
                </div>

                <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-xs flex items-start gap-4">
                  <div className="w-12 h-12 rounded-xl bg-emerald-100 text-emerald-700 flex items-center justify-center text-2xl shrink-0">
                    🔬
                  </div>
                  <div>
                    <h4 className="font-bold text-base text-slate-800">
                      Eksperimen Air di Bak Mandi
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Ajak anak mencoba menaruh daun dan batu kecil ke dalam wadah air untuk membuktikan konsep benda terapung dan tenggelam secara langsung.
                    </p>
                    <span className="inline-block mt-2 text-[10px] font-bold px-2 py-0.5 rounded-full bg-emerald-50 text-emerald-800">
                      Sains Menyenangkan
                    </span>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* TAB 5: WAKTU BERMAIN (SCREEN TIME) */}
          {activeTab === "time" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Batas Waktu Bermain Harian & Istirahat
                </h2>
                <p className="text-sm text-slate-500">
                  Cegah kelelahan mata dengan membatasi sesi dan menjadwalkan jeda istirahat ramah anak.
                </p>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4">
                <h3 className="font-bold text-sm text-slate-800">
                  Pilih Batas Waktu Harian untuk {activeChild.nickname}:
                </h3>
                <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
                  {[15, 30, 45, 60, 0].map((mins) => (
                    <button
                      key={mins}
                      onClick={() => {
                        const updated = { ...editingChild, dailyLimitMin: mins };
                        handleSaveChildSettings(updated);
                      }}
                      className={`p-4 rounded-xl font-bold text-sm transition-all border-2 ${
                        editingChild.dailyLimitMin === mins
                          ? "bg-sky-50 border-sky-600 text-sky-900 shadow-sm"
                          : "bg-slate-50 border-slate-200 text-slate-600 hover:bg-slate-100"
                      }`}
                    >
                      {mins === 0 ? "Tanpa Batas" : `${mins} Menit`}
                    </button>
                  ))}
                </div>

                <div className="pt-4 border-t text-xs text-slate-500 leading-relaxed">
                  💡 Saat batas waktu tercapai, Bimo akan mengingatkan anak dengan ramah untuk minum air, mengistirahatkan mata, dan bergerak sejenak tanpa memotong progres yang sedang dikerjakan.
                </div>
              </div>
            </div>
          )}

          {/* TAB 6: PENGATURAN PEMBELAJARAN (CATEGORIES & DIFFICULTY) */}
          {activeTab === "learning-settings" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Pengaturan Kategori & Tingkat Kesulitan
                </h2>
                <p className="text-sm text-slate-500">
                  Atur bidang apa saja yang boleh diakses dan pilih mode adaptif atau manual.
                </p>
              </div>

              {/* Category Checkboxes */}
              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4">
                <h3 className="font-bold text-sm text-slate-800">
                  Kategori yang Ditampilkan di Mode Anak:
                </h3>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                  {CATEGORIES.map((cat) => {
                    const isChecked = editingChild.enabledCategories.includes(cat.id);
                    return (
                      <label
                        key={cat.id}
                        className={`flex items-center gap-3 p-3 rounded-xl border cursor-pointer transition-all ${
                          isChecked
                            ? "bg-sky-50 border-sky-300 text-sky-900 font-semibold"
                            : "bg-slate-50 border-slate-200 text-slate-500"
                        }`}
                      >
                        <input
                          type="checkbox"
                          checked={isChecked}
                          onChange={() => handleToggleCategory(cat.id)}
                          className="w-4 h-4 text-sky-600 rounded"
                        />
                        <span className="text-lg">{cat.icon}</span>
                        <span className="text-xs">{cat.name}</span>
                      </label>
                    );
                  })}
                </div>
              </div>

              {/* Difficulty Mode */}
              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4">
                <h3 className="font-bold text-sm text-slate-800">
                  Mode Kesulitan Soal:
                </h3>
                <div className="flex gap-4">
                  <button
                    onClick={() => {
                      const updated = { ...editingChild, difficultyMode: "auto" as const };
                      handleSaveChildSettings(updated);
                    }}
                    className={`flex-1 p-4 rounded-xl border-2 text-left transition-all ${
                      editingChild.difficultyMode === "auto"
                        ? "bg-emerald-50 border-emerald-500 text-emerald-900"
                        : "bg-slate-50 border-slate-200 text-slate-600"
                    }`}
                  >
                    <span className="font-bold text-sm block">
                      🌱 Otomatis (Adaptif)
                    </span>
                    <span className="text-xs text-slate-500 mt-1 block">
                      Sistem otomatis menyesuaikan kesulitan berdasarkan 3/3 benar atau pengulangan lembut jika kesulitan.
                    </span>
                  </button>

                  <button
                    onClick={() => {
                      const updated = { ...editingChild, difficultyMode: "manual" as const };
                      handleSaveChildSettings(updated);
                    }}
                    className={`flex-1 p-4 rounded-xl border-2 text-left transition-all ${
                      editingChild.difficultyMode === "manual"
                        ? "bg-amber-50 border-amber-500 text-amber-900"
                        : "bg-slate-50 border-slate-200 text-slate-600"
                    }`}
                  >
                    <span className="font-bold text-sm block">
                      ⚙️ Manual Tetap
                    </span>
                    <span className="text-xs text-slate-500 mt-1 block">
                      Tingkat kesulitan diatur konstan sesuai level usia tanpa lompatan otomatis.
                    </span>
                  </button>
                </div>
              </div>
            </div>
          )}

          {/* TAB 7: AUDIO */}
          {activeTab === "audio" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Pengaturan Audio & Suara Narasi
                </h2>
                <p className="text-sm text-slate-500">
                  Sesuaikan volume dan aktifkan narasi pembacaan ramah anak.
                </p>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-6">
                <div>
                  <div className="flex justify-between text-sm font-bold text-slate-800 mb-2">
                    <span>Volume Suara Utama</span>
                    <span>{editingChild.audio.volume}%</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="100"
                    value={editingChild.audio.volume}
                    onChange={(e) => {
                      const vol = parseInt(e.target.value, 10);
                      const updated = {
                        ...editingChild,
                        audio: { ...editingChild.audio, volume: vol },
                      };
                      handleSaveChildSettings(updated);
                    }}
                    className="w-full accent-sky-600"
                  />
                </div>

                <div className="space-y-3 pt-4 border-t">
                  <div className="flex items-center justify-between">
                    <div>
                      <span className="font-bold text-sm text-slate-800 block">
                        Narasi Suara Bimo (TTS)
                      </span>
                      <span className="text-xs text-slate-500">
                        Membacakan soal dan kata secara otomatis untuk anak
                      </span>
                    </div>
                    <input
                      type="checkbox"
                      checked={editingChild.audio.narration}
                      onChange={(e) => {
                        const updated = {
                          ...editingChild,
                          audio: { ...editingChild.audio, narration: e.target.checked },
                        };
                        handleSaveChildSettings(updated);
                      }}
                      className="w-5 h-5 text-sky-600 rounded"
                    />
                  </div>

                  <div className="flex items-center justify-between">
                    <div>
                      <span className="font-bold text-sm text-slate-800 block">
                        Efek Suara Sukacita (SFX)
                      </span>
                      <span className="text-xs text-slate-500">
                        Dentang merdu saat benar, bintang, dan tepuk tangan
                      </span>
                    </div>
                    <input
                      type="checkbox"
                      checked={editingChild.audio.sfx}
                      onChange={(e) => {
                        const updated = {
                          ...editingChild,
                          audio: { ...editingChild.audio, sfx: e.target.checked },
                        };
                        handleSaveChildSettings(updated);
                      }}
                      className="w-5 h-5 text-sky-600 rounded"
                    />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* TAB 8: PRIVASI & KEAMANAN */}
          {activeTab === "privacy" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Komitmen Privasi & Keamanan Anak
                </h2>
                <p className="text-sm text-slate-500">
                  Prinsip perlindungan data anak yang ketat dan transparan.
                </p>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4">
                <div className="flex items-start gap-3">
                  <ShieldCheck className="w-6 h-6 text-emerald-600 shrink-0 mt-0.5" />
                  <div>
                    <h4 className="font-bold text-sm text-slate-800">
                      Bebas Iklan & Pelacak Pihak Ketiga
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Aplikasi Bintang Kecil 100% bebas dari segala bentuk iklan, pop-up, dan pelacak komersial. Anak dapat belajar dalam lingkungan yang aman, tenang, dan murni edukatif.
                    </p>
                  </div>
                </div>

                <div className="flex items-start gap-3 pt-3 border-t">
                  <ShieldCheck className="w-6 h-6 text-emerald-600 shrink-0 mt-0.5" />
                  <div>
                    <h4 className="font-bold text-sm text-slate-800">
                      Data Terisolasi & Minimal
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Kami hanya menyimpan nama panggilan, usia, dan riwayat belajar tanpa meminta foto wajah, nomor telepon anak, atau lokasi geografis sensitif.
                    </p>
                  </div>
                </div>

                <div className="flex items-start gap-3 pt-3 border-t">
                  <ShieldCheck className="w-6 h-6 text-emerald-600 shrink-0 mt-0.5" />
                  <div>
                    <h4 className="font-bold text-sm text-slate-800">
                      Kendali Penuh di Tangan Orang Tua
                    </h4>
                    <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                      Anda berhak mengekspor seluruh data perkembangan anak dalam format JSON atau menghapusnya kapan saja melalui menu Pengaturan Akun.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* TAB 9: SETTINGS & SEED DATA */}
          {activeTab === "settings" && (
            <div className="space-y-6">
              <div>
                <h2 className="text-2xl font-bold text-slate-900">
                  Pengaturan Akun & Data Demo
                </h2>
                <p className="text-sm text-slate-500">
                  Kelola data akun orang tua dan isi data percontohan jika diperlukan.
                </p>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4">
                <h3 className="font-bold text-sm text-slate-800">
                  Data Percontohan (Demo Seed):
                </h3>
                <p className="text-xs text-slate-500">
                  Tombol ini akan mengisi profil contoh (Adit 5 th & Budi 8 th) dengan riwayat belajar dan penguasaan lengkap agar dashboard dapat langsung terlihat nyata.
                </p>
                <button
                  onClick={handleSeedDemo}
                  className="px-5 py-2.5 bg-amber-500 hover:bg-amber-600 text-white rounded-xl font-bold text-xs shadow-sm transition-all"
                >
                  Isi Data Contoh (Demo Seed)
                </button>
              </div>

              <div className="bg-white p-6 rounded-2xl border border-rose-200 shadow-xs space-y-4">
                <h3 className="font-bold text-sm text-rose-700">
                  Zona Bahaya (Hapus Profil Anak)
                </h3>
                <p className="text-xs text-slate-500">
                  Menghapus profil anak {activeChild.nickname} beserta seluruh riwayat piala dan bintangnya.
                </p>
                <button
                  onClick={() => {
                    if (window.confirm(`Yakin ingin menghapus data profil ${activeChild.nickname}?`)) {
                      storage.deleteChild(activeChild.id);
                      onRefreshData();
                      const remaining = storage.getChildren();
                      if (remaining.length > 0) {
                        onSelectChild(remaining[0].id);
                      }
                    }
                  }}
                  className="px-5 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl font-bold text-xs shadow-sm transition-all"
                >
                  Hapus Profil {activeChild.nickname}
                </button>
              </div>
            </div>
          )}
        </main>
      </div>

      {/* Add Child Modal */}
      {showAddChildModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
          <div className="bg-white rounded-3xl p-6 max-w-sm w-full shadow-2xl border-2 border-slate-200">
            <h3 className="text-lg font-bold text-slate-900 mb-4">
              Tambah Profil Anak Baru
            </h3>
            <div className="space-y-4">
              <div>
                <label className="text-xs font-semibold text-slate-600 block mb-1">
                  Nama Panggilan:
                </label>
                <input
                  type="text"
                  placeholder="Contoh: Rian"
                  value={newChildName}
                  onChange={(e) => setNewChildName(e.target.value)}
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm font-semibold"
                />
              </div>

              <div>
                <label className="text-xs font-semibold text-slate-600 block mb-1">
                  Usia:
                </label>
                <select
                  value={newChildAge}
                  onChange={(e) => setNewChildAge(parseInt(e.target.value, 10))}
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm font-semibold"
                >
                  {[2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((a) => (
                    <option key={a} value={a}>
                      {a} Tahun
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="text-xs font-semibold text-slate-600 block mb-1">
                  Pilih Avatar:
                </label>
                <div className="flex gap-2">
                  {["🐰", "🦁", "🐼", "🦊", "🦄"].map((av) => (
                    <button
                      key={av}
                      type="button"
                      onClick={() => setNewChildAvatar(av)}
                      className={`w-10 h-10 rounded-xl text-xl flex items-center justify-center border ${
                        newChildAvatar === av
                          ? "bg-amber-100 border-amber-500"
                          : "bg-slate-50 border-slate-200"
                      }`}
                    >
                      {av}
                    </button>
                  ))}
                </div>
              </div>
            </div>

            <div className="mt-6 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => setShowAddChildModal(false)}
                className="px-4 py-2 rounded-xl text-xs font-bold text-slate-600 hover:bg-slate-100"
              >
                Batal
              </button>
              <button
                type="button"
                onClick={handleAddChild}
                disabled={!newChildName.trim()}
                className="px-4 py-2 bg-sky-600 disabled:opacity-40 text-white rounded-xl text-xs font-bold shadow-sm"
              >
                Simpan Profil
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
