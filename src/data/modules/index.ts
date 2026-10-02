import { LearningModule } from "../../types";

export const ALL_MODULES: LearningModule[] = [
  // =========================================================================
  // TINGKAT USIA 2-3 TAHUN (Playgroup / Batita)
  // Metode Belajar: Sensori & Eksplorasi Konkret (Sentuh, Suara, Bentuk, Warna, Meniru Bunyi)
  // =========================================================================

  // 1. Matematika 2-3: Mengenal Angka 1-3
  {
    id: "math-2-3-001",
    category: "mathematics",
    subcategory: "Angka Konkret",
    title: "Mengenal Angka 1 sampai 3",
    description: "Mengenal bentuk angka 1, 2, dan 3 dengan buah-buahan lezat!",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Mengenali bentuk visual angka 1, 2, dan 3",
      "Menghitung benda nyata hingga 3 butir buah",
    ],
    skills: ["number-recognition", "counting"],
    estimatedDuration: 6,
    prerequisites: [],
    curriculumReferences: ["Kurikulum PAUD - Nilai Bilangan Konkret"],
    whyItMatters: "Membangun persepsi kuantitas objek di dunia nyata.",
    nextModuleIds: ["math-2-3-002"],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Halo Angka 1, 2, dan 3!",
        bimoNarration: "Halo teman kecil! Bimo punya buah-buahan segar. Yuk kita hitung bersama satu persatu!",
        details: "1 seperti pensil tegak, 2 seperti bebek berenang di air, 3 seperti burung terbang di angkasa!",
      },
      {
        type: "explore",
        title: "Sentuh dan Hitung Buahnya!",
        bimoNarration: "Sentuh buah di bawah ini untuk mendengar suaranya!",
        exploreItems: [
          { label: "Satu Apel", icon: "🍎", soundText: "Satu apel merah segar!", explanation: "Angka 1" },
          { label: "Dua Pisang", icon: "🍌🍌", soundText: "Dua pisang kuning manis!", explanation: "Angka 2" },
          { label: "Tiga Jeruk", icon: "🍊🍊🍊", soundText: "Tiga jeruk manis berair!", explanation: "Angka 3" },
        ],
      },
      {
        type: "game",
        title: "Tebak Banyaknya Buah",
        bimoNarration: "Ada berapa buah yang kamu lihat di keranjang?",
        gameType: "word-image",
      },
      {
        type: "practice",
        title: "Latihan Seru",
        bimoNarration: "Ayo pilih kartu yang benar sesuai pertanyaan Bimo ya!",
        questions: [
          {
            id: "m23_q1",
            text: "Manakah yang berjumlah SATU (1)?",
            audioText: "Manakah yang berjumlah satu?",
            imageEmoji: "🍎",
            hint: "Cari buah yang hanya ada satu biji sendirian.",
            skillId: "counting",
            difficulty: 1,
            options: [
              { id: "opt1", text: "1 Apel", imageEmoji: "🍎", isCorrect: true },
              { id: "opt2", text: "2 Apel", imageEmoji: "🍎🍎", isCorrect: false },
              { id: "opt3", text: "3 Apel", imageEmoji: "🍎🍎🍎", isCorrect: false },
            ],
          },
          {
            id: "m23_q2",
            text: "Berapa banyak buah pisang ini? 🍌🍌",
            audioText: "Ada berapa buah pisang ini?",
            imageEmoji: "🍌🍌",
            hint: "Hitung pelan-pelan: satu... dua!",
            skillId: "counting",
            difficulty: 1,
            options: [
              { id: "opt1", text: "1", isCorrect: false },
              { id: "opt2", text: "2", isCorrect: true },
              { id: "opt3", text: "3", isCorrect: false },
            ],
          },
          {
            id: "m23_q3",
            text: "Mana angka yang berbentuk seperti bebek berenang?",
            audioText: "Mana angka dua yang meliuk seperti bebek?",
            hint: "Angka 2 punya leher melengkung dan ekor lurus di bawah.",
            skillId: "number-recognition",
            difficulty: 1,
            options: [
              { id: "opt1", text: "1", isCorrect: false },
              { id: "opt2", text: "2", isCorrect: true },
              { id: "opt3", text: "3", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hebat! Kamu Mengenal 1, 2, 3!",
        bimoNarration: "Luar biasa! Sekarang kamu sudah bisa menghitung 1, 2, dan 3 buah!",
      },
    ],
  },

  // 2. Matematika 2-3: Besar dan Kecil
  {
    id: "math-2-3-002",
    category: "mathematics",
    subcategory: "Perbandingan Konkret",
    title: "Membedakan Besar dan Kecil",
    description: "Melihat perbedaan ukuran benda bersama Gajah yang besar dan Semut yang kecil!",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Memahami konsep perbandingan ukuran 'besar' dan 'kecil'",
      "Mengelompokkan objek berdasarkan ukuran relatif",
    ],
    skills: ["size-comparison", "visual-discrimination"],
    estimatedDuration: 6,
    prerequisites: [],
    curriculumReferences: ["Kurikulum PAUD - Konsep Spasial & Komparasi"],
    whyItMatters: "Membantu anak memahami hubungan ukuran di lingkungannya.",
    nextModuleIds: ["math-2-3-003"],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Gajah Besar dan Semut Kecil",
        bimoNarration: "Lihat! Ada Gajah yang badannya besar sekali 🐘, dan ada semut imut yang kecil 🐜!",
        details: "Besar artinya memakan tempat banyak, kecil artinya imut dan pas di telapak tangan.",
      },
      {
        type: "explore",
        title: "Sentuh Ukuran Benda",
        bimoNarration: "Sentuh hewan-hewan ini untuk melihat ukurannya!",
        exploreItems: [
          { label: "Gajah Besar", icon: "🐘", soundText: "Gajah besar sekali!", explanation: "BESAR" },
          { label: "Semut Kecil", icon: "🐜", soundText: "Semut imut dan kecil!", explanation: "KECIL" },
          { label: "Semangka Besar", icon: "🍉", soundText: "Semangka bulat besar!", explanation: "BESAR" },
          { label: "Stroberi Kecil", icon: "🍓", soundText: "Stroberi mungil kecil!", explanation: "KECIL" },
        ],
      },
      {
        type: "practice",
        title: "Pilih Ukuran yang Tepat",
        bimoNarration: "Ayo bantu Bimo menemukan benda yang besar dan kecil!",
        questions: [
          {
            id: "m23_size_1",
            text: "Manakah bola yang paling BESAR?",
            audioText: "Manakah bola yang paling besar?",
            hint: "Pilih bola yang ukurannya paling raksasa.",
            skillId: "size-comparison",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Bola Besar", imageEmoji: "⚽", isCorrect: true },
              { id: "opt2", text: "Kelereng Kecil", imageEmoji: "⚪", isCorrect: false },
            ],
          },
          {
            id: "m23_size_2",
            text: "Manakah hewan yang paling KECIL?",
            audioText: "Manakah hewan yang kecil imut?",
            hint: "Hewan yang bisa berjalan di atas daun.",
            skillId: "size-comparison",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Semut", imageEmoji: "🐜", isCorrect: true },
              { id: "opt2", text: "Gajah", imageEmoji: "🐘", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Pintar! Kamu Sudah Tahu Besar & Kecil",
        bimoNarration: "Wah hebat! Sekarang kamu bisa membedakan benda besar dan kecil di rumahmu!",
      },
    ],
  },

  // 3. Bahasa Indonesia 2-3: Huruf Vokal A I U E O
  {
    id: "indo-2-3-001",
    category: "indonesian",
    subcategory: "Bunyi Huruf Vokal",
    title: "Mengenal Huruf Vokal A, I, U, E, O",
    description: "Membuka mulut gembira menirukan bunyi vokal bersama lagu ceria!",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Mengenal 5 bunyi vokal dasar bahasa Indonesia",
      "Melatih artikulasi mulut: A, I, U, E, O",
    ],
    skills: ["phonics-vowels", "speech-articulation"],
    estimatedDuration: 7,
    prerequisites: [],
    curriculumReferences: ["Fonik Dasar PAUD - Pengenalan Vokal"],
    whyItMatters: "Huruf vokal adalah nyawa dari setiap kata yang kita ucapkan.",
    nextModuleIds: ["indo-2-3-002"],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Bernyanyi A - I - U - E - O",
        bimoNarration: "A untuk Apel! I untuk Ikan! U untuk Ulat! E untuk Elang! O untuk Obor!",
      },
      {
        type: "explore",
        title: "Sentuh Setiap Huruf Vokal",
        bimoNarration: "Sentuh huruf di bawah untuk mendengarkan bunyinya!",
        exploreItems: [
          { label: "A - Apel", icon: "🍎", soundText: "Aaaaa... Buka mulut lebar-lebar: A untuk Apel!", explanation: "A" },
          { label: "I - Ikan", icon: "🐟", soundText: "Iiiii... Tersenyum manis: I untuk Ikan!", explanation: "I" },
          { label: "U - Ulat", icon: "🐛", soundText: "Uuuuu... Majukan bibirmu: U untuk Ulat!", explanation: "U" },
          { label: "E - Es Krim", icon: "🍦", soundText: "Eeeee... Enaknya: E untuk Es Krim!", explanation: "E" },
          { label: "O - Orang", icon: "🙆", soundText: "Ooooo... Bulatkan bibir: O untuk Orang!", explanation: "O" },
        ],
      },
      {
        type: "practice",
        title: "Tebak Bunyi Huruf",
        bimoNarration: "Huruf apa yang berbunyi seperti ini?",
        questions: [
          {
            id: "indo23_v1",
            text: "Huruf apakah ini: A (seperti pada kata Apel 🍎)?",
            audioText: "Huruf apakah ini? A untuk Apel!",
            imageEmoji: "🍎",
            hint: "Buka mulut lebar: A!",
            skillId: "phonics-vowels",
            difficulty: 1,
            options: [
              { id: "opt1", text: "A", isCorrect: true },
              { id: "opt2", text: "U", isCorrect: false },
              { id: "opt3", text: "I", isCorrect: false },
            ],
          },
          {
            id: "indo23_v2",
            text: "Mana gambar yang diawali bunyi 'I'? (Ikan 🐟)",
            audioText: "Mana gambar yang diawali bunyi I?",
            hint: "Hewan yang berenang di dalam air.",
            skillId: "phonics-vowels",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Ikan", imageEmoji: "🐟", isCorrect: true },
              { id: "opt2", text: "Ayam", imageEmoji: "🐔", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hebat! Kamu Hafal A-I-U-E-O!",
        bimoNarration: "Bagus sekali! Kamu sudah bisa membunyikan lima huruf vokal dengan sangat fasih!",
      },
    ],
  },

  // 4. Bahasa Indonesia 2-3: Suara Hewan Lucu
  {
    id: "indo-2-3-002",
    category: "indonesian",
    subcategory: "Meniru Bunyi",
    title: "Suara Hewan Lucu di Peternakan",
    description: "Mendengarkan dan menirukan suara Kucing, Sapi, Bebek, dan Ayam!",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Menghubungkan hewan dengan tiruan bunyinya",
      "Melatih pendengaran auditori dan pengucapan fonem",
    ],
    skills: ["auditory-discrimination", "animal-sounds"],
    estimatedDuration: 6,
    prerequisites: [],
    curriculumReferences: ["Kurikulum Sensori PAUD"],
    whyItMatters: "Meniru suara hewan adalah langkah awal anak melatih kelenturan pita suara.",
    nextModuleIds: [],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Kucing Meong dan Sapi Moo",
        bimoNarration: "Hewan-hewan punya suara yang unik lho! Kucing berbunyi meong-meong, sapi berbunyi mooo!",
      },
      {
        type: "explore",
        title: "Sentuh Hewan & Dengarkan",
        bimoNarration: "Sentuh hewannya untuk mendengar suaranya!",
        exploreItems: [
          { label: "Kucing", icon: "🐱", soundText: "Meong... meong!", explanation: "Kucing" },
          { label: "Sapi", icon: "🐮", soundText: "Mooo... mooo!", explanation: "Sapi" },
          { label: "Bebek", icon: "🦆", soundText: "Kwek kwek kwek!", explanation: "Bebek" },
          { label: "Ayam", icon: "🐔", soundText: "Kukuruyuk!", explanation: "Ayam" },
        ],
      },
      {
        type: "practice",
        title: "Tebak Suara Hewan",
        bimoNarration: "Hewan manakah yang bersuara seperti ini?",
        questions: [
          {
            id: "indo23_ani1",
            text: "Hewan mana yang bersuara 'Meong meong'? 🐱",
            audioText: "Hewan mana yang berbunyi meong meong?",
            hint: "Hewan berbulu halus yang suka susu dan ikan.",
            skillId: "animal-sounds",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Kucing", imageEmoji: "🐱", isCorrect: true },
              { id: "opt2", text: "Sapi", imageEmoji: "🐮", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hore! Kamu Jago Meniru Suara!",
        bimoNarration: "Luar biasa! Tiruan suara hewanmu terdengar sangat mirip dan menggemaskan!",
      },
    ],
  },

  // 5. Sains 2-3: Terang Siang dan Gelap Malam
  {
    id: "sci-2-3-001",
    category: "science",
    subcategory: "Pengamatan Alam",
    title: "Terang Siang dan Gelap Malam",
    description: "Melihat Matahari yang hangat di siang hari dan Bulan bintang yang indah di malam hari.",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Mengenal perbedaan suasana siang dan malam",
      "Mengenal Matahari, Bulan, dan Bintang",
    ],
    skills: ["nature-observation", "day-night"],
    estimatedDuration: 6,
    prerequisites: [],
    curriculumReferences: ["Sains Anak Usia Dini - Gejala Alam"],
    whyItMatters: "Membantu anak memahami ritme harian kapan beraktivitas dan kapan tidur.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Matahari Terang & Bulan Damai",
        bimoNarration: "Di siang hari, Matahari bersinar terang ☀️ kita bisa bermain! Di malam hari, Bulan dan Bintang muncul 🌙 waktunya tidur nyenyak.",
      },
      {
        type: "explore",
        title: "Benda di Langit",
        bimoNarration: "Sentuh benda langit di bawah ini!",
        exploreItems: [
          { label: "Matahari", icon: "☀️", soundText: "Matahari bersinar terang di siang hari!", explanation: "Siang" },
          { label: "Bulan Sabit", icon: "🌙", soundText: "Bulan bersinar lembut di malam hari!", explanation: "Malam" },
          { label: "Bintang Gemerlap", icon: "⭐", soundText: "Bintang berkelip-kelip di angkasa gelap!", explanation: "Malam" },
        ],
      },
      {
        type: "practice",
        title: "Kapan Munculnya?",
        bimoNarration: "Pilih jawaban yang paling tepat ya!",
        questions: [
          {
            id: "sci23_q1",
            text: "Kapan kita bisa melihat Matahari terang bersinar? ☀️",
            audioText: "Kapan kita bisa melihat Matahari terang?",
            hint: "Saat langit cerah dan kita bangun tidur beraktivitas.",
            skillId: "day-night",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Siang Hari", imageEmoji: "☀️", isCorrect: true },
              { id: "opt2", text: "Malam Hari", imageEmoji: "🌙", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Sahabat Alam!",
        bimoNarration: "Hebat! Sekarang kamu tahu rahasia Matahari di siang hari dan Bulan di malam hari!",
      },
    ],
  },

  // 6. Bahasa Inggris 2-3: First Colors
  {
    id: "eng-2-3-001",
    category: "english",
    subcategory: "Colors",
    title: "My First Colors: Red, Blue, Yellow",
    description: "Mengenal warna merah, biru, dan kuning dalam bahasa Inggris bersama balon ceria!",
    ageRange: "2-3",
    difficulty: "beginner",
    learningObjectives: [
      "Mengenal kosakata warna: Red, Blue, Yellow",
      "Menghubungkan warna dengan benda di sekitar",
    ],
    skills: ["english-colors", "vocabulary"],
    estimatedDuration: 6,
    prerequisites: [],
    curriculumReferences: ["Early Childhood ESL - Primary Colors"],
    whyItMatters: "Mengenal warna dalam bahasa Inggris melatih kemampuan dwibahasa sejak dini.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Red, Blue, and Yellow!",
        bimoNarration: "Red is Merah like an Apple! Blue is Biru like the Sky! Yellow is Kuning like a Banana!",
      },
      {
        type: "explore",
        title: "Touch the Colors",
        bimoNarration: "Touch each balloon to hear its name in English!",
        exploreItems: [
          { label: "Red", icon: "🎈 (Red)", soundText: "Red! Merah menyala!", explanation: "Merah" },
          { label: "Blue", icon: "🎈 (Blue)", soundText: "Blue! Biru cerah!", explanation: "Biru" },
          { label: "Yellow", icon: "🎈 (Yellow)", soundText: "Yellow! Kuning ceria!", explanation: "Kuning" },
        ],
      },
      {
        type: "practice",
        title: "Color Quiz",
        bimoNarration: "Which color is this?",
        questions: [
          {
            id: "eng23_c1",
            text: "What color is an Apple? 🍎 (Red)",
            audioText: "What color is the apple? Red!",
            hint: "Warnanya merah cerah.",
            skillId: "english-colors",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Red", imageEmoji: "🔴", isCorrect: true },
              { id: "opt2", text: "Blue", imageEmoji: "🔵", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Good Job!",
        bimoNarration: "Awesome! You know Red, Blue, and Yellow like a champion!",
      },
    ],
  },

  // =========================================================================
  // TINGKAT USIA 4-5 TAHUN (PAUD & TK A-B) - TINGKAT ANAK PENGGUNA SAAT INI
  // Metode Belajar: Fonik, Pengenalan Suku Kata, Berhitung Bergambar, & Logika Awal
  // =========================================================================

  // 7. Matematika 4-5: Penjumlahan Ceria dengan Bintang
  {
    id: "math-4-5-001",
    category: "mathematics",
    subcategory: "Penjumlahan Bergambar",
    title: "Penjumlahan Ceria dengan Bintang",
    description: "Belajar menggabungkan dua kelompok bintang lucu menjadi satu kelompok besar!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Memahami konsep penjumlahan sederhana 1 sampai 5",
      "Menggabungkan dua kelompok objek nyata",
    ],
    skills: ["addition", "counting"],
    estimatedDuration: 8,
    prerequisites: ["math-2-3-001"],
    curriculumReferences: ["Kurikulum TK/PAUD - Operasi Bilangan Sederhana"],
    whyItMatters: "Penjumlahan konkret adalah fondasi berhitung logika masa depan.",
    nextModuleIds: ["math-4-5-002"],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Menggabungkan Bintang",
        bimoNarration: "Jika Bimo punya 2 bintang kuning ⭐⭐, lalu mendapat 1 bintang lagi ⭐, ada berapa semuanya?",
        details: "Tanda tambah (+) artinya disatukan! 2 bintang + 1 bintang = 3 bintang bersinar!",
      },
      {
        type: "explore",
        title: "Sentuh dan Gabungkan!",
        bimoNarration: "Sentuh kombinasi penjumlahan ini untuk melihat hasilnya!",
        exploreItems: [
          { label: "1 + 1", icon: "⭐ + ⭐", soundText: "Satu ditambah satu sama dengan dua bintang!", explanation: "= 2" },
          { label: "2 + 2", icon: "⭐⭐ + ⭐⭐", soundText: "Dua ditambah dua sama dengan empat bintang!", explanation: "= 4" },
          { label: "3 + 1", icon: "⭐⭐⭐ + ⭐", soundText: "Tiga ditambah satu sama dengan empat bintang!", explanation: "= 4" },
        ],
      },
      {
        type: "practice",
        title: "Latihan Menghitung",
        bimoNarration: "Yuk coba jawab pertanyaan penjumlahan ini!",
        questions: [
          {
            id: "m45_q1",
            text: "Berapakah 2 + 1 ? (⭐⭐ + ⭐)",
            audioText: "Dua ditambah satu sama dengan berapa?",
            imageEmoji: "⭐⭐ + ⭐",
            hint: "Hitung semua bintang bersama-sama: satu, dua, tiga!",
            skillId: "addition",
            difficulty: 1,
            options: [
              { id: "opt1", text: "2", isCorrect: false },
              { id: "opt2", text: "3", isCorrect: true },
              { id: "opt3", text: "4", isCorrect: false },
            ],
          },
          {
            id: "m45_q2",
            text: "Berapakah 2 + 2 ? (⭐⭐ + ⭐⭐)",
            audioText: "Dua ditambah dua sama dengan berapa?",
            imageEmoji: "⭐⭐ + ⭐⭐",
            hint: "Dua di tangan kiri, dua di tangan kanan, satukan!",
            skillId: "addition",
            difficulty: 1,
            options: [
              { id: "opt1", text: "4", isCorrect: true },
              { id: "opt2", text: "3", isCorrect: false },
              { id: "opt3", text: "5", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hore! Kamu Jago Menjumlahkan!",
        bimoNarration: "Hebat sekali! Menjumlahkan bintang dan donat jadi sangat mudah dan seru!",
      },
    ],
  },

  // 8. Matematika 4-5: Angka 4 sampai 10 & Berhitung Mundur
  {
    id: "math-4-5-002",
    category: "mathematics",
    subcategory: "Bilangan 1-10",
    title: "Mengenal Angka 4 sampai 10 & Roket Meluncur",
    description: "Belajar angka 4 sampai 10 dan menghitung mundur roket peluncuran!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Mengenal bentuk angka 4 sampai 10",
      "Berhitung urut maju dan mundur 5-4-3-2-1",
    ],
    skills: ["counting-10", "reverse-counting"],
    estimatedDuration: 8,
    prerequisites: ["math-4-5-001"],
    curriculumReferences: ["Kurikulum TK/PAUD - Bilangan 1-10"],
    whyItMatters: "Menguasai angka 1-10 adalah modal utama memasuki jenjang sekolah dasar.",
    nextModuleIds: [],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Hitung Mundur Roket: 5, 4, 3, 2, 1, Meluncur!",
        bimoNarration: "Ayo kita bantu astronot meluncurkan roket ke luar angkasa dengan berhitung mundur!",
      },
      {
        type: "explore",
        title: "Deretan Angka 4 sampai 10",
        bimoNarration: "Sentuh angkanya untuk mendengar suaranya!",
        exploreItems: [
          { label: "Empat", icon: "4️⃣", soundText: "Empat seperti kursi terbalik!", explanation: "4" },
          { label: "Lima", icon: "5️⃣", soundText: "Lima seperti badut bertopi!", explanation: "5" },
          { label: "Sepuluh", icon: "🔟", soundText: "Sepuluh adalah angka satu dan nol bersanding!", explanation: "10" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Roket",
        bimoNarration: "Angka berapa setelah 4?",
        questions: [
          {
            id: "m45_cnt1",
            text: "Angka berapakah setelah 4? (1, 2, 3, 4, ...)",
            audioText: "Angka berapakah setelah empat?",
            hint: "Setelah empat adalah lima.",
            skillId: "counting-10",
            difficulty: 1,
            options: [
              { id: "opt1", text: "5", isCorrect: true },
              { id: "opt2", text: "6", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Roketmu Berhasil Meluncur!",
        bimoNarration: "Luar biasa! Kamu sudah menguasai angka 1 sampai 10!",
      },
    ],
  },

  // 9. Bahasa Indonesia 4-5: Suku Kata Terbuka BA-BI-BU-BE-BO
  {
    id: "indo-4-5-001",
    category: "indonesian",
    subcategory: "Suku Kata",
    title: "Mengenal Suku Kata Terbuka BA, BI, BU, BE, BO",
    description: "Menggabungkan huruf konsonan B dengan vokal menjadi kata bermakna seperti Bola dan Buku!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Menggabungkan huruf B dengan vokal: BA, BI, BU, BE, BO",
      "Membaca kata sederhana 2 suku kata: BOLA, BUKU, BAJU",
    ],
    skills: ["syllable-formation", "early-reading"],
    estimatedDuration: 8,
    prerequisites: ["indo-2-3-001"],
    curriculumReferences: ["Metode Suku Kata PAUD/TK"],
    whyItMatters: "Membaca dengan suku kata adalah metode paling efektif bagi anak Indonesia.",
    nextModuleIds: ["indo-4-5-002"],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "B Bertemu Teman Vokal",
        bimoNarration: "B bertemu A jadi BA! B bertemu U jadi BU! B bertemu O jadi BO!",
      },
      {
        type: "explore",
        title: "Sentuh Suku Kata",
        bimoNarration: "Sentuh suku katanya untuk mendengarkan bunyinya!",
        exploreItems: [
          { label: "BA - Baju", icon: "👕", soundText: "B - A dibaca BA! BA untuk Baju!", explanation: "BA" },
          { label: "BI - Bintang", icon: "⭐", soundText: "B - I dibaca BI! BI untuk Bintang!", explanation: "BI" },
          { label: "BU - Buku", icon: "📚", soundText: "B - U dibaca BU! BU untuk Buku!", explanation: "BU" },
          { label: "BO - Bola", icon: "⚽", soundText: "B - O dibaca BO! BO untuk Bola!", explanation: "BO" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Suku Kata",
        bimoNarration: "Manakah suku kata yang membentuk kata BUKU?",
        questions: [
          {
            id: "indo45_sy1",
            text: "Kata 'BOLA' diawali dengan suku kata apa? (⚽)",
            audioText: "Kata BOLA diawali suku kata apa?",
            hint: "B digabung dengan O berbunyi BO.",
            skillId: "syllable-formation",
            difficulty: 1,
            options: [
              { id: "opt1", text: "BO", isCorrect: true },
              { id: "opt2", text: "BA", isCorrect: false },
              { id: "opt3", text: "BU", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Sudah Bisa Merangkai Kata!",
        bimoNarration: "Horeee! Membaca BA-BI-BU-BE-BO membuatmu semakin lancar membaca kata!",
      },
    ],
  },

  // 10. Bahasa Indonesia 4-5: Tiga Kata Sopan
  {
    id: "indo-4-5-002",
    category: "indonesian",
    subcategory: "Karakter & Budi Pekerti",
    title: "Tiga Kata Ajaib: Tolong, Maaf, Terima Kasih",
    description: "Belajar mengucapkan kata-kata sopan dalam pergaulan sehari-hari bersama teman dan keluarga.",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Mengucapkan kata 'Tolong' saat meminta bantuan",
      "Mengucapkan 'Terima Kasih' setelah dibantu atau diberi hadiah",
      "Mengucapkan 'Maaf' saat melakukan kesalahan",
    ],
    skills: ["polite-words", "social-etiquette"],
    estimatedDuration: 7,
    prerequisites: [],
    curriculumReferences: ["Pendidikan Karakter & Moral PAUD"],
    whyItMatters: "Membentuk pribadi anak yang santun, ramah, dan disayangi semua orang.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Kata Ajaib yang Menghangatkan Hati",
        bimoNarration: "Tiga kata ajaib: Tolong, Maaf, dan Terima Kasih akan membuat semua orang tersenyum bahagia!",
      },
      {
        type: "explore",
        title: "Kapan Kita Mengucapkannya?",
        bimoNarration: "Sentuh situasinya untuk mengetahui kata ajaibnya!",
        exploreItems: [
          { label: "Saat Minta Bantuan", icon: "🤝", soundText: "Ucapkan: Tolong ya Bunda!", explanation: "TOLONG" },
          { label: "Saat Diberi Hadiah", icon: "🎁", soundText: "Ucapkan: Terima kasih banyak!", explanation: "TERIMA KASIH" },
          { label: "Saat Tak Sengaja Menabrak", icon: "🙏", soundText: "Ucapkan: Maafkan aku ya temanku!", explanation: "MAAF" },
        ],
      },
      {
        type: "practice",
        title: "Pilih Kata Ajaib",
        bimoNarration: "Kata apa yang harus diucapkan pada situasi ini?",
        questions: [
          {
            id: "indo45_pol1",
            text: "Jika teman meminjamkan pensil kepadamu, ucapkan apa? ✏️",
            audioText: "Jika teman meminjamkan pensil kepadamu, ucapkan apa?",
            hint: "Ucapkan rasa syukur dan kebaikan hati.",
            skillId: "polite-words",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Terima Kasih", isCorrect: true },
              { id: "opt2", text: "Diam saja", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Anak Santun Juara!",
        bimoNarration: "Bagus sekali! Kamu adalah anak yang sangat santun dan berakhlak mulia!",
      },
    ],
  },

  // 11. Sains 4-5: Tumbuhan dari Biji
  {
    id: "sci-4-5-001",
    category: "science",
    subcategory: "Dunia Tumbuhan",
    title: "Pertumbuhan Tanaman dari Biji Kecil 🌱",
    description: "Melihat keajaiban biji kecil yang disiram air dan terkena sinar matahari tumbuh jadi pohon!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Memahami urutan pertumbuhan tanaman: Biji -> Tunas -> Daun -> Bunga",
      "Mengenal kebutuhan tanaman: Air, Tanah, dan Sinar Matahari",
    ],
    skills: ["plant-lifecycle", "living-things"],
    estimatedDuration: 8,
    prerequisites: [],
    curriculumReferences: ["Sains Eksplorasi PAUD/TK"],
    whyItMatters: "Menumbuhkan rasa cinta dan tanggung jawab merawat lingkungan hidup.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Biji Kecil yang Tumbuh",
        bimoNarration: "Biji yang tertidur di dalam tanah, jika kita siram air dan kena sinar matahari, akan bangun menjadi tunas hijau!",
      },
      {
        type: "explore",
        title: "Fase Pertumbuhan",
        bimoNarration: "Sentuh tahapan pertumbuhannya!",
        exploreItems: [
          { label: "1. Biji di Tanah", icon: "🌰", soundText: "Biji kecil ditanam di tanah subur!", explanation: "Biji" },
          { label: "2. Muncul Tunas", icon: "🌱", soundText: "Tunas hijau mungil mulai menyembul ke atas!", explanation: "Tunas" },
          { label: "3. Tumbuh Daun", icon: "🌿", soundText: "Daun-daun lebar mulai menyerap sinar matahari!", explanation: "Tumbuhan" },
          { label: "4. Mekar Bunga", icon: "🌻", soundText: "Bunga matahari yang cantik mekar dengan indah!", explanation: "Bunga" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Tanaman",
        bimoNarration: "Apa yang dibutuhkan biji agar bisa tumbuh?",
        questions: [
          {
            id: "sci45_p1",
            text: "Apa yang dibutuhkan biji agar bisa tumbuh subur? 🌱",
            audioText: "Apa yang dibutuhkan biji agar bisa tumbuh subur?",
            hint: "Air bersih dan sinar matahari yang hangat.",
            skillId: "plant-lifecycle",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Air & Sinar Matahari", imageEmoji: "💧☀️", isCorrect: true },
              { id: "opt2", text: "Es Batu & Cokelat", imageEmoji: "🧊🍫", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Sahabat Tumbuhan!",
        bimoNarration: "Hebat! Sekarang kamu tahu cara merawat tanaman agar tumbuh subur dan rindang!",
      },
    ],
  },

  // 12. Coding 4-5: Petualangan Balok Panah Bimo
  {
    id: "code-4-5-001",
    category: "coding",
    subcategory: "Logika Arah",
    title: "Petualangan Balok Panah Arah Bimo ➡️⬆️",
    description: "Membantu Bimo kelinci mengambil wortel lezat menggunakan balok arah kanan, kiri, atas, bawah!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Mengenal 4 arah mata angin sederhana: Atas, Bawah, Kanan, Kiri",
      "Menyusun langkah berurutan (algoritma satu langkah) untuk mencapai target",
    ],
    skills: ["spatial-logic", "directional-coding"],
    estimatedDuration: 9,
    prerequisites: [],
    curriculumReferences: ["Computational Thinking for Early Childhood"],
    whyItMatters: "Melatih logika spasial dan pemecahan masalah sejak usia dini tanpa rumus.",
    nextModuleIds: [],
    assessment: { questionCount: 3, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Menggerakkan Robot Bimo",
        bimoNarration: "Bimo lapar ingin makan wortel! Ayo beri Bimo petunjuk dengan memilih panah yang benar!",
      },
      {
        type: "explore",
        title: "Sentuh Balok Arah",
        bimoNarration: "Sentuh panah untuk melihat arah lompatannya!",
        exploreItems: [
          { label: "Ke Kanan", icon: "➡️", soundText: "Panah ke kanan! Melompat ke arah kanan!", explanation: "Kanan" },
          { label: "Ke Atas", icon: "⬆️", soundText: "Panah ke atas! Melompat maju ke depan!", explanation: "Atas" },
          { label: "Ke Kiri", icon: "⬅️", soundText: "Panah ke kiri! Melompat ke sisi kiri!", explanation: "Kiri" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Panah Arah",
        bimoNarration: "Panah mana yang harus Bimo ikuti?",
        questions: [
          {
            id: "code45_q1",
            text: "Wortel berada di sebelah KANAN Bimo (🐰 ➡️ 🥕). Panah mana yang harus dipilih?",
            audioText: "Panah mana yang mengarah ke kanan menuju wortel?",
            hint: "Pilih panah yang menunjuk ke kanan.",
            skillId: "directional-coding",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Panah Kanan ➡️", isCorrect: true },
              { id: "opt2", text: "Panah Kiri ⬅️", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Wortel Berhasil Didapat!",
        bimoNarration: "Yummy! Terima kasih programmer cilik! Kamu sudah berhasil memandu Bimo dengan tepat!",
      },
    ],
  },

  // 13. Bahasa Inggris 4-5: Animals & Greetings
  {
    id: "eng-4-5-001",
    category: "english",
    subcategory: "Animals & Greetings",
    title: "Animal Friends & Hello Song 🐱🐶",
    description: "Menyapa teman baru dengan 'Hello!' dan mengenal Cat, Dog, Bird, and Fish!",
    ageRange: "4-5",
    difficulty: "developing",
    learningObjectives: [
      "Mengucapkan salam 'Hello' dan 'Good Morning'",
      "Mengenal 4 nama hewan dalam bahasa Inggris",
    ],
    skills: ["english-animals", "greetings"],
    estimatedDuration: 7,
    prerequisites: [],
    curriculumReferences: ["Early Childhood ESL - Everyday Words"],
    whyItMatters: "Memberi rasa percaya diri menyapa orang baru dalam bahasa internasional.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Hello Animal Friends!",
        bimoNarration: "Hello friends! When we meet, we say Hello! Cat is Kucing, Dog is Anjing, Bird is Burung!",
      },
      {
        type: "explore",
        title: "Touch the Animals",
        bimoNarration: "Touch the animals to hear their English names!",
        exploreItems: [
          { label: "Cat", icon: "🐱", soundText: "Cat! Kucing manis!", explanation: "Kucing" },
          { label: "Dog", icon: "🐶", soundText: "Dog! Anjing setia!", explanation: "Anjing" },
          { label: "Bird", icon: "🐦", soundText: "Bird! Burung terbang!", explanation: "Burung" },
          { label: "Fish", icon: "🐟", soundText: "Fish! Ikan berenang!", explanation: "Ikan" },
        ],
      },
      {
        type: "practice",
        title: "Animal Match",
        bimoNarration: "Which animal is the Cat?",
        questions: [
          {
            id: "eng45_ani1",
            text: "Which one is a 'Cat'? 🐱",
            audioText: "Which one is a Cat?",
            hint: "Hewan yang mengeong meong.",
            skillId: "english-animals",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Cat 🐱", isCorrect: true },
              { id: "opt2", text: "Fish 🐟", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Terrific!",
        bimoNarration: "Great job! You can speak English with your animal friends now!",
      },
    ],
  },

  // =========================================================================
  // TINGKAT USIA 6-7 TAHUN (SD Awal / Transisi)
  // Metode Belajar: Literasi Mandiri, Membaca Kalimat, Berhitung 1-20, & Sains Eksploratif
  // =========================================================================

  // 14. Matematika 6-7: Pola Geometri
  {
    id: "math-6-7-001",
    category: "mathematics",
    subcategory: "Pola & Geometri",
    title: "Pola Bentuk Geometri Ajaib (ABAB & ABC)",
    description: "Mengenali lingkaran, segitiga, persegi dan melanjutkan urutan polanya secara logis.",
    ageRange: "6-7",
    difficulty: "advanced",
    learningObjectives: [
      "Mengidentifikasi bentuk dasar: lingkaran, segitiga, persegi",
      "Melanjutkan pola berulang ABAB dan ABC",
    ],
    skills: ["shapes-geometry", "patterns-logic"],
    estimatedDuration: 10,
    prerequisites: ["math-4-5-001"],
    curriculumReferences: ["Kurikulum Merdeka Kelas 1 SD - Pola Bilangan & Bentuk"],
    whyItMatters: "Mengenali pola adalah dasar dari penalaran aljabar dan sains masa depan.",
    nextModuleIds: ["math-6-7-002"],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Bentuk Geometri dan Polanya",
        bimoNarration: "Lingkaran 🟡, Segitiga 🔺, Lingkaran 🟡, Segitiga 🔺... Bentuk apa berikutnya? Ya, Lingkaran 🟡!",
      },
      {
        type: "explore",
        title: "Sentuh Setiap Bentuk",
        bimoNarration: "Sentuh bentuk di bawah untuk mengetahui ciri-cirinya!",
        exploreItems: [
          { label: "Lingkaran", icon: "🟡", soundText: "Lingkaran bulat sempurna tanpa sudut!", explanation: "Bulat" },
          { label: "Segitiga", icon: "🔺", soundText: "Segitiga punya tiga sudut dan tiga garis sisi!", explanation: "3 Sudut" },
          { label: "Persegi", icon: "🟦", soundText: "Persegi punya empat sisi sama panjang!", explanation: "4 Sisi" },
        ],
      },
      {
        type: "practice",
        title: "Tantangan Pola",
        bimoNarration: "Lengkapi pola berulang ini!",
        questions: [
          {
            id: "m67_q1",
            text: "Lanjutkan pola ini: 🟡 🔺 🟡 🔺 ...",
            audioText: "Bentuk apa yang seharusnya mengisi titik-titik?",
            hint: "Pola berulang: lingkaran lalu segitiga.",
            skillId: "patterns-logic",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Lingkaran 🟡", isCorrect: true },
              { id: "opt2", text: "Persegi 🟦", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Ahli Geometri!",
        bimoNarration: "Luar biasa! Matamu sangat tajam melihat pola bentuk yang berulang!",
      },
    ],
  },

  // 15. Matematika 6-7: Pengurangan Ceria 1-10
  {
    id: "math-6-7-002",
    category: "mathematics",
    subcategory: "Operasi Pengurangan",
    title: "Pengurangan Ceria: Berbagi Benda Lezat (1-10)",
    description: "Belajar konsep pengurangan saat donat atau apel dimakan atau diberikan ke teman.",
    ageRange: "6-7",
    difficulty: "advanced",
    learningObjectives: [
      "Memahami konsep pengurangan sebagai 'mengambil' atau 'berkurang'",
      "Menyelesaikan pengurangan angka 1 sampai 10",
    ],
    skills: ["subtraction", "mental-math"],
    estimatedDuration: 10,
    prerequisites: ["math-6-7-001"],
    curriculumReferences: ["Kurikulum Merdeka Kelas 1 SD - Pengurangan Bilangan"],
    whyItMatters: "Pengurangan melatih anak memecahkan masalah kuantitas nyata.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Donat Berkurang Dimakan Bimo",
        bimoNarration: "Jika ada 5 donat 🍩🍩🍩🍩🍩, lalu dimakan 2 donat 🍩🍩, sisanya tinggal 3 donat!",
      },
      {
        type: "explore",
        title: "Sentuh Contoh Pengurangan",
        bimoNarration: "Sentuh untuk melihat donat yang tersisa!",
        exploreItems: [
          { label: "3 - 1 = 2", icon: "🍩🍩🍩 (-1)", soundText: "Tiga dikurang satu sisa dua!", explanation: "= 2" },
          { label: "5 - 2 = 3", icon: "🍩🍩🍩🍩🍩 (-2)", soundText: "Lima dikurang dua sisa tiga!", explanation: "= 3" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Pengurangan",
        bimoNarration: "Berapa sisa benda ini?",
        questions: [
          {
            id: "m67_sub1",
            text: "Ada 4 apel 🍎🍎🍎🍎. Diambil 1 apel 🍎. Berapa sisanya?",
            audioText: "Empat dikurang satu sama dengan berapa?",
            hint: "Hitung mundur satu langkah dari empat.",
            skillId: "subtraction",
            difficulty: 1,
            options: [
              { id: "opt1", text: "3", isCorrect: true },
              { id: "opt2", text: "2", isCorrect: false },
              { id: "opt3", text: "5", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Juara Berhitung!",
        bimoNarration: "Hebat! Pengurangan bukan hal yang sulit bagimu sekarang!",
      },
    ],
  },

  // 16. Bahasa Indonesia 6-7: Suku Kata Tertutup & Membaca Kalimat
  {
    id: "indo-6-7-001",
    category: "indonesian",
    subcategory: "Literasi Mandiri",
    title: "Membaca Kata Suku Tertutup & Kalimat Pendek",
    description: "Membaca kata dengan akhiran konsonan seperti RUMAH, MAKAN, dan menyusun kalimat mandiri!",
    ageRange: "6-7",
    difficulty: "advanced",
    learningObjectives: [
      "Membaca kata bersuku kata tertutup: RU-MAH, MA-KAN, SI-ANG",
      "Memahami struktur kalimat sederhana Subjek - Predikat - Objek",
    ],
    skills: ["advanced-reading", "sentence-comprehension"],
    estimatedDuration: 10,
    prerequisites: ["indo-4-5-001"],
    curriculumReferences: ["Kurikulum Merdeka Kelas 1 SD - Membaca Permulaan"],
    whyItMatters: "Langkah penting menuju kemandirian membaca buku cerita tanpa bantuan.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Bimo Membaca Buku Cerita",
        bimoNarration: "Kata seperti 'RU-MAH' punya akhiran huruf H. Kata 'MA-KAN' punya akhiran N. Yuk kita gabungkan menjadi kalimat!",
      },
      {
        type: "explore",
        title: "Sentuh Kata Tertutup",
        bimoNarration: "Sentuh kata-kata ini untuk mendengarkan bunyinya!",
        exploreItems: [
          { label: "RU-MAH", icon: "🏡", soundText: "Ru-mah! Tempat tinggal kita yang nyaman!", explanation: "Rumah" },
          { label: "MA-KAN", icon: "🍽️", soundText: "Ma-kan! Menikmati makanan lezat bernutrisi!", explanation: "Makan" },
          { label: "SI-ANG", icon: "☀️", soundText: "Si-ang! Waktu cerah dengan matahari!", explanation: "Siang" },
        ],
      },
      {
        type: "practice",
        title: "Susun Kalimat Mandiri",
        bimoNarration: "Manakah urutan kalimat yang tepat?",
        questions: [
          {
            id: "indo67_q1",
            text: "Manakah kalimat yang benar?",
            audioText: "Manakah kalimat yang tersusun dengan benar?",
            hint: "Siapa pelakunya, apa kegiatannya, apa objeknya.",
            skillId: "sentence-comprehension",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Bimo makan wortel.", isCorrect: true },
              { id: "opt2", text: "Wortel makan Bimo.", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hebat! Kamu Sudah Bisa Membaca Kalimat!",
        bimoNarration: "Wah luar biasa! Membaca kalimat panjang sekarang terasa sangat menyenangkan bagimu!",
      },
    ],
  },

  // 17. Sains 6-7: Siklus Air dan Hujan 🌧️
  {
    id: "sci-6-7-001",
    category: "science",
    subcategory: "Sains Bumi",
    title: "Siklus Terjadinya Hujan & Awan Ajaib 🌧️",
    description: "Bagaimana air laut menguap terkena panas matahari, membentuk awan, dan turun menjadi hujan segar!",
    ageRange: "6-7",
    difficulty: "advanced",
    learningObjectives: [
      "Memahami siklus air: Penguapan, Pengembunan, dan Hujan",
      "Menghargai pentingnya air bersih bagi kehidupan manusia dan bumi",
    ],
    skills: ["water-cycle", "earth-science"],
    estimatedDuration: 10,
    prerequisites: ["sci-4-5-001"],
    curriculumReferences: ["Kurikulum Merdeka Kelas 1-2 SD - Gejala Alam & Lingkungan"],
    whyItMatters: "Memberi wawasan ilmiah mengapa hujan terjadi dan bagaimana merawat sumber air.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Perjalanan Tetesan Air",
        bimoNarration: "Air laut naik ke langit karena hangatnya matahari, berkumpul menjadi awan tebal, lalu turun kembali sebagai tetesan air hujan!",
      },
      {
        type: "explore",
        title: "Tahapan Siklus Air",
        bimoNarration: "Sentuh setiap tahapan siklus air!",
        exploreItems: [
          { label: "1. Penguapan", icon: "☀️🌊", soundText: "Matahari memanaskan air hingga menguap naik ke angkasa!", explanation: "Uap Air" },
          { label: "2. Jadi Awan", icon: "☁️", soundText: "Uap air mendingin dan berkumpul menjadi awan yang tebal!", explanation: "Kondensasi" },
          { label: "3. Turun Hujan", icon: "🌧️", soundText: "Ketika awan terlalu berat, butiran air jatuh menjadi hujan!", explanation: "Presipitasi" },
        ],
      },
      {
        type: "practice",
        title: "Kuis Siklus Air",
        bimoNarration: "Dari manakah air hujan berasal?",
        questions: [
          {
            id: "sci67_q1",
            text: "Awan tebal di langit terbentuk dari apa? ☁️",
            audioText: "Awan tebal di langit terbentuk dari apa?",
            hint: "Uap air yang naik dari permukaan bumi.",
            skillId: "water-cycle",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Kumpulan Uap Air", isCorrect: true },
              { id: "opt2", text: "Permen Kapas Manis", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Kamu Penjelajah Cuaca Cerdas!",
        bimoNarration: "Keren sekali! Sekarang kamu tahu mengapa hujan bisa turun menyegarkan bumi kita!",
      },
    ],
  },

  // 18. Coding 6-7: Perulangan (Loop)
  {
    id: "code-6-7-001",
    category: "coding",
    subcategory: "Algoritma & Loop",
    title: "Perulangan (Loop) Langkah Kaki Bimo 🔁",
    description: "Daripada menyusun panah berulang kali, kita gunakan balok Loop untuk melipatgandakan langkah!",
    ageRange: "6-7",
    difficulty: "advanced",
    learningObjectives: [
      "Memahami konsep perulangan (Loop) dalam pemrograman",
      "Menyederhanakan serangkaian aksi berulang dengan angka pengali",
    ],
    skills: ["looping-concept", "algorithmic-efficiency"],
    estimatedDuration: 10,
    prerequisites: ["code-4-5-001"],
    curriculumReferences: ["CSTA K-12 CS Standards - Loops & Control Structures"],
    whyItMatters: "Efisiensi berpikir adalah inti dari ilmu komputer dan matematika modern.",
    nextModuleIds: [],
    assessment: { questionCount: 2, passThreshold: 2, adaptive: true },
    activities: [
      {
        type: "learn",
        title: "Apa itu Perulangan (Loop)?",
        bimoNarration: "Jika kamu ingin melompat 3 kali ke kanan, daripada mengetik kanan, kanan, kanan, kita cukup bilang: Ulangi 3x ke Kanan! 🔁",
      },
      {
        type: "explore",
        title: "Sentuh Balok Perulangan",
        bimoNarration: "Sentuh balok loop ini!",
        exploreItems: [
          { label: "Ulangi 2x ➡️", icon: "🔁 2x", soundText: "Ulangi dua kali melangkah ke kanan!", explanation: "2 Langkah" },
          { label: "Ulangi 3x ⬆️", icon: "🔁 3x", soundText: "Ulangi tiga kali melompat ke atas!", explanation: "3 Langkah" },
        ],
      },
      {
        type: "practice",
        title: "Tantangan Loop",
        bimoNarration: "Pilih perintah yang paling ringkas!",
        questions: [
          {
            id: "code67_q1",
            text: "Manakah perintah yang sama artinya dengan: ➡️ ➡️ ➡️ ?",
            audioText: "Manakah perintah yang sama artinya dengan tiga langkah ke kanan?",
            hint: "Ulangi 3 kali langkah ke kanan.",
            skillId: "looping-concept",
            difficulty: 1,
            options: [
              { id: "opt1", text: "Ulangi 3x ke Kanan 🔁", isCorrect: true },
              { id: "opt2", text: "Diam di tempat", isCorrect: false },
            ],
          },
        ],
      },
      {
        type: "review",
        title: "Hebat! Kamu Menguasai Konsep Loop!",
        bimoNarration: "Wah luar biasa! Kamu sudah berpikir seperti seorang programmer profesional sejati!",
      },
    ],
  },
];
