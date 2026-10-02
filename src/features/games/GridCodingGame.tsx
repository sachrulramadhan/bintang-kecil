import React, { useState } from "react";
import { Play, RotateCcw, Sparkles, Delete, CheckCircle2 } from "lucide-react";
import { audio } from "../../core/audio";
import confetti from "canvas-confetti";

type Direction = "UP" | "DOWN" | "LEFT" | "RIGHT";

interface GridCodingGameProps {
  onSuccess: () => void;
}

export const GridCodingGame: React.FC<GridCodingGameProps> = ({ onSuccess }) => {
  // Grid size 3x3
  const [bimoPos, setBimoPos] = useState<{ x: number; y: number }>({ x: 0, y: 0 });
  const targetPos = { x: 2, y: 2 };
  const obstaclePos = { x: 1, y: 1 }; // puddle
  const [commands, setCommands] = useState<Direction[]>([]);
  const [isRunning, setIsRunning] = useState(false);
  const [statusMessage, setStatusMessage] = useState(
    "Susun balok panah arah agar Bimo melompat menuju wortel lezat! 🥕"
  );
  const [hasWon, setHasWon] = useState(false);

  const addCommand = (dir: Direction) => {
    if (isRunning || hasWon || commands.length >= 6) return;
    audio.playTapSound();
    setCommands((prev) => [...prev, dir]);
  };

  const removeLastCommand = () => {
    if (isRunning || hasWon) return;
    audio.playTapSound();
    setCommands((prev) => prev.slice(0, -1));
  };

  const resetAll = () => {
    setBimoPos({ x: 0, y: 0 });
    setCommands([]);
    setIsRunning(false);
    setHasWon(false);
    setStatusMessage("Ayo susun balok panah arah!");
  };

  const runCode = async () => {
    if (commands.length === 0 || isRunning) return;
    setIsRunning(true);
    setStatusMessage("Bimo mulai melompat... 🐰✨");
    audio.playTapSound();

    let curX = 0;
    let curY = 0;
    setBimoPos({ x: 0, y: 0 });

    for (let i = 0; i < commands.length; i++) {
      await new Promise((r) => setTimeout(r, 600));
      const cmd = commands[i];

      if (cmd === "UP") curY = Math.max(0, curY - 1);
      if (cmd === "DOWN") curY = Math.min(2, curY + 1);
      if (cmd === "LEFT") curX = Math.max(0, curX - 1);
      if (cmd === "RIGHT") curX = Math.min(2, curX + 1);

      audio.playTapSound();
      setBimoPos({ x: curX, y: curY });

      // Hit obstacle
      if (curX === obstaclePos.x && curY === obstaclePos.y) {
        audio.playEncouragementSound();
        setStatusMessage("Ups! Bimo terkena genangan air! Yuk coba lagi dengan jalur lain 😊");
        setIsRunning(false);
        return;
      }
    }

    // Check target reach
    if (curX === targetPos.x && curY === targetPos.y) {
      setHasWon(true);
      setIsRunning(false);
      audio.playCorrectSound();
      audio.playTrophySound();
      try {
        confetti({ particleCount: 50, spread: 60, origin: { y: 0.6 } });
      } catch {}
      setStatusMessage("Horeee! Bimo berhasil memakan wortel! Kamu hebat! 🎉🥕");
      audio.speak("Hore! Bimo berhasil mencapai wortel! Kamu hebat!", {
        rate: 0.85,
        onEnd: () => onSuccess(),
      });
    } else {
      setIsRunning(false);
      audio.playEncouragementSound();
      setStatusMessage("Hampir sampai! Tambahkan lagi panah arah menuju wortel ya!");
    }
  };

  return (
    <div className="flex flex-col items-center justify-center p-4 max-w-xl mx-auto select-none">
      <div className="text-center mb-3">
        <h3 className="text-2xl font-black text-[#25476A] font-child flex items-center justify-center gap-2">
          <span>🧩 Grid Coding Bimo</span>
        </h3>
        <p className="text-sm font-semibold text-sky-800 font-child mt-1">
          {statusMessage}
        </p>
      </div>

      {/* 3x3 Grid Board (Reference 3 top layout) */}
      <div className="bg-sky-200 p-3.5 rounded-3xl border-4 border-sky-400 shadow-xl mb-4">
        <div className="grid grid-cols-3 gap-2.5 bg-sky-100 p-2.5 rounded-2xl">
          {[0, 1, 2].map((y) =>
            [0, 1, 2].map((x) => {
              const isBimo = bimoPos.x === x && bimoPos.y === y;
              const isTarget = targetPos.x === x && targetPos.y === y;
              const isObstacle = obstaclePos.x === x && obstaclePos.y === y;

              return (
                <div
                  key={`${x}-${y}`}
                  className="w-18 h-18 sm:w-22 sm:h-22 bg-white rounded-2xl border-2 border-sky-300 flex items-center justify-center relative shadow-sm"
                >
                  {isObstacle && (
                    <span className="text-3xl sm:text-4xl drop-shadow-sm">💧</span>
                  )}
                  {isTarget && (
                    <span className="text-4xl sm:text-5xl animate-bounce drop-shadow-sm">
                      🥕
                    </span>
                  )}
                  {isBimo && (
                    <span className="text-4xl sm:text-5xl absolute z-10 animate-pulse drop-shadow-md">
                      🐰
                    </span>
                  )}
                </div>
              );
            })
          )}
        </div>
      </div>

      {/* Command Sequence Tray */}
      <div className="w-full bg-white/90 rounded-2xl border-2 border-amber-300 p-3 mb-4 shadow-sm">
        <span className="text-xs font-bold text-slate-500 font-child block mb-1.5 uppercase tracking-wider">
          Urutan Perintah Langkah:
        </span>
        <div className="flex items-center gap-2 min-h-[48px] overflow-x-auto pb-1">
          {commands.length === 0 ? (
            <span className="text-xs font-child text-slate-400 italic">
              Tekan panah di bawah untuk memasukkan instruksi...
            </span>
          ) : (
            commands.map((cmd, idx) => (
              <div
                key={idx}
                className="w-11 h-11 bg-amber-400 border-2 border-amber-500 rounded-xl flex items-center justify-center text-xl text-amber-950 font-bold shadow-sm shrink-0"
              >
                {cmd === "UP" && "⬆️"}
                {cmd === "DOWN" && "⬇️"}
                {cmd === "LEFT" && "⬅️"}
                {cmd === "RIGHT" && "➡️"}
              </div>
            ))
          )}
        </div>
      </div>

      {/* Control Arrow Palette & Action Buttons (Reference 3 top layout) */}
      <div className="flex items-center gap-2.5 sm:gap-3 flex-wrap justify-center">
        <button
          onClick={() => addCommand("UP")}
          disabled={isRunning || hasWon}
          className="w-13 h-13 bg-sky-400 hover:bg-sky-500 disabled:opacity-40 text-white rounded-2xl text-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-sky-500"
          title="Ke Atas"
        >
          ⬆️
        </button>
        <button
          onClick={() => addCommand("DOWN")}
          disabled={isRunning || hasWon}
          className="w-13 h-13 bg-sky-400 hover:bg-sky-500 disabled:opacity-40 text-white rounded-2xl text-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-sky-500"
          title="Ke Bawah"
        >
          ⬇️
        </button>
        <button
          onClick={() => addCommand("LEFT")}
          disabled={isRunning || hasWon}
          className="w-13 h-13 bg-sky-400 hover:bg-sky-500 disabled:opacity-40 text-white rounded-2xl text-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-sky-500"
          title="Ke Kiri"
        >
          ⬅️
        </button>
        <button
          onClick={() => addCommand("RIGHT")}
          disabled={isRunning || hasWon}
          className="w-13 h-13 bg-sky-400 hover:bg-sky-500 disabled:opacity-40 text-white rounded-2xl text-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-sky-500"
          title="Ke Kanan"
        >
          ➡️
        </button>

        {/* Delete Last */}
        <button
          onClick={removeLastCommand}
          disabled={isRunning || commands.length === 0}
          className="w-13 h-13 bg-rose-400 hover:bg-rose-500 disabled:opacity-40 text-white rounded-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-rose-500 text-lg font-bold"
          title="Hapus Satu"
        >
          ✖
        </button>

        {/* Reset */}
        <button
          onClick={resetAll}
          className="w-13 h-13 bg-slate-200 hover:bg-slate-300 text-slate-700 rounded-2xl flex items-center justify-center shadow-md active:scale-95 border-2 border-slate-300"
          title="Ulangi"
        >
          <RotateCcw className="w-5 h-5" />
        </button>

        {/* Play Execution */}
        <button
          onClick={runCode}
          disabled={isRunning || commands.length === 0 || hasWon}
          className="px-5 h-13 bg-gradient-to-r from-emerald-400 to-green-500 hover:from-emerald-500 hover:to-green-600 disabled:opacity-40 text-white rounded-2xl font-child font-black text-lg flex items-center gap-2 shadow-lg active:scale-95 border-2 border-green-600"
        >
          <Play className="w-5 h-5 fill-white" />
          <span>Jalankan!</span>
        </button>
      </div>
    </div>
  );
};
