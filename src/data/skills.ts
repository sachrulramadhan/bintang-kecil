import { CategoryId } from "../types";

export interface SkillDefinition {
  id: string;
  name: string;
  category: CategoryId;
  description: string;
  icon: string;
}

export const SKILLS_TAXONOMY: Record<string, SkillDefinition> = {
  // Mathematics
  "number-recognition": {
    id: "number-recognition",
    name: "Mengenal Angka",
    category: "mathematics",
    description: "Kemampuan mengenali simbol angka dan nilainya",
    icon: "🔢",
  },
  "counting": {
    id: "counting",
    name: "Menghitung Jumlah",
    category: "mathematics",
    description: "Menghubungkan angka dengan kuantitas objek nyata",
    icon: "🍎",
  },
  "addition": {
    id: "addition",
    name: "Penjumlahan",
    category: "mathematics",
    description: "Menggabungkan dua kelompok bilangan",
    icon: "➕",
  },
  "subtraction": {
    id: "subtraction",
    name: "Pengurangan",
    category: "mathematics",
    description: "Menghitung sisa atau selisih kuantitas",
    icon: "➖",
  },
  "shapes-geometry": {
    id: "shapes-geometry",
    name: "Bentuk & Geometri",
    category: "mathematics",
    description: "Mengenali bangun datar, ruang, dan posisi spasial",
    icon: "🔺",
  },
  "patterns-logic": {
    id: "patterns-logic",
    name: "Pola & Urutan",
    category: "mathematics",
    description: "Mengidentifikasi dan melanjutkan urutan pola",
    icon: "🧩",
  },

  // Indonesian / Literacy
  "letter-recognition": {
    id: "letter-recognition",
    name: "Mengenal Huruf",
    category: "indonesian",
    description: "Mengenali bentuk dan nama huruf alfabet",
    icon: "🔤",
  },
  "phonics": {
    id: "phonics",
    name: "Mengenal Bunyi Fonem",
    category: "indonesian",
    description: "Mendengarkan dan membedakan bunyi huruf",
    icon: "🔊",
  },
  "word-formation": {
    id: "word-formation",
    name: "Menyusun Kata",
    category: "indonesian",
    description: "Merangkai huruf menjadi kata bermakna",
    icon: "🧩",
  },
  "letter-writing": {
    id: "letter-writing",
    name: "Menulis & Menebalkan Huruf",
    category: "indonesian",
    description: "Motorik halus mengikuti jalur goresan huruf",
    icon: "✏️",
  },
  "word-reading": {
    id: "word-reading",
    name: "Membaca Kata",
    category: "indonesian",
    description: "Memahami arti kata melalui teks dan visual",
    icon: "📖",
  },
  "sentence-building": {
    id: "sentence-building",
    name: "Menyusun Kalimat",
    category: "indonesian",
    description: "Merangkai kata menjadi kalimat utuh yang tepat",
    icon: "📝",
  },

  // Science
  "animal-classification": {
    id: "animal-classification",
    name: "Mengenal Hewan & Habitat",
    category: "science",
    description: "Mengelompokkan hewan berdasarkan ciri dan tempat tinggal",
    icon: "🐾",
  },
  "plant-life": {
    id: "plant-life",
    name: "Dunia Tumbuhan",
    category: "science",
    description: "Mengenal bagian tumbuhan, fotosintesis, dan daur hidup",
    icon: "🌱",
  },
  "weather-seasons": {
    id: "weather-seasons",
    name: "Cuaca & Lingkungan",
    category: "science",
    description: "Mengamati perubahan cuaca, air, dan suhu",
    icon: "☀️",
  },
  "scientific-inquiry": {
    id: "scientific-inquiry",
    name: "Eksperimen & Pengamatan",
    category: "science",
    description: "Membuat prediksi, mencoba dan menyimpulkan",
    icon: "🔍",
  },

  // Social
  "family-community": {
    id: "family-community",
    name: "Keluarga & Masyarakat",
    category: "social",
    description: "Mengenal peran dalam keluarga dan lingkungan sekitar",
    icon: "🏡",
  },
  "cultural-heritage": {
    id: "cultural-heritage",
    name: "Budaya Nusantara",
    category: "social",
    description: "Mengenal rumah adat, pakaian daerah, dan keragaman",
    icon: "🎭",
  },
  "geography-maps": {
    id: "geography-maps",
    name: "Peta & Pulau Indonesia",
    category: "social",
    description: "Mengenali pulau-pulau besar dan bentang alam",
    icon: "🗺️",
  },

  // Arabic
  "arabic-letters": {
    id: "arabic-letters",
    name: "Huruf Hijaiyah",
    category: "arabic",
    description: "Mengenal bentuk huruf hijaiyah dan bunyi dasar",
    icon: "🕌",
  },
  "arabic-vocab": {
    id: "arabic-vocab",
    name: "Kosakata Bahasa Arab",
    category: "arabic",
    description: "Kosakata benda, warna, dan keluarga dalam bahasa Arab",
    icon: "📜",
  },

  // Mandarin
  "mandarin-pinyin": {
    id: "mandarin-pinyin",
    name: "Pinyin & 4 Nada",
    category: "mandarin",
    description: "Melafalkan nada dan ejaan pinyin dengan benar",
    icon: "🇨🇳",
  },
  "mandarin-vocab": {
    id: "mandarin-vocab",
    name: "Kosakata Mandarin",
    category: "mandarin",
    description: "Mengenal kosakata sapaan dan hanzi dasar bergambar",
    icon: "🏮",
  },

  // English
  "english-vocab": {
    id: "english-vocab",
    name: "English Vocabulary",
    category: "english",
    description: "Mengenal kata benda, hewan, dan warna dalam bahasa Inggris",
    icon: "🇬🇧",
  },
  "english-listening": {
    id: "english-listening",
    name: "English Listening",
    category: "english",
    description: "Mendengarkan instruksi dan frasa sederhana bahasa Inggris",
    icon: "🎧",
  },

  // Coding
  "spatial-coding": {
    id: "spatial-coding",
    name: "Urutan Instruksi (Algoritma)",
    category: "coding",
    description: "Menyusun blok arah panah untuk mencapai target",
    icon: "➡️",
  },
  "loop-patterns": {
    id: "loop-patterns",
    name: "Pengulangan (Loop)",
    category: "coding",
    description: "Mengenal pola yang berulang dalam instruksi",
    icon: "🔄",
  },

  // Stories
  "reading-comprehension": {
    id: "reading-comprehension",
    name: "Pemahaman Cerita",
    category: "stories",
    description: "Memahami alur cerita, karakter, dan pesan moral",
    icon: "📚",
  },
  "moral-values": {
    id: "moral-values",
    name: "Nilai Karakter",
    category: "stories",
    description: "Mengenal sikap jujur, empati, tolong-menolong",
    icon: "💖",
  },
};
