import React from "react";
import { BimoMascot } from "./BimoMascot";

interface RestBreakModalProps {
  isOpen: boolean;
  onContinue: () => void;
}

export const RestBreakModal: React.FC<RestBreakModalProps> = ({
  isOpen,
  onContinue,
}) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-md p-4 animate-in fade-in select-none">
      <div className="bg-white rounded-[36px] max-w-md w-full border-4 border-amber-300 p-6 sm:p-8 text-center shadow-2xl">
        <div className="flex justify-center mb-3">
          <BimoMascot expression="encouraging" size="lg" />
        </div>

        <h3 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child mb-2">
          Hebat! Waktunya Istirahat Sebentar 😊
        </h3>
        <p className="text-sm font-semibold text-slate-500 font-child mb-6">
          Kamu sudah banyak belajar hari ini! Yuk segarkan badanmu sejenak:
        </p>

        <div className="grid grid-cols-3 gap-3 mb-6">
          <div className="p-3 bg-sky-50 rounded-2xl border border-sky-200">
            <span className="text-3xl block mb-1">💧</span>
            <span className="text-xs font-bold text-sky-800 font-child">
              Minum Air
            </span>
          </div>
          <div className="p-3 bg-emerald-50 rounded-2xl border border-emerald-200">
            <span className="text-3xl block mb-1">👀</span>
            <span className="text-xs font-bold text-emerald-800 font-child">
              Istirahat Mata
            </span>
          </div>
          <div className="p-3 bg-amber-50 rounded-2xl border border-amber-200">
            <span className="text-3xl block mb-1">🤸</span>
            <span className="text-xs font-bold text-amber-800 font-child">
              Bergerak
            </span>
          </div>
        </div>

        <button
          onClick={onContinue}
          className="w-full py-3.5 bg-gradient-to-r from-amber-400 to-orange-400 hover:from-amber-500 hover:to-orange-500 text-white rounded-2xl font-child font-black text-lg shadow-md transition-transform active:scale-95"
        >
          Sudah Segar! Lanjut Bermain 🐰
        </button>
      </div>
    </div>
  );
};
