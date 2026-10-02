import React, { useState } from "react";
import { Gamepad2, Sparkles, Star, ArrowLeft, Trophy } from "lucide-react";
import { ChildProfile } from "../../types";
import { storage } from "../../core/storage";
import { audio } from "../../core/audio";
import {
  WORD_BUILDER_BANK,
  FILL_WORD_BANK,
  TRACING_ITEMS,
  CONNECT_PAIRS_SETS,
  SENTENCE_BUILDER_BANK,
  SOUND_GUESS_BANK,
} from "../../data/games";
import { WordBuilderGame } from "../games/WordBuilderGame";
import { TracingGame } from "../games/TracingGame";
import { GridCodingGame } from "../games/GridCodingGame";
import { ConnectPairsGame } from "../games/ConnectPairsGame";
import { SentenceBuilderGame } from "../games/SentenceBuilderGame";

interface ModePlayProps {
  child: ChildProfile;
  onBackToHome: () => void;
}

type ActiveGameMode =
  | "none"
  | "word-builder"
  | "tracing"
  | "connect-pairs"
  | "fill-word"
  | "sentence-builder"
  | "grid-coding"
  | "sound-guess";

export const ModePlay: React.FC<ModePlayProps> = ({ child, onBackToHome }) => {
  const [activeMode, setActiveMode] = useState<ActiveGameMode>("none");
  const [wbIndex, setWbIndex] = useState(0);
  const [traceIndex, setTraceIndex] = useState(0);
  const [fillIndex, setFillIndex] = useState(0);
  const [sentenceIndex, setSentenceIndex] = useState(0);
  const [soundIndex, setSoundIndex] = useState(0);
  const [pairSetIndex, setPairSetIndex] = useState(0);

  const handleGameComplete = (skillId: string, gameCategory: any) => {
    // Add reward stars
    storage.addStars(child.id, 2);
    // Record attempt & update mastery
    storage.addAttempt(child.id, {
      id: `play_${Date.now()}`,
      childId: child.id,
      gameId: activeMode,
      skillId,
      category: gameCategory,
      correct: true,
      usedHint: false,
      durationMs: 8000,
      difficulty: 1,
      at: new Date().toISOString(),
    });

    // Advance to next item in mode
    if (activeMode === "word-builder") {
      setWbIndex((prev) => (prev + 1) % WORD_BUILDER_BANK.length);
    } else if (activeMode === "tracing") {
      setTraceIndex((prev) => (prev + 1) % TRACING_ITEMS.length);
    } else if (activeMode === "fill-word") {
      setFillIndex((prev) => (prev + 1) % FILL_WORD_BANK.length);
    } else if (activeMode === "sentence-builder") {
      setSentenceIndex((prev) => (prev + 1) % SENTENCE_BUILDER_BANK.length);
    } else if (activeMode === "sound-guess") {
      setSoundIndex((prev) => (prev + 1) % SOUND_GUESS_BANK.length);
    } else if (activeMode === "connect-pairs") {
      setPairSetIndex((prev) => (prev + 1) % CONNECT_PAIRS_SETS.length);
    }
  };

  const gameCategories = [
    {
      group: "🔤 HURUF & BUNYI",
      games: [
        {
          id: "word-builder" as ActiveGameMode,
          title: "Ayo Susun Kata!",
          desc: "Rangkai huruf acak menjadi nama benda bergambar",
          icon: "🧩",
          color: "from-amber-400 to-orange-400",
          stars: "⭐⭐⭐",
        },
        {
          id: "tracing" as ActiveGameMode,
          title: "Ayo Tebalkan Huruf!",
          desc: "Tarik garis ikuti titik hijau pada layar sentuh",
          icon: "✏️",
          color: "from-emerald-400 to-green-500",
          stars: "⭐⭐",
        },
        {
          id: "connect-pairs" as ActiveGameMode,
          title: "Hubungkan Huruf!",
          desc: "Tarik garis pasangkan huruf dan gambar",
          icon: "🔗",
          color: "from-sky-400 to-blue-500",
          stars: "⭐⭐",
        },
        {
          id: "sound-guess" as ActiveGameMode,
          title: "Dengar dan Tebak!",
          desc: "Dengarkan bunyi fonem dan tebak hurufnya",
          icon: "🔊",
          color: "from-pink-400 to-rose-500",
          stars: "⭐⭐",
        },
      ],
    },
    {
      group: "📖 KATA & KALIMAT",
      games: [
        {
          id: "fill-word" as ActiveGameMode,
          title: "Lengkapi Kata!",
          desc: "Pilih huruf yang hilang untuk melengkapi kata",
          icon: "📝",
          color: "from-purple-400 to-indigo-500",
          stars: "⭐⭐",
        },
        {
          id: "sentence-builder" as ActiveGameMode,
          title: "Susun Kalimat!",
          desc: "Rangkai kata menjadi kalimat yang padu",
          icon: "📖",
          color: "from-teal-400 to-cyan-500",
          stars: "⭐⭐⭐",
        },
      ],
    },
    {
      group: "🧠 LOGIKA & CODING",
      games: [
        {
          id: "grid-coding" as ActiveGameMode,
          title: "Grid Coding Bimo",
          desc: "Beri perintah panah arah agar Bimo sampai ke wortel",
          icon: "💻",
          color: "from-blue-500 to-indigo-600",
          stars: "⭐⭐⭐",
        },
      ],
    },
  ];

  return (
    <div className="w-full max-w-6xl mx-auto p-4 sm:p-6 animate-in fade-in select-none">
      {activeMode === "none" ? (
        <div>
          {/* Header Banner */}
          <div className="flex flex-col sm:flex-row items-center justify-between gap-4 mb-8 bg-gradient-to-r from-amber-100 via-yellow-50 to-orange-100 p-6 rounded-3xl border-3 border-amber-300 shadow-sm">
            <div className="flex items-center gap-4">
              <div className="w-16 h-16 rounded-2xl bg-amber-400 text-amber-950 flex items-center justify-center text-3xl shadow-md shrink-0">
                🎮
              </div>
              <div>
                <h2 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child">
                  Pusat Permainan Literasi Bimo!
                </h2>
                <p className="text-sm font-semibold text-amber-900 font-child">
                  "Yuk bermain bersama Bimo! Dapatkan bintang di setiap permainan!"
                </p>
              </div>
            </div>

            <div className="flex items-center gap-2 bg-white/90 px-4 py-2 rounded-2xl border-2 border-amber-300 shadow-sm">
              <Star className="w-5 h-5 text-amber-500 fill-amber-400" />
              <span className="font-child font-black text-amber-900">
                Bintangmu: {child.stars}
              </span>
            </div>
          </div>

          {/* Game Groups Grid */}
          <div className="space-y-8">
            {gameCategories.map((group, gIdx) => (
              <div key={gIdx}>
                <h3 className="text-xl font-black text-[#25476A] font-child mb-4 tracking-wide">
                  {group.group}
                </h3>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                  {group.games.map((g) => (
                    <button
                      key={g.id}
                      onClick={() => {
                        audio.playTapSound();
                        setActiveMode(g.id);
                      }}
                      className="group bg-white hover:bg-amber-50/50 p-5 rounded-3xl border-3 border-sky-100 hover:border-amber-300 shadow-sm hover:shadow-xl transition-all duration-200 text-left flex flex-col justify-between active:scale-97"
                    >
                      <div>
                        <div className="flex items-center justify-between mb-3">
                          <div
                            className={`w-14 h-14 rounded-2xl bg-gradient-to-tr ${g.color} text-white flex items-center justify-center text-3xl shadow-md group-hover:scale-110 transition-transform`}
                          >
                            {g.icon}
                          </div>
                          <span className="text-xs font-bold font-child text-amber-500">
                            {g.stars}
                          </span>
                        </div>
                        <h4 className="text-xl font-black text-[#25476A] font-child group-hover:text-amber-900 transition-colors">
                          {g.title}
                        </h4>
                        <p className="text-xs text-slate-500 font-child mt-1 leading-relaxed">
                          {g.desc}
                        </p>
                      </div>

                      <div className="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs font-bold text-sky-600 font-child">
                        <span>Ayo Main</span>
                        <span>➔</span>
                      </div>
                    </button>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      ) : (
        // Active Game Arena
        <div className="bg-white rounded-3xl border-4 border-amber-200 p-4 sm:p-6 shadow-xl animate-in zoom-in-95">
          <div className="flex items-center justify-between mb-6 pb-4 border-b border-slate-100">
            <button
              onClick={() => {
                audio.playTapSound();
                audio.stopSpeaking();
                setActiveMode("none");
              }}
              className="flex items-center gap-2 bg-slate-100 hover:bg-slate-200 text-slate-700 px-4 py-2 rounded-2xl font-child font-bold text-sm shadow-sm transition-transform active:scale-95"
            >
              <ArrowLeft className="w-5 h-5" />
              <span>Pilih Game Lain</span>
            </button>

            <div className="flex items-center gap-2 bg-amber-50 border-2 border-amber-300 px-3.5 py-1.5 rounded-full shadow-sm">
              <Sparkles className="w-4 h-4 text-amber-500" />
              <span className="text-xs font-black text-amber-900 font-child uppercase tracking-wider">
                Hadiah: +2 Bintang
              </span>
            </div>
          </div>

          {/* Render Active Game */}
          {activeMode === "word-builder" && (
            <WordBuilderGame
              item={WORD_BUILDER_BANK[wbIndex]}
              onSuccess={() => handleGameComplete("word-formation", "indonesian")}
            />
          )}

          {activeMode === "tracing" && (
            <TracingGame
              item={TRACING_ITEMS[traceIndex]}
              onSuccess={() => handleGameComplete("letter-writing", "indonesian")}
            />
          )}

          {activeMode === "connect-pairs" && (
            <ConnectPairsGame
              pairs={CONNECT_PAIRS_SETS[pairSetIndex]}
              onSuccess={() => handleGameComplete("letter-recognition", "indonesian")}
            />
          )}

          {activeMode === "grid-coding" && (
            <GridCodingGame
              onSuccess={() => handleGameComplete("spatial-coding", "coding")}
            />
          )}

          {activeMode === "fill-word" && (
            <div className="text-center py-8">
              <h3 className="text-2xl font-bold font-child text-[#25476A] mb-4">
                📝 Lengkapi Kata yang Hilang!
              </h3>
              <div className="text-6xl mb-4">{FILL_WORD_BANK[fillIndex].imageEmoji}</div>
              <div className="text-3xl font-black font-child tracking-widest text-amber-900 bg-amber-50 inline-block px-6 py-3 rounded-2xl border-2 border-amber-300 mb-6">
                {FILL_WORD_BANK[fillIndex].pattern}
              </div>
              <div className="flex justify-center gap-3">
                {FILL_WORD_BANK[fillIndex].options.map((opt) => (
                  <button
                    key={opt}
                    onClick={() => {
                      audio.playTapSound();
                      if (opt === FILL_WORD_BANK[fillIndex].answer) {
                        audio.playCorrectSound();
                        audio.speak(`Benar! ${FILL_WORD_BANK[fillIndex].word}!`);
                        handleGameComplete("word-formation", "indonesian");
                      } else {
                        audio.playEncouragementSound();
                        audio.speak("Hampir tepat, coba huruf lain ya!");
                      }
                    }}
                    className="w-16 h-16 rounded-2xl bg-amber-400 hover:bg-amber-500 font-child font-black text-2xl text-amber-950 shadow-md border-2 border-amber-500 active:scale-95"
                  >
                    {opt}
                  </button>
                ))}
              </div>
            </div>
          )}

          {activeMode === "sound-guess" && (
            <div className="text-center py-8">
              <h3 className="text-2xl font-bold font-child text-[#25476A] mb-3">
                🔊 Dengar dan Tebak Bunyinya!
              </h3>
              <button
                onClick={() => audio.speak(SOUND_GUESS_BANK[soundIndex].soundCue)}
                className="px-6 py-4 bg-pink-100 hover:bg-pink-200 text-pink-700 rounded-2xl font-child font-black text-lg inline-flex items-center gap-3 shadow-md mb-6"
              >
                <span>Putar Suara 🔊</span>
              </button>
              <div className="flex justify-center gap-4">
                {SOUND_GUESS_BANK[soundIndex].options.map((opt) => (
                  <button
                    key={opt}
                    onClick={() => {
                      audio.playTapSound();
                      if (opt === SOUND_GUESS_BANK[soundIndex].answer) {
                        audio.playCorrectSound();
                        audio.speak(SOUND_GUESS_BANK[soundIndex].explanation);
                        handleGameComplete("phonics", "indonesian");
                      } else {
                        audio.playEncouragementSound();
                      }
                    }}
                    className="w-16 h-16 rounded-2xl bg-sky-400 hover:bg-sky-500 font-child font-black text-2xl text-white shadow-md border-2 border-sky-500 active:scale-95"
                  >
                    {opt}
                  </button>
                ))}
              </div>
            </div>
          )}

          {activeMode === "sentence-builder" && (
            <SentenceBuilderGame
              item={SENTENCE_BUILDER_BANK[sentenceIndex]}
              onSuccess={() => handleGameComplete("sentence-building", "indonesian")}
            />
          )}
        </div>
      )}
    </div>
  );
};
