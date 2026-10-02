import { CategoryId } from "../types";

export interface CategoryMeta {
  id: CategoryId;
  name: string;
  icon: string;
  tagline: string;
  description: string;
  gradient: string;
  borderColor: string;
  accentBg: string;
  textColor: string;
  recommendedAges: string[];
}

export const CATEGORIES: CategoryMeta[] = [
  {
    id: "stories",
    name: "Cerita Anak",
    icon: "📚",
    tagline: "Dunia Imajinasi & Karakter",
    description: "Kumpulan cerita menarik dan mendidik untuk menumbuhkan imajinasi, karakter, dan kecintaan membaca.",
    gradient: "from-amber-400 to-orange-400",
    borderColor: "border-amber-300",
    accentBg: "bg-amber-50",
    textColor: "text-amber-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "mathematics",
    name: "Matematika",
    icon: "🔢",
    tagline: "Angka & Logika Ceria",
    description: "Belajar berhitung dengan cara menyenangkan dari konkret, visual hingga pemecahan masalah.",
    gradient: "from-blue-400 to-indigo-500",
    borderColor: "border-blue-300",
    accentBg: "bg-blue-50",
    textColor: "text-blue-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "science",
    name: "Sains",
    icon: "🔬",
    tagline: "Penjelajah Alam Semesta",
    description: "Eksplorasi dunia sains dan penemuan seru melalui pengamatan dan eksperimen virtual.",
    gradient: "from-emerald-400 to-teal-500",
    borderColor: "border-emerald-300",
    accentBg: "bg-emerald-50",
    textColor: "text-emerald-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "social",
    name: "IPS",
    icon: "🌎",
    tagline: "Mengenal Dunia & Budaya",
    description: "Mengenal masyarakat, lingkungan, profesi, dan keragaman budaya Nusantara yang kaya.",
    gradient: "from-cyan-400 to-sky-500",
    borderColor: "border-cyan-300",
    accentBg: "bg-cyan-50",
    textColor: "text-cyan-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "arabic",
    name: "Bahasa Arab",
    icon: "🕌",
    tagline: "Belajar Huruf & Kosakata",
    description: "Belajar Bahasa Arab dengan mudah dan seru, huruf hijaiyah, harakat, dan kosakata bergambar.",
    gradient: "from-emerald-500 to-green-600",
    borderColor: "border-green-300",
    accentBg: "bg-green-50",
    textColor: "text-green-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "mandarin",
    name: "Bahasa Mandarin",
    icon: "🇨🇳",
    tagline: "Pinyin, Hanzi & Budaya",
    description: "Belajar Bahasa Mandarin dan budaya Tiongkok: nada, pinyin, karakter dasar, dan sapaan ramah.",
    gradient: "from-rose-400 to-red-500",
    borderColor: "border-rose-300",
    accentBg: "bg-rose-50",
    textColor: "text-rose-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "indonesian",
    name: "Bahasa Indonesia",
    icon: "🇮🇩",
    tagline: "Membaca & Merangkai Kata",
    description: "Membaca, menulis, mengenal fonem, menyusun kata dan kalimat bahasa persatuan kita.",
    gradient: "from-red-400 to-rose-500",
    borderColor: "border-red-300",
    accentBg: "bg-red-50",
    textColor: "text-red-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "english",
    name: "Bahasa Inggris",
    icon: "🇬🇧",
    tagline: "Fun English for Kids",
    description: "Belajar Bahasa Inggris seru dan interaktif dengan listening, vocabulary, reading, dan dialog.",
    gradient: "from-violet-400 to-purple-500",
    borderColor: "border-violet-300",
    accentBg: "bg-violet-50",
    textColor: "text-violet-800",
    recommendedAges: ["2-3", "4-5", "6-7", "8-10", "11-12"],
  },
  {
    id: "coding",
    name: "Coding",
    icon: "💻",
    tagline: "Logika, Pola & Proyek",
    description: "Belajar dasar coding untuk anak-anak: urutan algoritma blok panah, logika arah, hingga simulasi proyek.",
    gradient: "from-blue-500 to-cyan-500",
    borderColor: "border-cyan-300",
    accentBg: "bg-cyan-50",
    textColor: "text-cyan-800",
    recommendedAges: ["4-5", "6-7", "8-10", "11-12"],
  },
];
