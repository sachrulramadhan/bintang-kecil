import React, { useRef, useState, useEffect } from "react";
import { Sparkles, RefreshCw, Volume2, CheckCircle2 } from "lucide-react";
import { TracingItem } from "../../data/games";
import { audio } from "../../core/audio";
import confetti from "canvas-confetti";

interface TracingGameProps {
  item: TracingItem;
  onSuccess: () => void;
}

export const TracingGame: React.FC<TracingGameProps> = ({ item, onSuccess }) => {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const [currentStrokeIdx, setCurrentStrokeIdx] = useState(0);
  const [completedStrokes, setCompletedStrokes] = useState<number[]>([]);
  const [isDrawing, setIsDrawing] = useState(false);
  const [currentPoints, setCurrentPoints] = useState<{ x: number; y: number }[]>([]);
  const [coveredWaypoints, setCoveredWaypoints] = useState<Set<number>>(new Set());
  const [isCompleted, setIsCompleted] = useState(false);
  const [statusMessage, setStatusMessage] = useState("");

  const strokes = item.strokes || [];
  const currentStroke = strokes[currentStrokeIdx] || strokes[0];
  const totalStrokes = strokes.length;

  useEffect(() => {
    resetAll();
    const prompt = `Ayo tulis ${item.label}! Ikuti goresan pertama dari titik hijau ke titik merah ya!`;
    setStatusMessage(prompt);
    audio.speak(prompt, { rate: 0.85 });
  }, [item]);

  const resetAll = () => {
    setCurrentStrokeIdx(0);
    setCompletedStrokes([]);
    setCurrentPoints([]);
    setCoveredWaypoints(new Set());
    setIsCompleted(false);
    setStatusMessage(`Goresan 1 dari ${totalStrokes}: Mulai dari titik hijau 🟢 ke titik merah 🔴`);
    clearCanvas();
  };

  const clearCanvas = () => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
  };

  const getCanvasCoords = (e: React.PointerEvent<HTMLCanvasElement>) => {
    const canvas = canvasRef.current;
    if (!canvas) return { x: 0, y: 0 };
    const rect = canvas.getBoundingClientRect();
    const scaleX = canvas.width / rect.width;
    const scaleY = canvas.height / rect.height;
    return {
      x: (e.clientX - rect.left) * scaleX,
      y: (e.clientY - rect.top) * scaleY,
    };
  };

  const handlePointerDown = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (isCompleted || !currentStroke) return;
    (e.target as HTMLElement).setPointerCapture(e.pointerId);
    setIsDrawing(true);
    const pt = getCanvasCoords(e);
    setCurrentPoints([pt]);
    checkStrokeProgress(pt);
  };

  const checkStrokeProgress = (pt: { x: number; y: number }) => {
    if (!currentStroke) return;
    const TOLERANCE = 34; // Generous lane for little fingers
    const updated = new Set(coveredWaypoints);

    currentStroke.points.forEach((wp, idx) => {
      if (Math.hypot(pt.x - wp.x, pt.y - wp.y) <= TOLERANCE) {
        updated.add(idx);
      }
    });

    setCoveredWaypoints(updated);
    const coveragePercent = (updated.size / currentStroke.points.length) * 100;

    // Check distance to FINISH POINT (🔴)
    const distToFinish = Math.hypot(
      pt.x - currentStroke.endPoint.x,
      pt.y - currentStroke.endPoint.y
    );
    const isAtFinish = distToFinish <= 28;

    // Must reach the finish dot AND have covered at least 70% of the stroke
    if (isAtFinish && coveragePercent >= 70) {
      handleStrokeCompleted();
    }
  };

  const handleStrokeCompleted = () => {
    if (isCompleted) return;
    setIsDrawing(false);
    audio.playCorrectSound();

    const newCompleted = [...completedStrokes, currentStrokeIdx];
    setCompletedStrokes(newCompleted);
    clearCanvas(); // strokes are now rendered permanently via SVG overlay!

    // Check if this was the last stroke
    if (newCompleted.length >= totalStrokes) {
      // Entire Letter Completed!
      setIsCompleted(true);
      setStatusMessage(`Horeee! Huruf ${item.character} selesai sempurna! ⭐`);
      audio.playTrophySound();
      try {
        confetti({ particleCount: 70, spread: 80, origin: { y: 0.6 } });
      } catch {}

      audio.speak(`Horeee! Kamu berhasil menulis ${item.label} sampai selesai! Pintar sekali!`, {
        rate: 0.85,
        onEnd: () => onSuccess(),
      });
    } else {
      // Advance to next stroke!
      const nextIdx = currentStrokeIdx + 1;
      setCurrentStrokeIdx(nextIdx);
      setCurrentPoints([]);
      setCoveredWaypoints(new Set());

      let nextInstruction = `Hebat! Sekarang goresan ${nextIdx + 1} dari ${totalStrokes}!`;
      if (item.character === "A") {
        if (nextIdx === 1) nextInstruction = "Hebat! Sekarang tarik garis kanan turun ke bawah!";
        if (nextIdx === 2) nextInstruction = "Bagus sekali! Terakhir, tarik garis tengahnya!";
      }

      setStatusMessage(nextInstruction);
      audio.speak(nextInstruction, { rate: 0.85 });
    }
  };

  const handlePointerMove = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (!isDrawing || isCompleted || !currentStroke) return;
    const pt = getCanvasCoords(e);
    const updated = [...currentPoints, pt];
    setCurrentPoints(updated);

    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    // Draw live glowing paintbrush stroke on top of active path
    const last = currentPoints[currentPoints.length - 1];
    if (last) {
      // Outer emerald glow
      ctx.beginPath();
      ctx.moveTo(last.x, last.y);
      ctx.lineTo(pt.x, pt.y);
      ctx.strokeStyle = "#22C55E";
      ctx.lineWidth = 22;
      ctx.lineCap = "round";
      ctx.lineJoin = "round";
      ctx.stroke();

      // Inner lime highlight
      ctx.beginPath();
      ctx.moveTo(last.x, last.y);
      ctx.lineTo(pt.x, pt.y);
      ctx.strokeStyle = "#86EFAC";
      ctx.lineWidth = 10;
      ctx.lineCap = "round";
      ctx.lineJoin = "round";
      ctx.stroke();
    }

    checkStrokeProgress(pt);
  };

  const handlePointerUp = () => {
    setIsDrawing(false);
  };

  return (
    <div className="flex flex-col items-center justify-center p-3 sm:p-4 max-w-xl mx-auto select-none">
      {/* Title & Guidance Header */}
      <div className="text-center mb-3">
        <h3 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child">
          Ayo Tulis {item.label}!
        </h3>
        <p className="text-xs sm:text-sm font-bold text-amber-800 bg-amber-100/90 px-4 py-1.5 rounded-full inline-block mt-1 font-child shadow-xs">
          {statusMessage}
        </p>

        {/* Multi-stroke step indicator (e.g. Goresan 1 dari 3: ● ○ ○) */}
        {totalStrokes > 1 && (
          <div className="flex items-center justify-center gap-2 mt-2">
            <span className="text-xs font-bold text-slate-500 font-child">
              Goresan {Math.min(currentStrokeIdx + 1, totalStrokes)} / {totalStrokes}:
            </span>
            <div className="flex gap-1.5">
              {strokes.map((_, idx) => (
                <div
                  key={idx}
                  className={`w-3 h-3 rounded-full transition-all ${
                    completedStrokes.includes(idx)
                      ? "bg-emerald-500 ring-2 ring-emerald-300"
                      : currentStrokeIdx === idx
                      ? "bg-amber-400 scale-125 ring-2 ring-amber-300"
                      : "bg-slate-200"
                  }`}
                />
              ))}
            </div>
          </div>
        )}
      </div>

      {/* 
        Canvas Tracing Board:
        - Shows the COMPLETE letter outline in background (so letter A is never half-missing!)
        - Already completed strokes turn into solid glowing emerald paths!
        - Currently active stroke has center dashed guide line, direction arrow, 🟢 MULAI, and 🔴 SELESAI!
      */}
      <div className="relative w-[280px] h-[280px] sm:w-[320px] sm:h-[320px] bg-[#FFFDF8] rounded-[36px] border-4 border-amber-300 shadow-xl overflow-hidden touch-none">
        <svg
          className="absolute inset-0 w-full h-full pointer-events-none"
          viewBox="0 0 200 200"
        >
          {/* Faint Full Letter Watermark in Background */}
          <text
            x="100"
            y="145"
            textAnchor="middle"
            fontSize="140"
            fontWeight="bold"
            fill="#F8FAFC"
            stroke="#E2E8F0"
            strokeWidth="1"
            className="font-child"
          >
            {item.character}
          </text>

          {/* 1. Full Letter Background Guide Lane (Always shows the entire complete letter!) */}
          <path
            d={item.fullLetterSvg}
            fill="none"
            stroke="#BAE6FD"
            strokeWidth="32"
            strokeLinecap="round"
            strokeLinejoin="round"
          />
          <path
            d={item.fullLetterSvg}
            fill="none"
            stroke="#E0F2FE"
            strokeWidth="26"
            strokeLinecap="round"
            strokeLinejoin="round"
          />

          {/* 2. Completed Strokes (Locked in with permanent glowing emerald and lime highlight) */}
          {completedStrokes.map((sIdx) => {
            const s = strokes[sIdx];
            if (!s) return null;
            return (
              <g key={`completed_${sIdx}`}>
                <path
                  d={s.svgPath}
                  fill="none"
                  stroke="#22C55E"
                  strokeWidth="22"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
                <path
                  d={s.svgPath}
                  fill="none"
                  stroke="#86EFAC"
                  strokeWidth="10"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </g>
            );
          })}

          {/* 3. ACTIVE STROKE: Dashed center line & Direction Arrows */}
          {currentStroke && !isCompleted && (
            <g>
              <path
                d={currentStroke.svgPath}
                fill="none"
                stroke="#0284C7"
                strokeWidth="4"
                strokeDasharray="6 8"
                strokeLinecap="round"
                strokeLinejoin="round"
              />

              {currentStroke.arrows?.map((arr, i) => (
                <g
                  key={i}
                  transform={`translate(${arr.x}, ${arr.y}) rotate(${arr.angle})`}
                >
                  <polygon points="-5,-5 6,0 -5,5" fill="#0369A1" opacity="0.9" />
                </g>
              ))}

              {/* 🟢 START POINT (MULAI) for current stroke */}
              <g>
                <circle
                  cx={currentStroke.startPoint.x}
                  cy={currentStroke.startPoint.y}
                  r="18"
                  fill="#22C55E"
                  opacity="0.3"
                  className="animate-ping"
                />
                <circle
                  cx={currentStroke.startPoint.x}
                  cy={currentStroke.startPoint.y}
                  r="14"
                  fill="#16A34A"
                  stroke="#FFFFFF"
                  strokeWidth="2.5"
                />
                <circle
                  cx={currentStroke.startPoint.x}
                  cy={currentStroke.startPoint.y}
                  r="6"
                  fill="#86EFAC"
                />
                <rect
                  x={currentStroke.startPoint.x - 20}
                  y={
                    currentStroke.startPoint.y > 60
                      ? currentStroke.startPoint.y - 27
                      : currentStroke.startPoint.y + 16
                  }
                  width="40"
                  height="15"
                  rx="7"
                  fill="#16A34A"
                />
                <text
                  x={currentStroke.startPoint.x}
                  y={
                    currentStroke.startPoint.y > 60
                      ? currentStroke.startPoint.y - 17
                      : currentStroke.startPoint.y + 27
                  }
                  textAnchor="middle"
                  fontSize="8.5"
                  fill="#FFFFFF"
                  fontWeight="900"
                  className="font-child"
                >
                  MULAI
                </text>
              </g>

              {/* 🔴 FINISH POINT (SELESAI) for current stroke */}
              <g>
                <circle
                  cx={currentStroke.endPoint.x}
                  cy={currentStroke.endPoint.y}
                  r="14"
                  fill="#DC2626"
                  stroke="#FFFFFF"
                  strokeWidth="2.5"
                />
                <circle
                  cx={currentStroke.endPoint.x}
                  cy={currentStroke.endPoint.y}
                  r="9"
                  fill="#FFFFFF"
                />
                <circle
                  cx={currentStroke.endPoint.x}
                  cy={currentStroke.endPoint.y}
                  r="5"
                  fill="#EF4444"
                />
                <rect
                  x={currentStroke.endPoint.x - 22}
                  y={
                    currentStroke.endPoint.y > 60
                      ? currentStroke.endPoint.y - 27
                      : currentStroke.endPoint.y + 16
                  }
                  width="44"
                  height="15"
                  rx="7"
                  fill="#DC2626"
                />
                <text
                  x={currentStroke.endPoint.x}
                  y={
                    currentStroke.endPoint.y > 60
                      ? currentStroke.endPoint.y - 17
                      : currentStroke.endPoint.y + 27
                  }
                  textAnchor="middle"
                  fontSize="8.5"
                  fill="#FFFFFF"
                  fontWeight="900"
                  className="font-child"
                >
                  SELESAI
                </text>
              </g>
            </g>
          )}
        </svg>

        {/* Foreground Touch Drawing Canvas for live drawing */}
        <canvas
          ref={canvasRef}
          width={200}
          height={200}
          onPointerDown={handlePointerDown}
          onPointerMove={handlePointerMove}
          onPointerUp={handlePointerUp}
          className="absolute inset-0 w-full h-full cursor-crosshair z-10"
        />

        {/* Success Overlay Celebration */}
        {isCompleted && (
          <div className="absolute inset-0 bg-emerald-500/25 backdrop-blur-xs flex items-center justify-center pointer-events-none z-20 animate-in fade-in">
            <div className="bg-white px-6 py-3.5 rounded-2xl shadow-xl flex items-center gap-2 border-3 border-emerald-400 animate-bounce">
              <CheckCircle2 className="w-8 h-8 text-emerald-500" />
              <span className="text-xl font-black text-emerald-800 font-child">
                Huruf {item.character} Selesai! ⭐
              </span>
            </div>
          </div>
        )}
      </div>

      {/* Progress Bar & Actions */}
      <div className="w-full max-w-[320px] mt-4 flex items-center justify-between gap-3">
        <button
          onClick={resetAll}
          className="p-3 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl font-child font-bold text-sm shadow-sm transition-transform active:scale-95"
          title="Ulangi Dari Awal"
        >
          <RefreshCw className="w-5 h-5" />
        </button>

        {/* Total Letter Completion Progress */}
        <div className="flex-1 bg-slate-100 h-6 rounded-full overflow-hidden border-2 border-slate-200 p-0.5 relative">
          <div
            className="bg-gradient-to-r from-emerald-400 to-green-500 h-full rounded-full transition-all duration-300"
            style={{
              width: `${Math.round((completedStrokes.length / totalStrokes) * 100)}%`,
            }}
          />
          <span className="absolute inset-0 flex items-center justify-center text-[10px] font-black text-slate-600 font-child">
            {completedStrokes.length} / {totalStrokes} Goresan
          </span>
        </div>

        <button
          onClick={() => audio.speak(`Huruf ${item.character}`)}
          className="p-3 bg-amber-100 hover:bg-amber-200 text-amber-900 rounded-2xl font-child font-bold text-sm shadow-sm transition-transform active:scale-95"
          title="Dengar Bunyi"
        >
          <Volume2 className="w-5 h-5" />
        </button>
      </div>
    </div>
  );
};
