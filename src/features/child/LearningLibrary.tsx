import React, { useState, useEffect } from "react";
import {
  ArrowLeft,
  BookOpen,
  Star,
  Clock,
  CheckCircle2,
  ChevronRight,
  Volume2,
  VolumeX,
  Sparkles,
} from "lucide-react";
import { CategoryId, ChildProfile, LearningModule, Story, AgeRange } from "../../types";
import { CATEGORIES } from "../../data/categories";
import { ALL_MODULES } from "../../data/modules";
import { ORIGINAL_STORIES } from "../../data/stories";
import { storage } from "../../core/storage";
import { audio } from "../../core/audio";
import { ModuleRunner } from "./ModuleRunner";
import { StoryReader } from "./StoryReader";

interface LearningLibraryProps {
  child: ChildProfile;
  initialCategory?: CategoryId;
  onBackToHome: () => void;
}

export const LearningLibrary: React.FC<LearningLibraryProps> = ({
  child,
  initialCategory,
  onBackToHome,
}) => {
  // Automatically locked to child's profile age
  const childAgeTier: AgeRange =
    child.levelOverride || (child.age <= 3 ? "2-3" : child.age <= 5 ? "4-5" : "6-7");

  const [selectedCatId, setSelectedCatId] = useState<CategoryId | null>(
    initialCategory || null
  );
  const [activeModule, setActiveModule] = useState<LearningModule | null>(null);
  const [activeStory, setActiveStory] = useState<Story | null>(null);
  const [speakingId, setSpeakingId] = useState<string | null>(null);

  const moduleProgressMap = storage.getModuleProgress(child.id);

  // Stop TTS narration when component unmounts or view changes
  useEffect(() => {
    return () => {
      audio.stopSpeaking();
    };
  }, []);

  useEffect(() => {
    audio.stopSpeaking();
    setSpeakingId(null);
  }, [selectedCatId]);

  // Filter categories enabled for this child
  const availableCategories = CATEGORIES.filter(
    (c) =>
      child.enabledCategories.includes(c.id) ||
      child.enabledCategories.length === 0
  );

  const selectedCategoryMeta = CATEGORIES.find((c) => c.id === selectedCatId);

  // Filter modules strictly for this child's profile age tier
  const categoryModules = ALL_MODULES.filter((m) => {
    if (selectedCatId && m.category !== selectedCatId) return false;
    return m.ageRange === childAgeTier;
  });

  const displayModules =
    categoryModules.length > 0
      ? categoryModules
      : ALL_MODULES.filter((m) => m.category === selectedCatId);

  // Text-To-Speech (Web Speech API) Reader Helper
  const handleReadAloud = (id: string, textToRead: string, e?: React.MouseEvent) => {
    if (e) {
      e.stopPropagation();
    }
    audio.playTapSound();

    if (speakingId === id) {
      audio.stopSpeaking();
      setSpeakingId(null);
      return;
    }

    setSpeakingId(id);
    audio.speak(textToRead, {
      lang: "id-ID",
      rate: 0.85,
      pitch: 1.15,
      onEnd: () => setSpeakingId(null),
    });
  };

  const handleSelectCategory = (catId: CategoryId) => {
    audio.stopSpeaking();
    setSpeakingId(null);
    audio.playTapSound();
    setSelectedCatId(catId);
  };

  const handleSelectModule = (mod: LearningModule) => {
    audio.stopSpeaking();
    setSpeakingId(null);
    audio.playTapSound();
    setActiveModule(mod);
  };

  const handleSelectStory = (story: Story) => {
    audio.stopSpeaking();
    setSpeakingId(null);
    audio.playTapSound();
    setActiveStory(story);
  };

  // If currently running a module
  if (activeModule) {
    return (
      <ModuleRunner
        module={activeModule}
        child={child}
        onExit={() => setActiveModule(null)}
        onComplete={() => {
          setActiveModule(null);
        }}
      />
    );
  }

  // If currently reading a story
  if (activeStory) {
    return (
      <StoryReader
        story={activeStory}
        child={child}
        onBack={() => setActiveStory(null)}
      />
    );
  }

  return (
    <div className="w-full max-w-6xl mx-auto space-y-6 select-none animate-in fade-in">
      {/* Category Selected: Show Modules or Stories */}
      {selectedCatId ? (
        <div>
          {/* Header */}
          <div className="flex items-center justify-between mb-6 pb-4 border-b border-sky-100 flex-wrap gap-3">
            <button
              onClick={() => {
                audio.playTapSound();
                setSelectedCatId(null);
              }}
              className="flex items-center gap-2 bg-white/90 hover:bg-white text-[#25476A] px-4 py-2.5 rounded-2xl font-child font-bold text-sm shadow-sm border border-sky-200 transition-transform active:scale-95"
            >
              <ArrowLeft className="w-5 h-5 text-sky-600" />
              <span>Semua Pelajaran</span>
            </button>

            <div className="flex items-center gap-3">
              <span className="text-3xl sm:text-4xl">{selectedCategoryMeta?.icon}</span>
              <div>
                <h3 className="text-2xl font-black text-[#25476A] font-child">
                  {selectedCategoryMeta?.name}
                </h3>
                <p className="text-xs text-slate-500 font-child">
                  {selectedCategoryMeta?.tagline}
                </p>
              </div>

              {/* Narrate Category Header */}
              <button
                onClick={(e) =>
                  handleReadAloud(
                    `cat_${selectedCategoryMeta?.id}`,
                    `Kategori ${selectedCategoryMeta?.name}. ${selectedCategoryMeta?.tagline}. ${selectedCategoryMeta?.description}`,
                    e
                  )
                }
                className={`p-2.5 rounded-2xl border transition-all active:scale-95 shadow-xs ${
                  speakingId === `cat_${selectedCategoryMeta?.id}`
                    ? "bg-rose-500 text-white border-rose-600 animate-pulse"
                    : "bg-amber-100 hover:bg-amber-200 text-amber-900 border-amber-300"
                }`}
                title="Dengarkan penjelasan kategori"
              >
                {speakingId === `cat_${selectedCategoryMeta?.id}` ? (
                  <VolumeX className="w-5 h-5" />
                ) : (
                  <Volume2 className="w-5 h-5" />
                )}
              </button>
            </div>
          </div>

          {/* If Stories Category: Show Stories Grid */}
          {selectedCatId === "stories" ? (
            <div>
              <div className="mb-4 flex items-center justify-between flex-wrap gap-2">
                <span className="text-sm font-bold text-amber-900 bg-amber-100/80 px-4 py-1.5 rounded-full inline-flex items-center gap-1.5 font-child">
                  <BookOpen className="w-4 h-4 text-amber-600" />
                  12 Buku Cerita Bergambar Asli Bimo
                </span>

                <button
                  onClick={() =>
                    handleReadAloud(
                      "stories_intro",
                      "Di sini ada 12 buku cerita bergambar Bimo yang seru. Sentuh tombol suara untuk mendengar judul ceritanya ya!"
                    )
                  }
                  className="px-3.5 py-1.5 bg-sky-100 hover:bg-sky-200 text-sky-800 rounded-full font-child font-bold text-xs flex items-center gap-1.5 transition-transform active:scale-95 shadow-xs"
                >
                  <Volume2 className="w-3.5 h-3.5" />
                  <span>Dengar Bimo 🔊</span>
                </button>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
                {ORIGINAL_STORIES.map((story) => {
                  const isSpeaking = speakingId === story.id;
                  return (
                    <div
                      key={story.id}
                      onClick={() => handleSelectStory(story)}
                      className={`group bg-white hover:bg-amber-50/40 p-5 rounded-3xl border-3 shadow-sm hover:shadow-xl transition-all duration-200 text-left flex flex-col justify-between cursor-pointer active:scale-97 ${
                        isSpeaking
                          ? "border-amber-400 ring-4 ring-amber-300/60 bg-amber-50/70"
                          : "border-amber-200 hover:border-amber-400"
                      }`}
                    >
                      <div>
                        <div className="flex items-center justify-between mb-3">
                          <span className="text-4xl group-hover:scale-110 transition-transform">
                            {story.coverEmoji}
                          </span>

                          <div className="flex items-center gap-1.5">
                            {/* TTS Narrator Button */}
                            <button
                              type="button"
                              onClick={(e) =>
                                handleReadAloud(
                                  story.id,
                                  `Buku Cerita: ${story.title}. Pesan moral: ${story.moralLesson}.`,
                                  e
                                )
                              }
                              className={`p-2 rounded-xl transition-all shadow-xs flex items-center gap-1 font-child font-bold text-xs ${
                                isSpeaking
                                  ? "bg-rose-500 text-white animate-pulse"
                                  : "bg-amber-100 hover:bg-amber-200 text-amber-900 border border-amber-300"
                              }`}
                              title="Dengarkan Cerita Ini Dibacakan"
                            >
                              {isSpeaking ? (
                                <VolumeX className="w-4 h-4" />
                              ) : (
                                <Volume2 className="w-4 h-4" />
                              )}
                              <span>{isSpeaking ? "Diam" : "Bacakan"}</span>
                            </button>

                            <span className="text-xs font-bold px-3 py-1 bg-amber-100 text-amber-900 rounded-full font-child uppercase">
                              {story.category}
                            </span>
                          </div>
                        </div>

                        <h4 className="text-lg font-black text-[#25476A] font-child group-hover:text-amber-950 transition-colors">
                          {story.title}
                        </h4>
                        <p className="text-xs text-slate-500 font-child mt-1 line-clamp-2">
                          "{story.moralLesson}"
                        </p>
                      </div>

                      <div className="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs font-bold text-amber-600 font-child">
                        <span>Buka Buku ({story.pages.length} Halaman)</span>
                        <span>📖 ➔</span>
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          ) : (
            // Clean Modules Grid tailored directly for child's age
            <div>
              {/* Top Bar with Audio Assistant */}
              <div className="mb-4 flex items-center justify-between flex-wrap gap-2">
                <span className="text-xs font-bold text-slate-500 font-child">
                  Tersedia {displayModules.length} materi untuk usia {child.nickname} ({child.age} Tahun)
                </span>

                <button
                  onClick={() =>
                    handleReadAloud(
                      "modules_hint",
                      `Ayo pilih materi belajar yang kamu suka! Sentuh tombol Bacakan dengan tanda suara jika ingin Bimo membacakan judul dan ceritanya!`
                    )
                  }
                  className="px-3.5 py-1.5 bg-sky-100 hover:bg-sky-200 text-sky-800 rounded-full font-child font-bold text-xs flex items-center gap-1.5 transition-transform active:scale-95 shadow-xs"
                >
                  <Volume2 className="w-3.5 h-3.5" />
                  <span>Dengar Petunjuk Bimo 🔊</span>
                </button>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
                {displayModules.map((mod) => {
                  const progress = moduleProgressMap[mod.id];
                  const isDone = progress?.status === "done" || Boolean(progress?.completedAt);
                  const stars = progress?.stars || 0;
                  const isSpeaking = speakingId === mod.id;

                  return (
                    <div
                      key={mod.id}
                      onClick={() => handleSelectModule(mod)}
                      className={`group bg-white hover:bg-sky-50/50 p-5 rounded-3xl border-3 shadow-sm hover:shadow-xl transition-all duration-200 text-left flex flex-col justify-between cursor-pointer active:scale-97 relative overflow-hidden ${
                        isSpeaking
                          ? "border-amber-400 ring-4 ring-amber-300/60 bg-amber-50/60 scale-101"
                          : "border-sky-100 hover:border-amber-300"
                      }`}
                    >
                      {/* Top Mastery Star & Audio Narrator Button */}
                      <div className="flex items-center justify-between mb-3 w-full">
                        <div className="flex items-center gap-1">
                          {[1, 2, 3].map((s) => (
                            <Star
                              key={s}
                              className={`w-4 h-4 ${
                                s <= stars
                                  ? "text-amber-400 fill-amber-400"
                                  : "text-slate-200 fill-slate-100"
                              }`}
                            />
                          ))}
                        </div>

                        {/* Text-To-Speech (Web Speech API) Narrator Button for Kids Literacy */}
                        <button
                          type="button"
                          onClick={(e) =>
                            handleReadAloud(
                              mod.id,
                              `Materi: ${mod.title}. ${mod.description}. Waktu belajar sekitar ${mod.estimatedDuration} menit. Yuk mulai belajar!`,
                              e
                            )
                          }
                          className={`px-2.5 py-1.5 rounded-xl transition-all shadow-xs flex items-center gap-1.5 font-child font-bold text-xs ${
                            isSpeaking
                              ? "bg-rose-500 text-white animate-pulse"
                              : "bg-amber-100 hover:bg-amber-200 text-amber-900 border border-amber-300"
                          }`}
                          title="Dengarkan Bimo Membacakan Materi Ini"
                        >
                          {isSpeaking ? (
                            <>
                              <VolumeX className="w-3.5 h-3.5" />
                              <span>Berhenti</span>
                            </>
                          ) : (
                            <>
                              <Volume2 className="w-3.5 h-3.5 text-amber-700" />
                              <span>Bacakan 🔊</span>
                            </>
                          )}
                        </button>
                      </div>

                      <div>
                        <div className="text-[10px] font-bold text-sky-600 uppercase font-child mb-0.5">
                          {mod.subcategory || selectedCategoryMeta?.name}
                        </div>
                        <h4 className="text-lg font-black text-[#25476A] font-child group-hover:text-sky-900 transition-colors mb-1 leading-snug">
                          {mod.title}
                        </h4>
                        <p className="text-xs text-slate-500 font-child line-clamp-2 leading-relaxed mb-3">
                          {mod.description}
                        </p>

                        <div className="flex items-center gap-2 text-xs font-bold text-slate-500 font-child">
                          <Clock className="w-3.5 h-3.5 text-amber-500" />
                          <span>~{mod.estimatedDuration} Menit</span>
                        </div>
                      </div>

                      {/* Bottom Status Row */}
                      <div className="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs font-bold font-child">
                        {isDone ? (
                          <span className="flex items-center gap-1.5 text-emerald-600 font-black">
                            <CheckCircle2 className="w-4 h-4" />
                            <span>Selesai ⭐</span>
                          </span>
                        ) : (
                          <span className="text-sky-600 font-black flex items-center gap-1">
                            <span>Mulai Belajar</span>
                            <ChevronRight className="w-4 h-4" />
                          </span>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      ) : (
        // Simple, Clean Categories Grid (Kids UI)
        <div>
          {/* Simple Friendly Header with Text-To-Speech Button */}
          <div className="flex items-center justify-between flex-wrap gap-3 mb-6 bg-gradient-to-r from-sky-100 via-amber-50 to-indigo-50 p-5 rounded-3xl border-2 border-sky-200 shadow-xs">
            <div className="flex items-center gap-3.5">
              <span className="text-4xl">📚</span>
              <div>
                <h2 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child">
                  Pelajaran Seru Bimo
                </h2>
                <p className="text-xs sm:text-sm font-semibold text-slate-600 font-child">
                  Materi otomatis disesuaikan untuk usia {child.nickname} ({child.age} Tahun)
                </p>
              </div>
            </div>

            <div className="flex items-center gap-2">
              {/* TTS Read Library Header Button */}
              <button
                onClick={() =>
                  handleReadAloud(
                    "library_header",
                    `Halo ${child.nickname}! Selamat datang di ruang pelajaran seru Bimo. Di sini semua materi sudah disesuaikan khusus untuk usia ${child.age} tahun. Sentuh tombol suara pada kartu untuk mendengarkan judul pelajarannya ya!`
                  )
                }
                className={`px-4 py-2 rounded-2xl font-child font-bold text-xs flex items-center gap-2 transition-all active:scale-95 shadow-sm border ${
                  speakingId === "library_header"
                    ? "bg-rose-500 text-white border-rose-600 animate-pulse"
                    : "bg-white hover:bg-amber-100 text-[#25476A] border-amber-300"
                }`}
                title="Bimo Bacakan Panduan Halaman"
              >
                {speakingId === "library_header" ? (
                  <>
                    <VolumeX className="w-4 h-4" />
                    <span>Hentikan Suara</span>
                  </>
                ) : (
                  <>
                    <Volume2 className="w-4 h-4 text-amber-600" />
                    <span>Bimo Bacakan 🔊</span>
                  </>
                )}
              </button>

              <span className="text-xs font-black text-amber-900 bg-amber-300/80 px-4 py-2 rounded-2xl font-child shadow-xs">
                ⭐ Usia {childAgeTier}
              </span>
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
            {availableCategories.map((cat) => {
              // Count modules for child's age
              const countInCat = ALL_MODULES.filter(
                (m) => m.category === cat.id && m.ageRange === childAgeTier
              ).length;

              const displayCount =
                cat.id === "stories"
                  ? "12 Cerita"
                  : countInCat > 0
                  ? `${countInCat} Materi`
                  : "Materi Seru";

              const isSpeaking = speakingId === `cat_card_${cat.id}`;

              return (
                <div
                  key={cat.id}
                  onClick={() => handleSelectCategory(cat.id)}
                  className={`group bg-white hover:bg-gradient-to-b hover:${cat.accentBg} p-6 rounded-3xl border-3 shadow-sm hover:shadow-2xl transition-all duration-200 text-left flex flex-col justify-between cursor-pointer active:scale-97 ${
                    isSpeaking
                      ? "border-amber-400 ring-4 ring-amber-300/60 bg-amber-50/60 scale-101"
                      : `${cat.borderColor}`
                  }`}
                >
                  <div>
                    <div className="flex items-center justify-between mb-4">
                      <span className="text-5xl group-hover:scale-110 transition-transform">
                        {cat.icon}
                      </span>

                      <div className="flex items-center gap-1.5">
                        {/* Audio Narrator Button for Category */}
                        <button
                          type="button"
                          onClick={(e) =>
                            handleReadAloud(
                              `cat_card_${cat.id}`,
                              `Pelajaran ${cat.name}. ${cat.tagline}. ${cat.description}`,
                              e
                            )
                          }
                          className={`p-2 rounded-xl transition-all shadow-xs flex items-center gap-1 font-child font-bold text-xs ${
                            isSpeaking
                              ? "bg-rose-500 text-white animate-pulse"
                              : "bg-slate-100 hover:bg-amber-100 text-slate-700 border border-slate-200"
                          }`}
                          title="Dengarkan Deskripsi Kategori"
                        >
                          {isSpeaking ? (
                            <VolumeX className="w-3.5 h-3.5" />
                          ) : (
                            <Volume2 className="w-3.5 h-3.5 text-amber-600" />
                          )}
                        </button>

                        <span className="text-xs font-black px-3 py-1 bg-slate-100 text-slate-700 rounded-full font-child">
                          {displayCount}
                        </span>
                      </div>
                    </div>

                    <h3 className="text-xl font-black text-[#25476A] font-child group-hover:text-amber-950 transition-colors">
                      {cat.name}
                    </h3>
                    <p className="text-xs font-bold text-amber-700/80 font-child mt-0.5 mb-2">
                      {cat.tagline}
                    </p>
                    <p className="text-xs text-slate-500 font-child line-clamp-2 leading-relaxed">
                      {cat.description}
                    </p>
                  </div>

                  <div className="mt-5 pt-3 border-t border-slate-100 flex items-center justify-between text-xs font-black text-sky-600 font-child">
                    <span>Mulai Pelajaran</span>
                    <span className="group-hover:translate-x-1 transition-transform">➔</span>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
};
