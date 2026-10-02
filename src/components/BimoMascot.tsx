import React from "react";

/**
 * Bimo memakai ilustrasi resmi dari /public/bimo (WebP transparan).
 * - Mode wajah: 10 ekspresi dari lembar ekspresi.
 * - Mode `full`: badan penuh dari lembar model (depan / tiga perempat / samping / belakang).
 * Nama ekspresi lama ("happy", "thinking", "celebrating", "encouraging", "reading") tetap didukung.
 */
export type BimoExpression =
  | "happy"
  | "thinking"
  | "celebrating"
  | "encouraging"
  | "reading"
  | "laugh"
  | "calm"
  | "wow"
  | "wink"
  | "sleepy"
  | "tired"
  | "joy";

export type BimoView = "front" | "three" | "side" | "back";

const FACE_FILE: Record<BimoExpression, string> = {
  happy: "face-happy",
  thinking: "face-hmm",
  celebrating: "face-laugh",
  encouraging: "face-joy",
  reading: "face-calm",
  laugh: "face-laugh",
  calm: "face-calm",
  wow: "face-wow",
  wink: "face-wink",
  sleepy: "face-sleep",
  tired: "face-tired",
  joy: "face-joy",
};

interface BimoMascotProps {
  expression?: BimoExpression;
  size?: "sm" | "md" | "lg" | "xl";
  /** Tampilkan badan penuh (bukan hanya wajah). */
  full?: boolean;
  view?: BimoView;
  className?: string;
  hat?: string;
  glasses?: string;
  interactive?: boolean;
  /** Animasi melayang pelan. Otomatis mati bila perangkat meminta kurangi gerakan. */
  float?: boolean;
  onClick?: () => void;
}

const FACE_HEIGHT = { sm: 80, md: 128, lg: 190, xl: 260 } as const;
const BODY_HEIGHT = { sm: 110, md: 170, lg: 250, xl: 340 } as const;
const BASE = import.meta.env.BASE_URL;

export const BimoMascot: React.FC<BimoMascotProps> = ({
  expression = "happy",
  size = "md",
  full = false,
  view = "front",
  className = "",
  hat,
  glasses,
  interactive = false,
  float = true,
  onClick,
}) => {
  const height = full ? BODY_HEIGHT[size] : FACE_HEIGHT[size];
  const file = full ? `body-${view}` : FACE_FILE[expression] ?? "face-happy";
  const src = `${BASE}bimo/${file}.webp`;
  // Perkiraan posisi kepala (persen tinggi gambar) untuk aksesori
  const headTop = full ? 0 : 0;
  void headTop;

  return (
    <div
      onClick={onClick}
      role={interactive ? "button" : undefined}
      className={`bimo-wrap relative inline-flex items-end justify-center select-none ${
        float ? "bimo-float" : ""
      } ${interactive ? "cursor-pointer hover:scale-105 active:scale-95 transition-transform" : ""} ${className}`}
      style={{ height }}
    >
      <img
        src={src}
        alt="Bimo si kelinci"
        draggable={false}
        decoding="async"
        className="h-full w-auto object-contain drop-shadow-[0_6px_6px_rgba(37,71,106,0.22)]"
      />

      {/* Aksesori hasil hadiah, diletakkan di atas ilustrasi */}
      {!full && (hat || glasses) && (
        <svg
          viewBox="0 0 100 100"
          preserveAspectRatio="none"
          className="absolute inset-0 w-full h-full pointer-events-none"
          aria-hidden="true"
        >
          {hat === "item_cap_red" && (
            <g>
              <ellipse cx="50" cy="40" rx="24" ry="5" fill="#EF4444" stroke="#25476A" strokeWidth="1.2" />
              <path d="M30 40 Q50 22 70 40 Z" fill="#DC2626" stroke="#25476A" strokeWidth="1.2" />
              <circle cx="50" cy="26" r="2.6" fill="#FFC933" stroke="#25476A" strokeWidth="0.8" />
            </g>
          )}
          {hat === "item_crown_gold" && (
            <g>
              <path
                d="M33 42 L36 28 L43 36 L50 24 L57 36 L64 28 L67 42 Z"
                fill="#FFC933"
                stroke="#25476A"
                strokeWidth="1.2"
                strokeLinejoin="round"
              />
              <circle cx="50" cy="27" r="1.7" fill="#EF4444" />
            </g>
          )}
          {glasses === "item_glasses_star" && (
            <g stroke="#25476A" strokeWidth="1" fill="#FFD166" fillOpacity="0.55">
              <polygon points="35,47 37,52 42,52 38,55 40,60 35,57 30,60 32,55 28,52 33,52" />
              <polygon points="65,47 67,52 72,52 68,55 70,60 65,57 60,60 62,55 58,52 63,52" />
              <line x1="42" y1="54" x2="58" y2="54" strokeWidth="1.2" />
            </g>
          )}
          {glasses === "item_glasses_cool" && (
            <g fill="#1E293B" stroke="#25476A" strokeWidth="0.8">
              <rect x="26" y="49" width="18" height="11" rx="4" />
              <rect x="56" y="49" width="18" height="11" rx="4" />
              <line x1="44" y1="53" x2="56" y2="53" strokeWidth="1.4" />
            </g>
          )}
        </svg>
      )}
    </div>
  );
};
