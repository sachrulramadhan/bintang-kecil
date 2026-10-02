import React, { useState } from "react";
import { ArrowLeft, ArrowRight, Volume2, Bookmark, CheckCircle2, Sparkles, Star } from "lucide-react";
import { Story, ChildProfile } from "../../types";
import { audio } from "../../core/audio";
import { storage } from "../../core/storage";
import confetti from "canvas-confetti";

interface StoryReaderProps {
  story: Story;
  child: ChildProfile;
  onBack: () => void;
  onStoryFinished?: () => void;
}

export const StoryReader: React.FC<StoryReaderProps> = ({
  story,
  child,
  onBack,
  onStoryFinished,
}) => {
  const [currentPageIdx, setCurrentPageIdx] = useState(0);
  const [isReadingAudio, setIsReadingAudio] = useState(false);
  const [showQuiz, setShowQuiz] = useState(false);
  const [quizAnswers, setQuizAnswers] = useState<number[]>([]);
  const [quizDone, setQuizDone] = useState(false);

  const currentPage = story.pages[currentPageIdx];
  const isLastPage = currentPageIdx === story.pages.length - 1;

  const handleReadNarration = () => {
    if (isReadingAudio) {
      audio.stopSpeaking();
      setIsReadingAudio(false);
      return;
    }
    setIsReadingAudio(true);
    audio.speak(currentPage.text, {
      lang: "id-ID",
      rate: 0.85,
      pitch: 1.1,
      onEnd: () => setIsReadingAudio(false),
    });
  };

  const handleNextPage = () => {
    audio.playTapSound();
    audio.stopSpeaking();
    setIsReadingAudio(false);
    if (!isLastPage) {
      setCurrentPageIdx((prev) => prev + 1);
    } else {
      setShowQuiz(true);
    }
  };

  const handlePrevPage = () => {
    audio.playTapSound();
    audio.stopSpeaking();
    setIsReadingAudio(false);
    if (currentPageIdx > 0) {
      setCurrentPageIdx((prev) => prev - 1);
    }
  };

  const handleAnswerQuiz = (qIdx: number, optIdx: number) => {
    const updated = [...quizAnswers];
    updated[qIdx] = optIdx;
    setQuizAnswers(updated);
    audio.playTapSound();

    if (optIdx === story.questions[qIdx].answer) {
      audio.playCorrectSound();
    } else {
      audio.playEncouragementSound();
    }

    if (updated.length === story.questions.length && updated.every((v) => v !== undefined)) {
      setQuizDone(true);
      audio.playTrophySound();
      storage.addStars(child.id, 3);
      try {
        confetti({ particleCount: 50, spread: 60, origin: { y: 0.6 } });
      } catch {}
    }
  };

  return (
    <div className="w-full max-w-5xl mx-auto p-3 sm:p-6 flex flex-col items-center select-none animate-in fade-in duration-300">
      {/* Top Header */}
      <div className="w-full flex items-center justify-between mb-4">
        <button
          onClick={onBack}
          className="flex items-center gap-2 bg-white/90 hover:bg-white px-4 py-2 rounded-2xl shadow-sm border border-sky-200 text-[#25476A] font-child font-bold transition-transform active:scale-95"
        >
          <ArrowLeft className="w-5 h-5 text-sky-600" />
          <span>Kembali ke Buku</span>
        </button>

        <div className="flex items-center gap-2 bg-amber-50 border-2 border-amber-300 px-4 py-1.5 rounded-full shadow-sm">
          <Bookmark className="w-4 h-4 text-rose-500 fill-rose-500" />
          <span className="font-child font-bold text-sm text-[#25476A]">
            {showQuiz ? "Pertanyaan Cerita" : `Halaman ${currentPageIdx + 1} dari ${story.pages.length}`}
          </span>
        </div>
      </div>

      {!showQuiz ? (
        // Open Book View (Reference 3 bottom layout)
        <div className="relative w-full bg-[#3B82F6] p-3 sm:p-5 rounded-[32px] shadow-2xl border-4 border-blue-400">
          {/* Red Ribbon Bookmark */}
          <div className="absolute top-0 right-16 w-8 h-16 bg-rose-500 rounded-b-md shadow-md z-10 flex flex-col items-center justify-end pb-2">
            <div className="w-3 h-3 bg-rose-300/60 rounded-full" />
          </div>

          {/* Book Inner Spine & Two Pages */}
          <div className="grid grid-cols-1 md:grid-cols-2 bg-[#FBF9F1] rounded-[20px] sm:rounded-[24px] shadow-inner border border-amber-100/80 overflow-hidden min-h-[320px] sm:min-h-[420px]">
            {/* Left Page: Big Colorful Scene & Keywords */}
            <div className="p-4 sm:p-6 md:p-8 flex flex-col items-center justify-center border-b md:border-b-0 md:border-r border-amber-200/50 bg-gradient-to-b from-[#FFFDF9] to-[#F5EED9]/40 relative">
              <div className="text-5xl sm:text-7xl md:text-8xl my-auto animate-bounce py-3 sm:py-6 text-center drop-shadow-md">
                {currentPage.illustration}
              </div>

              {/* Keyword Badges */}
              <div className="w-full flex items-center justify-center gap-1.5 sm:gap-2 flex-wrap mt-auto pt-2 sm:pt-4">
                {currentPage.keywords.map((kw, i) => (
                  <span
                    key={i}
                    className="px-2.5 py-0.5 sm:px-3 sm:py-1 bg-amber-100/80 text-amber-900 border border-amber-300/60 rounded-full text-[10px] sm:text-xs font-bold font-child uppercase tracking-wider"
                  >
                    #{kw}
                  </span>
                ))}
              </div>
            </div>

            {/* Right Page: Text & Audio Narration */}
            <div className="p-4 sm:p-6 md:p-8 flex flex-col justify-between bg-[#FFFDF9]">
              <div>
                <div className="flex items-center justify-between pb-3 sm:pb-4 mb-3 sm:mb-4 border-b border-amber-200/40">
                  <h3 className="text-lg sm:text-xl md:text-2xl font-black text-[#25476A] font-child line-clamp-1">
                    {story.title}
                  </h3>
                  <button
                    onClick={handleReadNarration}
                    className={`w-10 h-10 sm:w-12 sm:h-12 rounded-2xl flex items-center justify-center transition-all shadow-md active:scale-95 shrink-0 ml-2 ${
                      isReadingAudio
                        ? "bg-pink-500 text-white animate-pulse"
                        : "bg-amber-100 hover:bg-amber-200 text-amber-800 border-2 border-amber-300"
                    }`}
                    title="Bacakan Cerita"
                  >
                    <Volume2 className="w-5 h-5 sm:w-6 sm:h-6" />
                  </button>
                </div>

                {/* Main Story Paragraph */}
                <p className="text-base sm:text-xl md:text-2xl leading-relaxed text-[#25476A] font-child font-semibold tracking-wide py-2 sm:py-4">
                  {currentPage.text}
                </p>
              </div>

              {/* Bottom Pagination Controls */}
              <div className="flex items-center justify-between pt-4 sm:pt-6 border-t border-amber-200/40 gap-2">
                <button
                  onClick={handlePrevPage}
                  disabled={currentPageIdx === 0}
                  className="px-3 sm:px-4 py-2 sm:py-2.5 rounded-xl sm:rounded-2xl bg-slate-100 hover:bg-slate-200 disabled:opacity-30 disabled:pointer-events-none font-child font-bold text-xs sm:text-sm text-slate-700 flex items-center gap-1 transition-all shadow-xs"
                >
                  <ArrowLeft className="w-4 h-4 sm:w-5 sm:h-5" />
                  <span className="hidden xs:inline">Sebelumnya</span>
                </button>

                <span className="text-xs sm:text-sm font-bold text-amber-700 font-child">
                  {currentPageIdx + 1} / {story.pages.length}
                </span>

                <button
                  onClick={handleNextPage}
                  className="px-3.5 sm:px-5 py-2 sm:py-2.5 rounded-xl sm:rounded-2xl bg-gradient-to-r from-amber-400 to-orange-400 hover:from-amber-500 hover:to-orange-500 text-white font-child font-bold text-xs sm:text-sm flex items-center gap-1 transition-all shadow-md active:scale-95"
                >
                  <span>{isLastPage ? "Selesai 🌟" : "Berikutnya"}</span>
                  <ArrowRight className="w-4 h-4 sm:w-5 sm:h-5" />
                </button>
              </div>
            </div>
          </div>
        </div>
      ) : (
        // Story Quiz & Comprehension Mode
        <div className="w-full bg-white rounded-3xl shadow-xl border-4 border-amber-200 p-6 sm:p-8 animate-in zoom-in-95 duration-200">
          <div className="text-center mb-6">
            <div className="inline-flex items-center gap-2 px-4 py-1.5 bg-amber-100 rounded-full text-amber-800 font-child font-bold text-sm mb-2">
              <Sparkles className="w-4 h-4 text-amber-500" />
              Pertanyaan Pemahaman Cerita
            </div>
            <h3 className="text-2xl font-black text-[#25476A] font-child">
              Ayo Jawab Pertanyaan Bimo!
            </h3>
            <p className="text-sm text-slate-500 font-child">
              Pilih jawaban yang benar berdasarkan cerita yang baru saja kita baca.
            </p>
          </div>

          <div className="space-y-6">
            {story.questions.map((q, qIdx) => {
              const selectedOpt = quizAnswers[qIdx];
              return (
                <div key={qIdx} className="bg-sky-50/70 p-5 rounded-2xl border-2 border-sky-100">
                  <h4 className="text-lg font-bold text-[#25476A] font-child mb-3 flex items-start gap-2">
                    <span className="w-7 h-7 rounded-full bg-sky-200 text-sky-800 flex items-center justify-center text-sm font-black shrink-0">
                      {qIdx + 1}
                    </span>
                    <span>{q.question}</span>
                  </h4>

                  <div className="grid grid-cols-1 sm:grid-cols-3 gap-2.5">
                    {q.options.map((opt, optIdx) => {
                      const isChosen = selectedOpt === optIdx;
                      const isCorrect = optIdx === q.answer;
                      return (
                        <button
                          key={optIdx}
                          onClick={() => handleAnswerQuiz(qIdx, optIdx)}
                          className={`p-3.5 rounded-xl font-child font-bold text-sm transition-all border-2 text-left flex items-center justify-between ${
                            isChosen
                              ? isCorrect
                                ? "bg-emerald-100 border-emerald-400 text-emerald-800 shadow-md scale-102"
                                : "bg-rose-50 border-rose-300 text-rose-700"
                              : "bg-white hover:bg-amber-50 border-slate-200 text-slate-700"
                          }`}
                        >
                          <span>{opt}</span>
                          {isChosen && isCorrect && <CheckCircle2 className="w-5 h-5 text-emerald-600 shrink-0" />}
                        </button>
                      );
                    })}
                  </div>
                  {selectedOpt !== undefined && (
                    <p className="mt-2 text-xs font-semibold text-slate-500 font-child italic">
                      💡 {q.explanation}
                    </p>
                  )}
                </div>
              );
            })}
          </div>

          {/* Moral Lesson Footer */}
          {quizDone && (
            <div className="mt-8 p-6 bg-gradient-to-r from-amber-100 to-yellow-100 rounded-3xl border-2 border-amber-300 text-center animate-in fade-in duration-300">
              <div className="text-3xl mb-2">⭐ ⭐ ⭐</div>
              <h4 className="text-xl font-black text-amber-900 font-child mb-1">
                Pesan Moral / Fakta Cerita:
              </h4>
              <p className="text-base text-amber-800 font-child font-semibold max-w-xl mx-auto">
                "{story.moralLesson}"
              </p>
              <div className="mt-5 flex justify-center gap-3">
                <button
                  onClick={onBack}
                  className="px-6 py-3 bg-gradient-to-r from-emerald-500 to-green-500 hover:from-emerald-600 hover:to-green-600 text-white rounded-2xl font-child font-black text-lg shadow-lg transition-transform active:scale-95"
                >
                  Selesai Membaca 🐰
                </button>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
};
