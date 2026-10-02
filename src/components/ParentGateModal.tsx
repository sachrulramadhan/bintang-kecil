import React, { useState, useEffect } from "react";
import { Lock, X, RefreshCw, KeyRound } from "lucide-react";
import { storage, hashString } from "../core/storage";

interface ParentGateModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSuccess: () => void;
}

export const ParentGateModal: React.FC<ParentGateModalProps> = ({
  isOpen,
  onClose,
  onSuccess,
}) => {
  const [stage, setStage] = useState<"math" | "pin">("math");
  const [num1, setNum1] = useState(7);
  const [num2, setNum2] = useState(5);
  const [mathAnswer, setMathAnswer] = useState("");
  const [pinInput, setPinInput] = useState("");
  const [errorMsg, setErrorMsg] = useState("");

  const generateProblem = () => {
    const a = Math.floor(Math.random() * 8) + 6; // 6 - 13
    const b = Math.floor(Math.random() * 8) + 5; // 5 - 12
    setNum1(a);
    setNum2(b);
    setMathAnswer("");
    setErrorMsg("");
  };

  useEffect(() => {
    if (isOpen) {
      setStage("math");
      setPinInput("");
      generateProblem();
    }
  }, [isOpen]);

  if (!isOpen) return null;

  const handleKeypadPress = (val: string) => {
    if (stage === "math") {
      if (mathAnswer.length < 3) {
        setMathAnswer((prev) => prev + val);
      }
    } else {
      if (pinInput.length < 6) {
        setPinInput((prev) => prev + val);
      }
    }
    setErrorMsg("");
  };

  const handleBackspace = () => {
    if (stage === "math") {
      setMathAnswer((prev) => prev.slice(0, -1));
    } else {
      setPinInput((prev) => prev.slice(0, -1));
    }
    setErrorMsg("");
  };

  const handleVerifyMath = () => {
    const expected = num1 + num2;
    if (parseInt(mathAnswer, 10) === expected) {
      // Check if parent PIN exists
      const parent = storage.getParentAccount();
      if (parent && parent.pinHash) {
        setStage("pin");
        setErrorMsg("");
      } else {
        onSuccess();
      }
    } else {
      setErrorMsg("Jawaban belum tepat. Coba soal yang lain ya!");
      generateProblem();
    }
  };

  const handleVerifyPin = async () => {
    const parent = storage.getParentAccount();
    if (!parent || !parent.pinHash) {
      onSuccess();
      return;
    }
    const entered = await hashString(pinInput);
    if (entered === parent.pinHash) {
      onSuccess();
    } else {
      setErrorMsg("PIN belum tepat. Coba lagi ya.");
      setPinInput("");
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 animate-in fade-in duration-200">
      <div className="relative w-full max-w-md bg-white rounded-3xl shadow-2xl border-4 border-amber-300 p-6 overflow-hidden">
        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-11 h-11 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-full flex items-center justify-center transition-transform active:scale-95 shadow-sm"
        >
          <X className="w-6 h-6" />
        </button>

        {/* Header */}
        <div className="flex items-center gap-3 mb-4">
          <div className="w-12 h-12 rounded-2xl bg-amber-100 text-amber-600 flex items-center justify-center shadow-inner">
            <Lock className="w-6 h-6" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-slate-800 font-child">
              Area Khusus Orang Tua
            </h3>
            <p className="text-xs text-slate-500">
              {stage === "math"
                ? "Buktikan Anda orang dewasa dengan menjawab soal ini"
                : "Masukkan PIN Orang Tua"}
            </p>
          </div>
        </div>

        {errorMsg && (
          <div className="mb-4 p-2.5 bg-rose-50 border border-rose-200 text-rose-600 rounded-xl text-xs font-semibold text-center">
            {errorMsg}
          </div>
        )}

        {stage === "math" ? (
          <div>
            {/* Math challenge display */}
            <div className="flex items-center justify-center gap-4 py-4 bg-sky-50 rounded-2xl border-2 border-sky-100 mb-5">
              <span className="text-3xl font-extrabold text-sky-800 font-child">
                {num1} + {num2} =
              </span>
              <div className="w-20 h-14 bg-white rounded-xl border-2 border-sky-300 flex items-center justify-center text-3xl font-black text-sky-600 shadow-inner">
                {mathAnswer || "?"}
              </div>
              <button
                type="button"
                onClick={generateProblem}
                className="p-2 text-sky-500 hover:text-sky-700 rounded-lg hover:bg-sky-100"
                title="Ganti soal"
              >
                <RefreshCw className="w-5 h-5" />
              </button>
            </div>

            {/* Keypad */}
            <div className="grid grid-cols-3 gap-2.5 mb-4">
              {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((digit) => (
                <button
                  key={digit}
                  onClick={() => handleKeypadPress(digit.toString())}
                  className="h-13 bg-slate-50 hover:bg-amber-100 active:bg-amber-200 rounded-2xl font-bold text-xl text-slate-700 shadow-sm border border-slate-200 transition-colors"
                >
                  {digit}
                </button>
              ))}
              <button
                onClick={handleBackspace}
                className="h-13 bg-slate-100 hover:bg-slate-200 rounded-2xl font-semibold text-sm text-slate-600 shadow-sm border border-slate-200"
              >
                Hapus
              </button>
              <button
                onClick={() => handleKeypadPress("0")}
                className="h-13 bg-slate-50 hover:bg-amber-100 rounded-2xl font-bold text-xl text-slate-700 shadow-sm border border-slate-200"
              >
                0
              </button>
              <button
                onClick={handleVerifyMath}
                disabled={!mathAnswer}
                className="h-13 bg-emerald-500 hover:bg-emerald-600 disabled:bg-slate-200 disabled:text-slate-400 text-white rounded-2xl font-bold text-sm shadow-md transition-all active:scale-95"
              >
                Lanjut
              </button>
            </div>
          </div>
        ) : (
          <div>
            <div className="text-center py-3">
              <div className="flex justify-center gap-3 mb-4">
                {[0, 1, 2, 3].map((idx) => (
                  <div
                    key={idx}
                    className={`w-12 h-12 rounded-xl border-2 flex items-center justify-center text-2xl font-bold transition-all ${
                      pinInput.length > idx
                        ? "border-amber-500 bg-amber-50 text-amber-700"
                        : "border-slate-200 bg-slate-50"
                    }`}
                  >
                    {pinInput.length > idx ? "●" : ""}
                  </div>
                ))}
              </div>
            </div>

            {/* Keypad for PIN */}
            <div className="grid grid-cols-3 gap-2.5 mb-4">
              {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((digit) => (
                <button
                  key={digit}
                  onClick={() => handleKeypadPress(digit.toString())}
                  className="h-13 bg-slate-50 hover:bg-amber-100 rounded-2xl font-bold text-xl text-slate-700 shadow-sm border border-slate-200"
                >
                  {digit}
                </button>
              ))}
              <button
                onClick={handleBackspace}
                className="h-13 bg-slate-100 hover:bg-slate-200 rounded-2xl font-semibold text-sm text-slate-600 shadow-sm border border-slate-200"
              >
                Hapus
              </button>
              <button
                onClick={() => handleKeypadPress("0")}
                className="h-13 bg-slate-50 hover:bg-amber-100 rounded-2xl font-bold text-xl text-slate-700 shadow-sm border border-slate-200"
              >
                0
              </button>
              <button
                onClick={handleVerifyPin}
                disabled={pinInput.length < 4}
                className="h-13 bg-amber-500 hover:bg-amber-600 disabled:bg-slate-200 disabled:text-slate-400 text-white rounded-2xl font-bold text-sm shadow-md transition-all active:scale-95"
              >
                Masuk
              </button>
            </div>
          </div>
        )}

        <div className="text-center pt-2 border-t border-slate-100">
          <p className="text-[11px] text-slate-400">
            Gerbang ini melindungi pengaturan aplikasi dari akses anak.
          </p>
        </div>
      </div>
    </div>
  );
};
