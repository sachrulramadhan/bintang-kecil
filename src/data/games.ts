export interface WordBuilderItem {
  id: string;
  word: string;
  scrambled: string[];
  imageEmoji: string;
  category: string;
  difficulty: number;
}

export interface FillWordItem {
  id: string;
  word: string;
  pattern: string; // "A _ E L"
  missingIndex: number;
  answer: string;
  options: string[];
  imageEmoji: string;
  difficulty: number;
}

export interface TracingStroke {
  id: number;
  label: string;
  svgPath: string;
  startPoint: { x: number; y: number };
  endPoint: { x: number; y: number };
  arrows: { x: number; y: number; angle: number }[];
  points: { x: number; y: number }[];
}

export interface TracingItem {
  id: string;
  character: string;
  label: string;
  difficulty: number;
  fullLetterSvg: string;
  strokes: TracingStroke[];
}

export interface ConnectPairItem {
  id: string;
  left: { id: string; label: string; icon?: string };
  right: { id: string; label: string; icon?: string };
  matchId: string;
}

export interface SoundGuessItem {
  id: string;
  soundCue: string;
  answer: string;
  options: string[];
  explanation: string;
  difficulty: number;
}

export interface SentenceBuilderItem {
  id: string;
  words: string[];
  correctSentence: string;
  imageEmoji: string;
  difficulty: number;
}

// 1. Bank Kata untuk Susun Kata (>= 30 kata bergambar dengan variasi panjang)
export const WORD_BUILDER_BANK: WordBuilderItem[] = [
  // Level 1: 3-4 huruf
  { id: "wb_01", word: "APEL", scrambled: ["P", "A", "E", "L"], imageEmoji: "🍎", category: "Buah", difficulty: 1 },
  { id: "wb_02", word: "BOLA", scrambled: ["L", "O", "B", "A"], imageEmoji: "⚽", category: "Benda", difficulty: 1 },
  { id: "wb_03", word: "BUKU", scrambled: ["K", "U", "B", "U"], imageEmoji: "📚", category: "Belajar", difficulty: 1 },
  { id: "wb_04", word: "SAPI", scrambled: ["P", "A", "S", "I"], imageEmoji: "🐮", category: "Hewan", difficulty: 1 },
  { id: "wb_05", word: "MEJA", scrambled: ["J", "E", "M", "A"], imageEmoji: "🪑", category: "Perabot", difficulty: 1 },
  { id: "wb_06", word: "ROTI", scrambled: ["T", "O", "R", "I"], imageEmoji: "🍞", category: "Makanan", difficulty: 1 },
  { id: "wb_07", word: "IKAN", scrambled: ["K", "I", "A", "N"], imageEmoji: "🐟", category: "Hewan", difficulty: 1 },
  { id: "wb_08", word: "KAYU", scrambled: ["Y", "A", "K", "U"], imageEmoji: "🪵", category: "Alam", difficulty: 1 },
  { id: "wb_09", word: "DAUN", scrambled: ["U", "A", "D", "N"], imageEmoji: "🍃", category: "Tumbuhan", difficulty: 1 },
  { id: "wb_10", word: "PADI", scrambled: ["D", "A", "P", "I"], imageEmoji: "🌾", category: "Tumbuhan", difficulty: 1 },

  // Level 2: 5-6 huruf
  { id: "wb_11", word: "RUMAH", scrambled: ["M", "U", "R", "H", "A"], imageEmoji: "🏡", category: "Tempat", difficulty: 2 },
  { id: "wb_12", word: "GAJAH", scrambled: ["J", "A", "G", "H", "A"], imageEmoji: "🐘", category: "Hewan", difficulty: 2 },
  { id: "wb_13", word: "POHON", scrambled: ["H", "O", "P", "N", "O"], imageEmoji: "🌳", category: "Alam", difficulty: 2 },
  { id: "wb_14", word: "BULAN", scrambled: ["L", "U", "B", "N", "A"], imageEmoji: "🌙", category: "Angkasa", difficulty: 2 },
  { id: "wb_15", word: "HUJAN", scrambled: ["J", "U", "H", "N", "A"], imageEmoji: "🌧️", category: "Cuaca", difficulty: 2 },
  { id: "wb_16", word: "PENSIL", scrambled: ["S", "E", "P", "N", "I", "L"], imageEmoji: "✏️", category: "Alat Tulis", difficulty: 2 },
  { id: "wb_17", word: "SEPATU", scrambled: ["P", "E", "S", "T", "A", "U"], imageEmoji: "👟", category: "Pakaian", difficulty: 2 },
  { id: "wb_18", word: "KERETA", scrambled: ["R", "E", "K", "T", "E", "A"], imageEmoji: "🚆", category: "Kendaraan", difficulty: 2 },

  // Level 3: 7+ huruf
  { id: "wb_19", word: "KELINCI", scrambled: ["L", "E", "K", "N", "I", "C", "I"], imageEmoji: "🐰", category: "Hewan", difficulty: 3 },
  { id: "wb_20", word: "BINTANG", scrambled: ["N", "I", "B", "A", "T", "G", "N"], imageEmoji: "⭐", category: "Angkasa", difficulty: 3 },
  { id: "wb_21", word: "PELANGI", scrambled: ["L", "E", "P", "G", "A", "I", "N"], imageEmoji: "🌈", category: "Alam", difficulty: 3 },
  { id: "wb_22", word: "SEKOLAH", scrambled: ["K", "E", "S", "L", "O", "A", "H"], imageEmoji: "🏫", category: "Tempat", difficulty: 3 },
  { id: "wb_23", word: "MATAHARI", scrambled: ["T", "A", "M", "H", "A", "R", "I", "A"], imageEmoji: "☀️", category: "Angkasa", difficulty: 3 },
];

// 2. Bank Lengkapi Kata
export const FILL_WORD_BANK: FillWordItem[] = [
  { id: "fw_01", word: "APEL", pattern: "A _ E L", missingIndex: 1, answer: "P", options: ["P", "B", "T"], imageEmoji: "🍎", difficulty: 1 },
  { id: "fw_02", word: "BOLA", pattern: "B O _ A", missingIndex: 2, answer: "L", options: ["L", "R", "M"], imageEmoji: "⚽", difficulty: 1 },
  { id: "fw_03", word: "BUKU", pattern: "B _ K U", missingIndex: 1, answer: "U", options: ["U", "A", "I"], imageEmoji: "📚", difficulty: 1 },
  { id: "fw_04", word: "SAPI", pattern: "_ A P I", missingIndex: 0, answer: "S", options: ["S", "T", "K"], imageEmoji: "🐮", difficulty: 1 },
  { id: "fw_05", word: "ROTI", pattern: "R O T _", missingIndex: 3, answer: "I", options: ["I", "U", "E"], imageEmoji: "🍞", difficulty: 1 },
  { id: "fw_06", word: "IKAN", pattern: "I K _ N", missingIndex: 2, answer: "A", options: ["A", "O", "U"], imageEmoji: "🐟", difficulty: 1 },
  { id: "fw_07", word: "RUMAH", pattern: "R U M _ H", missingIndex: 3, answer: "A", options: ["A", "O", "I"], imageEmoji: "🏡", difficulty: 2 },
  { id: "fw_08", word: "POHON", pattern: "P _ H O N", missingIndex: 1, answer: "O", options: ["O", "E", "A"], imageEmoji: "🌳", difficulty: 2 },
  { id: "fw_09", word: "BULAN", pattern: "B U _ A N", missingIndex: 2, answer: "L", options: ["L", "M", "N"], imageEmoji: "🌙", difficulty: 2 },
  { id: "fw_10", word: "KELINCI", pattern: "K E L _ N C I", missingIndex: 3, answer: "I", options: ["I", "E", "U"], imageEmoji: "🐰", difficulty: 3 },
];

// 3. Bank Tracing Huruf & Bentuk (Goresan demi goresan pedagogis anak usia dini)
export const TRACING_ITEMS: TracingItem[] = [
  // --- HURUF A (3 Goresan Lengkap: Kaki Kiri, Kaki Kanan, Garis Tengah) ---
  {
    id: "trace_A",
    character: "A",
    label: "Huruf A",
    difficulty: 1,
    fullLetterSvg: "M 45 170 L 100 28 L 155 170 M 65 115 L 135 115",
    strokes: [
      {
        id: 1,
        label: "Garis Kiri (Naik ke Puncak)",
        svgPath: "M 45 170 L 100 28",
        startPoint: { x: 45, y: 170 },
        endPoint: { x: 100, y: 28 },
        arrows: [{ x: 72, y: 99, angle: -69 }],
        points: [
          { x: 45, y: 170 },
          { x: 53, y: 150 },
          { x: 61, y: 129 },
          { x: 70, y: 105 },
          { x: 79, y: 82 },
          { x: 88, y: 59 },
          { x: 100, y: 28 },
        ],
      },
      {
        id: 2,
        label: "Garis Kanan (Turun ke Bawah)",
        svgPath: "M 100 28 L 155 170",
        startPoint: { x: 100, y: 28 },
        endPoint: { x: 155, y: 170 },
        arrows: [{ x: 128, y: 99, angle: 69 }],
        points: [
          { x: 100, y: 28 },
          { x: 110, y: 54 },
          { x: 120, y: 80 },
          { x: 130, y: 106 },
          { x: 140, y: 132 },
          { x: 150, y: 158 },
          { x: 155, y: 170 },
        ],
      },
      {
        id: 3,
        label: "Garis Tengah (Hubungkan Kiri ke Kanan)",
        svgPath: "M 65 115 L 135 115",
        startPoint: { x: 65, y: 115 },
        endPoint: { x: 135, y: 115 },
        arrows: [{ x: 100, y: 115, angle: 0 }],
        points: [
          { x: 65, y: 115 },
          { x: 80, y: 115 },
          { x: 95, y: 115 },
          { x: 110, y: 115 },
          { x: 125, y: 115 },
          { x: 135, y: 115 },
        ],
      },
    ],
  },

  // --- HURUF B (3 Goresan Lengkap: Garis Tegak, Lengkung Atas, Lengkung Bawah) ---
  {
    id: "trace_B",
    character: "B",
    label: "Huruf B",
    difficulty: 1,
    fullLetterSvg: "M 50 28 L 50 172 M 50 28 C 130 28 130 100 50 100 M 50 100 C 140 100 140 172 50 172",
    strokes: [
      {
        id: 1,
        label: "Garis Tegak Lurus",
        svgPath: "M 50 28 L 50 172",
        startPoint: { x: 50, y: 28 },
        endPoint: { x: 50, y: 172 },
        arrows: [{ x: 50, y: 100, angle: 90 }],
        points: [
          { x: 50, y: 28 },
          { x: 50, y: 55 },
          { x: 50, y: 85 },
          { x: 50, y: 115 },
          { x: 50, y: 145 },
          { x: 50, y: 172 },
        ],
      },
      {
        id: 2,
        label: "Lengkung Atas",
        svgPath: "M 50 28 C 130 28 130 100 50 100",
        startPoint: { x: 50, y: 28 },
        endPoint: { x: 50, y: 100 },
        arrows: [{ x: 110, y: 64, angle: 90 }],
        points: [
          { x: 50, y: 28 },
          { x: 80, y: 32 },
          { x: 110, y: 48 },
          { x: 115, y: 64 },
          { x: 105, y: 82 },
          { x: 80, y: 96 },
          { x: 50, y: 100 },
        ],
      },
      {
        id: 3,
        label: "Lengkung Bawah",
        svgPath: "M 50 100 C 140 100 140 172 50 172",
        startPoint: { x: 50, y: 100 },
        endPoint: { x: 50, y: 172 },
        arrows: [{ x: 120, y: 136, angle: 90 }],
        points: [
          { x: 50, y: 100 },
          { x: 85, y: 104 },
          { x: 120, y: 120 },
          { x: 125, y: 136 },
          { x: 115, y: 154 },
          { x: 85, y: 168 },
          { x: 50, y: 172 },
        ],
      },
    ],
  },

  // --- HURUF C (1 Goresan Kurva Melingkar Lengkap) ---
  {
    id: "trace_C",
    character: "C",
    label: "Huruf C",
    difficulty: 1,
    fullLetterSvg: "M 155 45 C 95 20 45 65 45 100 C 45 135 95 180 155 155",
    strokes: [
      {
        id: 1,
        label: "Lengkung Huruf C",
        svgPath: "M 155 45 C 95 20 45 65 45 100 C 45 135 95 180 155 155",
        startPoint: { x: 155, y: 45 },
        endPoint: { x: 155, y: 155 },
        arrows: [
          { x: 100, y: 28, angle: 180 },
          { x: 45, y: 100, angle: 90 },
          { x: 100, y: 172, angle: 0 },
        ],
        points: [
          { x: 155, y: 45 },
          { x: 130, y: 32 },
          { x: 100, y: 28 },
          { x: 70, y: 38 },
          { x: 48, y: 65 },
          { x: 45, y: 100 },
          { x: 48, y: 135 },
          { x: 70, y: 162 },
          { x: 100, y: 172 },
          { x: 130, y: 168 },
          { x: 155, y: 155 },
        ],
      },
    ],
  },

  // --- ANGKA 1 (2 Goresan Lengkap: Serong Naik, Tegak Turun) ---
  {
    id: "trace_1",
    character: "1",
    label: "Angka 1",
    difficulty: 1,
    fullLetterSvg: "M 65 65 L 100 25 L 100 175",
    strokes: [
      {
        id: 1,
        label: "Garis Serong Naik",
        svgPath: "M 65 65 L 100 25",
        startPoint: { x: 65, y: 65 },
        endPoint: { x: 100, y: 25 },
        arrows: [{ x: 82, y: 45, angle: -48 }],
        points: [
          { x: 65, y: 65 },
          { x: 75, y: 53 },
          { x: 88, y: 38 },
          { x: 100, y: 25 },
        ],
      },
      {
        id: 2,
        label: "Garis Tegak Turun",
        svgPath: "M 100 25 L 100 175",
        startPoint: { x: 100, y: 25 },
        endPoint: { x: 100, y: 175 },
        arrows: [{ x: 100, y: 100, angle: 90 }],
        points: [
          { x: 100, y: 25 },
          { x: 100, y: 55 },
          { x: 100, y: 85 },
          { x: 100, y: 115 },
          { x: 100, y: 145 },
          { x: 100, y: 175 },
        ],
      },
    ],
  },

  // --- ANGKA 2 (2 Goresan Lengkap: Lengkung ke Bawah, Garis Datar) ---
  {
    id: "trace_2",
    character: "2",
    label: "Angka 2",
    difficulty: 1,
    fullLetterSvg: "M 55 65 C 55 25 145 25 145 68 C 145 105 75 140 50 170 L 150 170",
    strokes: [
      {
        id: 1,
        label: "Lengkung Kepala dan Garis Miring",
        svgPath: "M 55 65 C 55 25 145 25 145 68 C 145 105 75 140 50 170",
        startPoint: { x: 55, y: 65 },
        endPoint: { x: 50, y: 170 },
        arrows: [
          { x: 100, y: 28, angle: 0 },
          { x: 100, y: 118, angle: 140 },
        ],
        points: [
          { x: 55, y: 65 },
          { x: 75, y: 35 },
          { x: 100, y: 28 },
          { x: 130, y: 38 },
          { x: 145, y: 68 },
          { x: 130, y: 100 },
          { x: 105, y: 122 },
          { x: 75, y: 145 },
          { x: 50, y: 170 },
        ],
      },
      {
        id: 2,
        label: "Garis Datar Bawah",
        svgPath: "M 50 170 L 150 170",
        startPoint: { x: 50, y: 170 },
        endPoint: { x: 150, y: 170 },
        arrows: [{ x: 100, y: 170, angle: 0 }],
        points: [
          { x: 50, y: 170 },
          { x: 75, y: 170 },
          { x: 100, y: 170 },
          { x: 125, y: 170 },
          { x: 150, y: 170 },
        ],
      },
    ],
  },
];

// 4. Bank Hubungkan Huruf / Pasangan
export const CONNECT_PAIRS_SETS: ConnectPairItem[][] = [
  // Set 1: Huruf Kapital & Kecil
  [
    { id: "c1", left: { id: "l1", label: "A" }, right: { id: "r1", label: "a" }, matchId: "m_a" },
    { id: "c2", left: { id: "l2", label: "B" }, right: { id: "r2", label: "b" }, matchId: "m_b" },
    { id: "c3", left: { id: "l3", label: "C" }, right: { id: "r3", label: "c" }, matchId: "m_c" },
    { id: "c4", left: { id: "l4", label: "D" }, right: { id: "r4", label: "d" }, matchId: "m_d" },
  ],
  // Set 2: Huruf Awal & Gambar Benda
  [
    { id: "c5", left: { id: "l5", label: "A" }, right: { id: "r5", label: "Apel", icon: "🍎" }, matchId: "m_apel" },
    { id: "c6", left: { id: "l6", label: "B" }, right: { id: "r6", label: "Buku", icon: "📚" }, matchId: "m_buku" },
    { id: "c7", left: { id: "l7", label: "C" }, right: { id: "r7", label: "Ceri", icon: "🍒" }, matchId: "m_ceri" },
    { id: "c8", left: { id: "l8", label: "D" }, right: { id: "r8", label: "Donat", icon: "🍩" }, matchId: "m_donat" },
  ],
];

// 5. Bank Dengar & Tebak Fonem
export const SOUND_GUESS_BANK: SoundGuessItem[] = [
  {
    id: "sg_01",
    soundCue: "Aaaaa...",
    answer: "A",
    options: ["A", "I", "U"],
    explanation: "Bunyi vokal terbuka: A untuk Apel!",
    difficulty: 1,
  },
  {
    id: "sg_02",
    soundCue: "Mmmmm...",
    answer: "M",
    options: ["M", "B", "S"],
    explanation: "Bunyi bibir terkatup: M untuk Meja dan Madu!",
    difficulty: 1,
  },
  {
    id: "sg_03",
    soundCue: "Sssss...",
    answer: "S",
    options: ["S", "K", "T"],
    explanation: "Bunyi desis halus: S untuk Sapi dan Sayur!",
    difficulty: 1,
  },
  {
    id: "sg_04",
    soundCue: "B-b-b-beh...",
    answer: "B",
    options: ["B", "D", "P"],
    explanation: "Bunyi letup bibir: B untuk Bola!",
    difficulty: 1,
  },
];

// 6. Bank Susun Kalimat
export const SENTENCE_BUILDER_BANK: SentenceBuilderItem[] = [
  {
    id: "sb_01",
    words: ["Bimo", "makan", "wortel"],
    correctSentence: "Bimo makan wortel.",
    imageEmoji: "🐰🥕",
    difficulty: 1,
  },
  {
    id: "sb_02",
    words: ["Ini", "bola", "besar"],
    correctSentence: "Ini bola besar.",
    imageEmoji: "⚽✨",
    difficulty: 1,
  },
  {
    id: "sb_03",
    words: ["Adit", "membaca", "buku", "cerita"],
    correctSentence: "Adit membaca buku cerita.",
    imageEmoji: "👦📖",
    difficulty: 2,
  },
  {
    id: "sb_04",
    words: ["Matahari", "bersinar", "terang", "di langit"],
    correctSentence: "Matahari bersinar terang di langit.",
    imageEmoji: "☀️🌤️",
    difficulty: 2,
  },
];
