import React, { useState } from "react";
import {
  X,
  Volume2,
  Search,
  MessageCircle,
  Check,
  ArrowLeft,
  ArrowRight,
  Star,
  Sparkles,
  Trophy,
} from "lucide-react";
import { LearningModule, ChildProfile } from "../../types";
import { audio } from "../../core/audio";
import { storage } from "../../core/storage";
import { evaluateAdaptiveStep, initialAdaptiveState } from "../../core/adaptive";
import { BimoMascot } from "../../components/BimoMascot";
import confetti from "canvas-confetti";

interface ModuleRunnerProps {
  module: LearningModule;
  child: ChildProfile;
  onExit: () => void;
  onComplete: () => void;
}

export const ModuleRunner: React.FC<ModuleRunnerProps> = ({
  module,
  child,
  onExit,
  onComplete,
}) => {
  // 5 Steps: 0 = learn, 1 = explore, 2 = game, 3 = practice, 4 = review
  const [currentStep, setCurrentStep] = useState(0);
  const [practiceQuestionIdx, setPracticeQuestionIdx] = useState(0);
  const [selectedOptionId, setSelectedOptionId] = useState<string | null>(null);
  const [hasCheckedAnswer, setHasCheckedAnswer] = useState(false);
  const [isAnswerCorrect, setIsAnswerCorrect] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [hintLevel, setHintLevel] = useState(0);
  const [adaptiveState, setAdaptiveState] = useState(initialAdaptiveState);
  const [starsEarned, setStarsEarned] = useState(3);
  const [speechBubbleText, setSpeechBubbleText] = useState<string>(
    module.activities[0]?.bimoNarration || ""
  );

  const stepNames = ["Belajar", "Eksplorasi", "Bermain", "Latihan", "Selesai"];
  const currentActivity = module.activities[currentStep] || module.activities[0];
  const questions =
    module.activities.find((a) => a.type === "practice")?.questions || [];
  const currentQuestion = questions[practiceQuestionIdx] || questions[0];

  const triggerGrandConfetti = () => {
    try {
      // Wave 1: Center blast
      confetti({
        particleCount: 90,
        spread: 85,
        origin: { y: 0.55 },
        colors: [
          "#FFE34D",
          "#FF6B6B",
          "#4ECDC4",
          "#45B7D1",
          "#96CEB4",
          "#FFBE0B",
          "#FB5607",
          "#FF006E",
          "#8338EC",
          "#3A86FF",
        ],
      });

      // Wave 2: Left and right celebration cannons
      setTimeout(() => {
        confetti({
          particleCount: 55,
          angle: 60,
          spread: 65,
          origin: { x: 0.1, y: 0.7 },
          colors: ["#FFD700", "#FF69B4", "#00FFFF", "#32CD32"],
        });
        confetti({
          particleCount: 55,
          angle: 120,
          spread: 65,
          origin: { x: 0.9, y: 0.7 },
          colors: ["#FFD700", "#FF69B4", "#00FFFF", "#32CD32"],
        });
      }, 280);

      // Wave 3: Golden stars shower
      setTimeout(() => {
        confetti({
          particleCount: 45,
          spread: 100,
          origin: { y: 0.35 },
          shapes: ["star"],
          colors: ["#FFD700", "#FFA500", "#FFFF00"],
          scalar: 1.2,
        });
      }, 600);
    } catch {}
  };

  const completeModule = () => {
    setCurrentStep(4);
    audio.playTrophySound();
    storage.addStars(child.id, starsEarned);
    storage.saveModuleProgress(child.id, {
      childId: child.id,
      moduleId: module.id,
      status: "done",
      stars: starsEarned,
      lastStep: 4,
      completedAt: new Date().toISOString(),
    });

    triggerGrandConfetti();

    audio.speak(
      `Horeee! Selamat ${child.nickname}! Kamu berhasil menyelesaikan materi ${module.title}! Hebat sekali!`,
      { rate: 0.85 }
    );
  };

  const handleNextStep = () => {
    audio.playTapSound();
    audio.stopSpeaking();
    if (currentStep < 4) {
      const next = currentStep + 1;
      if (next === 4) {
        completeModule();
      } else {
        setCurrentStep(next);
        const nextAct = module.activities[next];
        if (nextAct?.bimoNarration) {
          setSpeechBubbleText(nextAct.bimoNarration);
          audio.speak(nextAct.bimoNarration);
        }
      }
    } else {
      triggerGrandConfetti();
      onComplete();
    }
  };

  const handlePrevStep = () => {
    audio.playTapSound();
    audio.stopSpeaking();
    if (currentStep > 0) {
      setCurrentStep((prev) => prev - 1);
    }
  };

  const handleSpeakQuestion = () => {
    if (!currentQuestion) return;
    audio.playTapSound();
    audio.speak(currentQuestion.audioText || currentQuestion.text);
  };

  const handleSelectOption = (optId: string) => {
    if (hasCheckedAnswer) return;
    audio.playTapSound();
    setSelectedOptionId(optId);
  };

  const handleCheckAnswer = () => {
    if (!selectedOptionId || hasCheckedAnswer || !currentQuestion) return;
    setHasCheckedAnswer(true);

    const chosen = currentQuestion.options.find((o) => o.id === selectedOptionId);
    const correct = Boolean(chosen?.isCorrect);
    setIsAnswerCorrect(correct);

    const { nextState, message } = evaluateAdaptiveStep(
      adaptiveState,
      correct,
      child.difficultyMode === "auto"
    );
    setAdaptiveState(nextState);
    setSpeechBubbleText(message);

    // Save attempt
    storage.addAttempt(child.id, {
      id: `att_${Date.now()}`,
      childId: child.id,
      moduleId: module.id,
      gameId: "module_quiz",
      skillId: currentQuestion.skillId,
      category: module.category,
      correct,
      usedHint: showHint,
      durationMs: 5000,
      difficulty: currentQuestion.difficulty,
      at: new Date().toISOString(),
    });

    if (correct) {
      audio.playCorrectSound();
      audio.speak(message);
    } else {
      audio.playEncouragementSound();
      audio.speak(message);
    }
  };

  const handleNextQuestion = () => {
    audio.playTapSound();
    if (practiceQuestionIdx < questions.length - 1) {
      setPracticeQuestionIdx((prev) => prev + 1);
      setSelectedOptionId(null);
      setHasCheckedAnswer(false);
      setShowHint(false);
      setHintLevel(0);
      const nextQ = questions[practiceQuestionIdx + 1];
      if (nextQ) {
        audio.speak(nextQ.audioText || nextQ.text);
      }
    } else {
      // Completed all questions -> Go to step 4 (Review) with grand celebration!
      completeModule();
    }
  };

  const handleTriggerHint = () => {
    audio.playTapSound();
    setShowHint(true);
    const nextLevel = Math.min(hintLevel + 1, 3);
    setHintLevel(nextLevel);
    if (currentQuestion) {
      audio.speak(currentQuestion.hint, { rate: 0.85 });
      setSpeechBubbleText(`Petunjuk: ${currentQuestion.hint}`);
    }
  };

  const handleBimoSpeak = () => {
    audio.playTapSound();
    audio.speak(speechBubbleText, { rate: 0.85 });
  };

  return (
    <div className="w-full max-w-5xl mx-auto flex flex-col justify-between min-h-[620px] bg-white rounded-[32px] border-4 border-amber-300 shadow-2xl p-4 sm:p-6 select-none relative animate-in zoom-in-95 duration-200">
      {/* Top Question Header (Reference 2 quiz screen pattern) */}
      <div>
        <div className="flex items-center justify-between gap-3 mb-3">
          {/* Round ✕ Button at Top-Left */}
          <button
            onClick={onExit}
            className="w-12 h-12 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-full flex items-center justify-center font-black transition-transform active:scale-95 shadow-sm"
            title="Keluar Modul"
          >
            <X className="w-6 h-6" />
          </button>

          {/* Step / Question Badge at Top-Right */}
          <div className="flex items-center gap-2">
            <span className="px-4 py-1.5 bg-gradient-to-r from-amber-300 to-yellow-400 border border-amber-500 text-amber-950 font-child font-black text-sm rounded-full shadow-sm">
              {currentStep === 3
                ? `Soal ${practiceQuestionIdx + 1} / ${questions.length}`
                : stepNames[currentStep]}
            </span>
          </div>
        </div>

        {/* Full-width Green Progress Bar at the Top (Reference 2) */}
        <div className="w-full bg-slate-100 h-4 rounded-full overflow-hidden border border-slate-200 p-0.5 mb-6">
          <div
            className="bg-emerald-500 h-full rounded-full transition-all duration-300"
            style={{
              width: `${
                currentStep === 3
                  ? ((practiceQuestionIdx + 1) / questions.length) * 100
                  : ((currentStep + 1) / 5) * 100
              }%`,
            }}
          />
        </div>
      </div>

      {/* Middle Stage Content */}
      <div className="flex-1 flex flex-col items-center justify-center py-2">
        {/* Step 0: Learn */}
        {currentStep === 0 && (
          <div className="text-center max-w-xl animate-in fade-in">
            <div className="flex justify-center mb-4">
              <BimoMascot expression="reading" size="lg" />
            </div>
            <h3 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child mb-2">
              {currentActivity.title}
            </h3>
            <p className="text-lg text-slate-600 font-child leading-relaxed mb-6">
              {currentActivity.details || currentActivity.bimoNarration}
            </p>
            <button
              onClick={() => audio.speak(currentActivity.details || currentActivity.bimoNarration)}
              className="inline-flex items-center gap-2 px-5 py-2.5 bg-amber-100 hover:bg-amber-200 text-amber-900 rounded-2xl font-child font-bold text-sm shadow-sm"
            >
              <Volume2 className="w-5 h-5" />
              <span>Dengarkan Bimo</span>
            </button>
          </div>
        )}

        {/* Step 1: Explore */}
        {currentStep === 1 && (
          <div className="w-full text-center animate-in fade-in">
            <h3 className="text-2xl font-black text-[#25476A] font-child mb-2">
              {currentActivity.title}
            </h3>
            <p className="text-sm font-semibold text-slate-500 font-child mb-6">
              Sentuh kartu di bawah ini untuk melihat dan mendengar keajaibannya!
            </p>
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 max-w-2xl mx-auto">
              {currentActivity.exploreItems?.map((item, idx) => (
                <button
                  key={idx}
                  onClick={() => {
                    audio.playTapSound();
                    audio.speak(item.soundText);
                  }}
                  className="p-5 bg-gradient-to-b from-white to-sky-50 hover:to-amber-50 rounded-3xl border-3 border-sky-200 hover:border-amber-400 shadow-md hover:shadow-xl transition-all duration-200 flex flex-col items-center group active:scale-95"
                >
                  <span className="text-5xl sm:text-6xl mb-3 group-hover:scale-110 transition-transform">
                    {item.icon}
                  </span>
                  <span className="font-child font-black text-lg text-[#25476A] mb-1">
                    {item.label}
                  </span>
                  {item.explanation && (
                    <span className="text-xs font-bold text-sky-600 font-child">
                      {item.explanation}
                    </span>
                  )}
                </button>
              ))}
            </div>
          </div>
        )}

        {/* Step 2: Game */}
        {currentStep === 2 && (
          <div className="text-center max-w-lg animate-in fade-in">
            <div className="text-6xl mb-4">🎮</div>
            <h3 className="text-2xl font-black text-[#25476A] font-child mb-2">
              Saatnya Bermain Ceria!
            </h3>
            <p className="text-base text-slate-600 font-child mb-6">
              Sentuh tombol di bawah untuk melanjutkan ke arena latihan interaktif.
            </p>
          </div>
        )}

        {/* Step 3: Practice (Reference 2 Quiz Layout) */}
        {currentStep === 3 && currentQuestion && (
          <div className="w-full flex flex-col items-center animate-in fade-in">
            {/* Question Text in Center + 🔊 Audio Button */}
            <div className="flex items-center justify-center gap-3 mb-6 text-center max-w-xl">
              <h3 className="text-xl sm:text-2xl font-black text-[#25476A] font-child">
                {currentQuestion.text}
              </h3>
              <button
                onClick={handleSpeakQuestion}
                className="w-11 h-11 rounded-2xl bg-amber-100 hover:bg-amber-200 text-amber-900 border-2 border-amber-300 flex items-center justify-center shrink-0 shadow-sm transition-transform active:scale-95"
                title="Bacakan Soal"
              >
                <Volume2 className="w-5 h-5" />
              </button>
            </div>

            {/* 4 Answer Cards Arranged Horizontally with Yellow Frames (Reference 2) */}
            <div className="w-full grid grid-cols-1 sm:grid-cols-3 md:grid-cols-3 gap-3.5 sm:gap-4 max-w-3xl mb-6">
              {currentQuestion.options.map((opt) => {
                const isSelected = selectedOptionId === opt.id;
                let cardStyle = "bg-white hover:bg-amber-50 border-amber-300 text-[#25476A]";

                if (isSelected) {
                  cardStyle = "bg-amber-100 border-amber-500 text-amber-950 scale-103 shadow-lg";
                }
                if (hasCheckedAnswer) {
                  if (opt.isCorrect) {
                    cardStyle = "bg-emerald-100 border-emerald-500 text-emerald-900 scale-103 shadow-lg";
                  } else if (isSelected && !opt.isCorrect) {
                    cardStyle = "bg-rose-50 border-rose-400 text-rose-800 opacity-80";
                  }
                }

                // If Hint 2 triggered, dim incorrect options
                if (showHint && hintLevel >= 2 && !opt.isCorrect) {
                  cardStyle += " opacity-40";
                }

                return (
                  <button
                    key={opt.id}
                    onClick={() => handleSelectOption(opt.id)}
                    disabled={hasCheckedAnswer}
                    className={`p-4 rounded-3xl border-3 flex flex-col items-center justify-center transition-all duration-200 shadow-md min-h-[110px] active:scale-95 ${cardStyle}`}
                  >
                    {opt.imageEmoji && (
                      <span className="text-4xl mb-2 drop-shadow-sm">{opt.imageEmoji}</span>
                    )}
                    <span className="font-child font-bold text-base sm:text-lg text-center">
                      {opt.text}
                    </span>
                  </button>
                );
              })}
            </div>

            {/* Feedback Message Bar */}
            {hasCheckedAnswer && (
              <div
                className={`w-full max-w-xl p-3.5 rounded-2xl text-center font-child font-bold text-base shadow-sm animate-in fade-in ${
                  isAnswerCorrect
                    ? "bg-emerald-100 border border-emerald-300 text-emerald-800"
                    : "bg-amber-50 border border-amber-300 text-amber-800"
                }`}
              >
                {speechBubbleText}
              </div>
            )}
          </div>
        )}

        {/* Step 4: Review & Reward */}
        {currentStep === 4 && (
          <div className="text-center max-w-md animate-in zoom-in-95">
            <div
              onClick={() => {
                audio.playTapSound();
                triggerGrandConfetti();
              }}
              className="flex justify-center mb-3 cursor-pointer group"
              title="Sentuh Bimo untuk kembang api!"
            >
              <BimoMascot expression="celebrating" size="lg" />
            </div>
            <div
              onClick={() => {
                audio.playTapSound();
                triggerGrandConfetti();
              }}
              className="flex justify-center gap-2 mb-3 cursor-pointer"
            >
              {[1, 2, 3].map((s) => (
                <Star
                  key={s}
                  className="w-10 h-10 text-amber-400 fill-amber-400 animate-bounce hover:scale-125 transition-transform"
                />
              ))}
            </div>
            <h3 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child mb-2">
              Hore! Materi Selesai! 🎉
            </h3>
            <p className="text-base text-slate-600 font-child mb-6">
              Kamu telah menyelesaikan <strong>{module.title}</strong> dan mendapatkan 3 Bintang Bersinar!
            </p>

            <div className="flex flex-col sm:flex-row items-center justify-center gap-3">
              <button
                onClick={() => {
                  audio.playTapSound();
                  triggerGrandConfetti();
                }}
                className="w-full sm:w-auto px-5 py-3 bg-amber-100 hover:bg-amber-200 text-amber-900 border-2 border-amber-400 rounded-2xl font-child font-bold text-sm shadow-sm transition-transform active:scale-95 flex items-center justify-center gap-1.5"
              >
                <Sparkles className="w-4 h-4 text-amber-600" />
                <span>Kembang Api Lagi! 🎉</span>
              </button>

              <button
                onClick={() => {
                  triggerGrandConfetti();
                  setTimeout(onComplete, 400);
                }}
                className="w-full sm:w-auto px-7 py-3.5 bg-gradient-to-r from-emerald-400 to-green-500 hover:from-emerald-500 hover:to-green-600 text-white rounded-2xl font-child font-black text-lg shadow-lg transition-transform active:scale-95 flex items-center justify-center gap-2"
              >
                <span>Simpan & Selesai 🌟</span>
              </button>
            </div>
          </div>
        )}
      </div>

      {/* Bottom Control Bar with Side Columns (Reference 2 Pattern) */}
      <div className="w-full pt-4 border-t border-slate-100 flex items-center justify-between gap-3">
        {/* Left Side Column: Previous / Next Step Arrows (Reference 2) */}
        <div className="flex items-center gap-2">
          <button
            onClick={handlePrevStep}
            disabled={currentStep === 0}
            className="w-12 h-12 bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] disabled:opacity-30 border-2 border-amber-400 text-amber-950 rounded-2xl flex items-center justify-center shadow-md transition-transform active:scale-95"
            title="Langkah Sebelumnya"
          >
            <ArrowLeft className="w-6 h-6" />
          </button>
        </div>

        {/* Center Indicator Dots (● ● ● ● ●) for 5 stages */}
        <div className="flex items-center gap-2">
          {[0, 1, 2, 3, 4].map((step) => (
            <div
              key={step}
              className={`w-3.5 h-3.5 rounded-full transition-all ${
                currentStep === step
                  ? "bg-amber-500 scale-125 ring-2 ring-amber-300"
                  : step < currentStep
                  ? "bg-emerald-400"
                  : "bg-slate-200"
              }`}
            />
          ))}
        </div>

        {/* Right Side Column Buttons: 🔍 Hint, 💬 Speech, ✔ Green Check Button (Reference 2) */}
        <div className="flex items-center gap-2">
          {/* 🔍 Pink Hint Button */}
          {currentStep === 3 && (
            <button
              onClick={handleTriggerHint}
              className="w-12 h-12 bg-[#FF8FAB] hover:bg-[#FF7599] border-2 border-pink-400 text-white rounded-2xl flex items-center justify-center shadow-md transition-transform active:scale-95"
              title="Bantuan / Petunjuk"
            >
              <Search className="w-5 h-5" />
            </button>
          )}

          {/* 💬 Blue Bimo Speech Button */}
          <button
            onClick={handleBimoSpeak}
            className="w-12 h-12 bg-sky-400 hover:bg-sky-500 border-2 border-sky-500 text-white rounded-2xl flex items-center justify-center shadow-md transition-transform active:scale-95"
            title="Bimo Berbicara"
          >
            <MessageCircle className="w-5 h-5" />
          </button>

          {/* Big Green Confirm ✔ Button (Reference 2) */}
          {currentStep === 3 ? (
            !hasCheckedAnswer ? (
              <button
                onClick={handleCheckAnswer}
                disabled={!selectedOptionId}
                className="w-12 h-12 bg-[#4CD964] hover:bg-[#3ec455] disabled:opacity-40 border-2 border-green-500 text-white rounded-2xl flex items-center justify-center shadow-md transition-transform active:scale-95"
                title="Periksa Jawaban"
              >
                <Check className="w-7 h-7 stroke-[3]" />
              </button>
            ) : (
              <button
                onClick={handleNextQuestion}
                className="px-5 h-12 bg-gradient-to-r from-amber-400 to-orange-400 text-white font-child font-black rounded-2xl flex items-center gap-1.5 shadow-md transition-transform active:scale-95"
              >
                <span>Lanjut</span>
                <ArrowRight className="w-5 h-5" />
              </button>
            )
          ) : (
            <button
              onClick={handleNextStep}
              className="px-5 h-12 bg-gradient-to-r from-amber-400 to-orange-400 text-white font-child font-black rounded-2xl flex items-center gap-1.5 shadow-md transition-transform active:scale-95"
            >
              <span>Lanjut</span>
              <ArrowRight className="w-5 h-5" />
            </button>
          )}
        </div>
      </div>
    </div>
  );
};
