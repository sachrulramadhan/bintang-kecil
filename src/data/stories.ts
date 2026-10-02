import { Story } from "../types";

export const ORIGINAL_STORIES: Story[] = [
  // --- SUBKATEGORI A: CERITA MORAL ---
  {
    id: "story_moral_01",
    title: "Bimo dan Keranjang Stroberi Kejujuran",
    category: "moral",
    ageRange: "4-5",
    moralLesson: "Jujur mengakui kesalahan selalu mendatangkan kebaikan dan ketenangan hati.",
    coverEmoji: "🍓🐰",
    pages: [
      {
        pageNum: 1,
        text: "Pagi itu, Kakek Kelinci memetik sekeranjang stroberi merah yang ranum dan manis di kebun.",
        illustration: "🧺🍓🐰🌤️",
        keywords: ["pagi", "stroberi", "kakek"],
      },
      {
        pageNum: 2,
        text: "Kakek berpesan pada Bimo, 'Tolong jaga stroberi ini ya, nanti sore kita buat selai bersama.'",
        illustration: "🐰👴🍓🏡",
        keywords: ["pesan", "selai", "jaga"],
      },
      {
        pageNum: 3,
        text: "Aroma stroberi sangat harum. Bimo mencicipi satu butir, lalu dua butir, hingga hampir setengah keranjang habis!",
        illustration: "😋🍓🧺✨",
        keywords: ["harum", "mencicipi", "manis"],
      },
      {
        pageNum: 4,
        text: "Bimo sempat cemas, tetapi Bimo memilih berkata jujur kepada Kakek sambil meminta maaf dengan tulus.",
        illustration: "🥺🐰👴💕",
        keywords: ["jujur", "maaf", "berani"],
      },
      {
        pageNum: 5,
        text: "Kakek tersenyum hangat dan memeluk Bimo. 'Kakek bangga karena Bimo berani jujur. Yuk, kita buat selai dari sisanya!'",
        illustration: "🤗🐰👴🍓🎉",
        keywords: ["bangga", "peluk", "bahagia"],
      },
    ],
    questions: [
      {
        question: "Apa buah yang dipetik oleh Kakek Kelinci?",
        options: ["Stroberi merah 🍓", "Durian tajam 🍈", "Cabai pedas 🌶️"],
        answer: 0,
        explanation: "Kakek Kelinci memetik sekeranjang stroberi merah manis di kebun.",
      },
      {
        question: "Apa yang dilakukan Bimo saat tahu stroberinya berkurang?",
        options: ["Berkata jujur dan minta maaf", "Menyalahkan burung gereja", "Bersembunyi di bawah meja"],
        answer: 0,
        explanation: "Bimo anak yang hebat karena berani berkata jujur dan bertanggung jawab.",
      },
      {
        question: "Mengapa Kakek memeluk Bimo dengan bangga?",
        options: ["Karena kejujuran Bimo", "Karena stroberinya habis", "Karena hari hujan"],
        answer: 0,
        explanation: "Kejujuran adalah sifat mulia yang paling dihargai oleh keluarga kita.",
      },
    ],
  },
  {
    id: "story_moral_02",
    title: "Roti Kehangatan Momo si Tupai",
    category: "moral",
    ageRange: "4-5",
    moralLesson: "Berbagi dengan teman tidak akan membuat kita kekurangan, justru melipatgandakan kegembiraan.",
    coverEmoji: "🐿️🥖",
    pages: [
      {
        pageNum: 1,
        text: "Momo si tupai kecil berhasil memanggang sepotong roti gandum hangat yang besar dan harum.",
        illustration: "🐿️🥖🏠🍂",
        keywords: ["momo", "roti", "gandum"],
      },
      {
        pageNum: 2,
        text: "Di luar rumah, angin berhembus sejuk. Bimo datang membawa wortel, dan Piko si burung pipit kedinginan di ranting.",
        illustration: "🐰🥕🐦🥶💨",
        keywords: ["angin", "bimo", "piko"],
      },
      {
        pageNum: 3,
        text: "Momo membagi roti gandumnya menjadi tiga bagian sama besar untuk Bimo, Piko, dan dirinya.",
        illustration: "🍞✨🐿️🐰🐦",
        keywords: ["membagi", "sama", "hangat"],
      },
      {
        pageNum: 4,
        text: "Piko tersenyum gembira mematuk remah roti hangat. Perut mereka kenyang dan tawa terdengar di seluruh hutan.",
        illustration: "😄🎉🌲💖",
        keywords: ["kenyang", "tawa", "sahabat"],
      },
    ],
    questions: [
      {
        question: "Siapa yang memanggang roti gandum hangat?",
        options: ["Momo si Tupai 🐿️", "Serigala jahat 🐺", "Ikan mas 🐟"],
        answer: 0,
        explanation: "Momo si tupai memanggang roti yang harum di rumah pohonnya.",
      },
      {
        question: "Bagaimana cara Momo membagikan roti?",
        options: ["Dibagi tiga sama rata 🍞", "Dimakan sendiri sampai habis", "Dilempar ke sungai"],
        answer: 0,
        explanation: "Momo membagikan roti hangatnya dengan penuh kebaikan kepada sahabat-sahabatnya.",
      },
      {
        question: "Apa manfaat dari berbagi?",
        options: ["Hati gembira dan sahabat bahagia", "Menjadi lapar", "Mendapat omelan"],
        answer: 0,
        explanation: "Berbagi membuat suasana menjadi hangat dan penuh persahabatan.",
      },
    ],
  },

  // --- SUBKATEGORI B: PETUALANGAN ---
  {
    id: "story_adv_01",
    title: "Petualangan Menembus Hutan Pelangi",
    category: "adventure",
    ageRange: "6-7",
    moralLesson: "Kerjasama dan rasa ingin tahu membuka jalan menuju keajaiban dunia.",
    coverEmoji: "🌈🌲🎒",
    pages: [
      {
        pageNum: 1,
        text: "Bimo dan sahabatnya, Kimi si kura-kura, menemukan peta kuno berlukiskan pelangi tujuh warna di bawah pohon beringin tua.",
        illustration: "🐰🐢🗺️🌳✨",
        keywords: ["peta", "pelangi", "kuno"],
      },
      {
        pageNum: 2,
        text: "Mereka berjalan melewati sungai bebatuan biru yang jernih, tempat ikan-ikan kecil menari memberi petunjuk arah.",
        illustration: "🌊🐟💎🚶‍♂️",
        keywords: ["sungai", "ikan", "arah"],
      },
      {
        pageNum: 3,
        text: "Di ujung jalan, kabut ungu menutupi lembah. Kimi menggunakan senter ajaibnya, dan Bimo memimpin langkah dengan tenang.",
        illustration: "🔦💜🌲🚶‍♂️",
        keywords: ["kabut", "senter", "tenang"],
      },
      {
        pageNum: 4,
        text: "Tiba-tiba, tampaklah air terjun pelangi yang memancarkan cahaya berkilauan! Airnya menumbuhkan bunga-bunga bernyanyi!",
        illustration: "🌈🌊🌸🎶✨",
        keywords: ["air terjun", "cahaya", "bunga"],
      },
    ],
    questions: [
      {
        question: "Benda apa yang ditemukan Bimo dan Kimi di bawah pohon beringin?",
        options: ["Peta kuno berlukiskan pelangi 🗺️", "Sepatu usang 👟", "Batu hitam 🪨"],
        answer: 0,
        explanation: "Mereka menemukan peta petualangan ajaib menuju Hutan Pelangi.",
      },
      {
        question: "Siapa sahabat yang menemani Bimo dalam petualangan?",
        options: ["Kimi si kura-kura 🐢", "Hiu ganas 🦈", "Buaya rawa 🐊"],
        answer: 0,
        explanation: "Kimi si kura-kura yang tenang dan setia menemani Bimo melangkah.",
      },
      {
        question: "Apa keajaiban yang ada di air terjun pelangi?",
        options: ["Bunga-bunga bernyanyi gembira 🌸🎶", "Batu meledak", "Airnya berubah es batu"],
        answer: 0,
        explanation: "Di hutan pelangi, tetesan airnya menumbuhkan bunga-bunga yang bernyanyi merdu.",
      },
    ],
  },
  {
    id: "story_adv_02",
    title: "Roket Bintang ke Lembah Kristal Bulan",
    category: "adventure",
    ageRange: "6-7",
    moralLesson: "Mimpi besar dimulai dari keberanian mencoba hal baru dan belajar giat.",
    coverEmoji: "🚀🌕✨",
    pages: [
      {
        pageNum: 1,
        text: "Malam hari di bukit bintang, Bimo memasang helm astronot mini dan menekan tombol hijau di kokpit roket mainannya.",
        illustration: "🐰🚀🌕⭐🌃",
        keywords: ["roket", "helm", "kokpit"],
      },
      {
        pageNum: 2,
        text: "'Tiga... dua... satu... Meluncur!' Roket melesat menembus awan perak diiringi taburan cahaya bintang malam.",
        illustration: "🚀💨☁️⭐🌌",
        keywords: ["meluncur", "awan", "bintang"],
      },
      {
        pageNum: 3,
        text: "Di permukaan Bulan, gravitasinya ringan sekali! Bimo bisa melompat setinggi pohon cemara tanpa takut jatuh.",
        illustration: "🐰🦘🌕🚩✨",
        keywords: ["gravitasi", "lompat", "bulan"],
      },
      {
        pageNum: 4,
        text: "Bimo mengumpulkan kristal cahaya bulan untuk dibawa pulang sebagai lentera belajar anak-anak di Bumi.",
        illustration: "💎🌕🐰💡🌏",
        keywords: ["kristal", "lentera", "bumi"],
      },
    ],
    questions: [
      {
        question: "Kendaraan apa yang dikendarai Bimo menuju ke bulan?",
        options: ["Roket Bintang 🚀", "Sepeda roda tiga 🚲", "Perahu dayung 🛶"],
        answer: 0,
        explanation: "Bimo terbang melesat menggunakan roket bintang penjelajah angkasa.",
      },
      {
        question: "Mengapa Bimo bisa melompat sangat tinggi di bulan?",
        options: ["Karena gravitasi di bulan sangat ringan", "Karena memakai sepatu pegas", "Karena ditiup angin"],
        answer: 0,
        explanation: "Gravitasi di bulan jauh lebih kecil daripada di bumi sehingga tubuh terasa sangat ringan.",
      },
      {
        question: "Apa yang dibawa Bimo pulang ke bumi?",
        options: ["Kristal cahaya bulan untuk lentera 💎", "Debu hitam pekat", "Batu bata berat"],
        answer: 0,
        explanation: "Bimo membawa kristal bercahaya untuk menerangi meja belajarnya.",
      },
    ],
  },

  // --- SUBKATEGORI C: HEWAN ---
  {
    id: "story_anim_01",
    title: "Lili si Anak Kucing yang Belajar Memanjat",
    category: "animal",
    ageRange: "2-3",
    moralLesson: "Jangan menyerah saat mencoba hal baru, latihan membuat kita semakin mahir.",
    coverEmoji: "🐱🌳🐾",
    pages: [
      {
        pageNum: 1,
        text: "Lili adalah anak kucing berbulu jingga yang lincah. Lili suka mengejar kupu-kupu kuning di taman rumput.",
        illustration: "🐱🦋🌻☀️",
        keywords: ["lili", "kucing", "kupu-kupu"],
      },
      {
        pageNum: 2,
        text: "Lili melihat Ibu Kucing melompat anggun ke dahan pohon jambu. 'Meong! Aku juga ingin memanjat!' kata Lili.",
        illustration: "🐱🌳👩‍🦰🐾",
        keywords: ["memanjat", "pohon", "dahan"],
      },
      {
        pageNum: 3,
        text: "Lili menancapkan cakarnya pada batang pohon. Awalnya kaki Lili terpeleset sedikit, namun Ibu Kucing menyemangati.",
        illustration: "🐾🌳🐱💪",
        keywords: ["cakar", "latihan", "semangat"],
      },
      {
        pageNum: 4,
        text: "Satu, dua, tiga... hap! Lili berhasil duduk di dahan rendah sambil mendengkur gembira. Purr... purr!",
        illustration: "🐱🌿🌸✨🎉",
        keywords: ["berhasil", "gembira", "meong"],
      },
    ],
    questions: [
      {
        question: "Hewan apakah Lili dalam cerita ini?",
        options: ["Anak kucing berbulu jingga 🐱", "Kura-kura air 🐢", "Burung hantu 🦉"],
        answer: 0,
        explanation: "Lili adalah anak kucing jingga yang lucu dan suka belajar.",
      },
      {
        question: "Apa yang ingin dipelajari oleh Lili?",
        options: ["Memanjat dahan pohon 🌳", "Menyelam di danau", "Terbang ke awan"],
        answer: 0,
        explanation: "Lili ingin memanjat dahan pohon seperti induknya.",
      },
      {
        question: "Apa suara kucing saat merasa senang dan nyaman?",
        options: ["Purr... purr... (mendengkur) 😻", "Kwek kwek", "Guk guk"],
        answer: 0,
        explanation: "Kucing mendengkur (purring) ketika merasa nyaman dan bahagia.",
      },
    ],
  },
  {
    id: "story_anim_02",
    title: "Gani si Gajah Cilik dan Belalai Serbaguna",
    category: "animal",
    ageRange: "4-5",
    moralLesson: "Setiap ciptaan memiliki keunikan istimewa untuk saling menolong.",
    coverEmoji: "🐘💧🌴",
    pages: [
      {
        pageNum: 1,
        text: "Gani adalah gajah cilik yang tinggal di tepi padang savana bersama kawanan gajah yang ramah.",
        illustration: "🐘🌾☀️🏞️",
        keywords: ["gani", "gajah", "savana"],
      },
      {
        pageNum: 2,
        text: "Belalai Gani bisa menyedot air jernih dan menyemprotkannya ke udara seperti pancuran pelangi!",
        illustration: "🐘💦🌈⛲",
        keywords: ["belalai", "air", "pancuran"],
      },
      {
        pageNum: 3,
        text: "Saat burung tekukur kecil kehilangan biji buah di celah batu sempit, Gani menggunakan ujung belalainya untuk mengambilkannya.",
        illustration: "🐘🐦🪨🍒",
        keywords: ["menolong", "burung", "biji"],
      },
      {
        pageNum: 4,
        text: "Semua hewan bersorak gembira. Gani bangga memiliki belalai yang bisa membantu sesama sahabat.",
        illustration: "🎉🐘🐦🦒🦓💖",
        keywords: ["bersorak", "bangga", "sahabat"],
      },
    ],
    questions: [
      {
        question: "Bagian tubuh gajah yang panjang dan serbaguna disebut apa?",
        options: ["Belalai 🐘", "Sayap 🕊️", "Sirip 🐟"],
        answer: 0,
        explanation: "Belalai gajah digunakan untuk minum, mandi, mengambil makanan, dan bersalaman.",
      },
      {
        question: "Siapa yang dibantu oleh Gani saat makanannya jatuh ke celah batu?",
        options: ["Burung tekukur kecil 🐦", "Ikan hiu", "Kuda nil"],
        answer: 0,
        explanation: "Gani menggunakan belalainya yang fleksibel untuk menolong burung kecil.",
      },
      {
        question: "Di mana gajah Gani tinggal?",
        options: ["Padang savana yang asri 🌾", "Puncak gunung es kutub ❄️", "Gurun pasir tanpa air 🏜️"],
        answer: 0,
        explanation: "Kawanan gajah hidup berkelompok di padang savana yang memiliki sumber air.",
      },
    ],
  },

  // --- SUBKATEGORI D: SAINS ---
  {
    id: "story_sci_01",
    title: "Dari Mana Asal Butiran Hujan?",
    category: "science",
    ageRange: "6-7",
    moralLesson: "Air di bumi terus berputar dalam siklus alam yang indah dan menjaga kehidupan.",
    coverEmoji: "🌧️☀️💧",
    pages: [
      {
        pageNum: 1,
        text: "Tetesan air kecil bernama Titi sedang berenang santai di permukaan danau yang berkilau.",
        illustration: "💧🌊☀️🌿",
        keywords: ["titi", "danau", "matahari"],
      },
      {
        pageNum: 2,
        text: "Matahari memancarkan sinar hangat. Titi merasa tubuhnya semakin ringan, lalu berubah menjadi uap air yang melayang ke angkasa!",
        illustration: "☀️♨️💧☁️",
        keywords: ["menguap", "hangat", "melayang"],
      },
      {
        pageNum: 3,
        text: "Di langit tinggi, Titi bertemu jutaan uap air lainnya. Bersama-sama mereka berkumpul menjadi gumpalan awan putih yang tebal.",
        illustration: "☁️☁️💨⛅",
        keywords: ["awan", "kumpul", "tebal"],
      },
      {
        pageNum: 4,
        text: "Ketika udara semakin dingin, awan berubah kelabu dan berat. Tik... tik... bunyi hujan turun menyuburkan sawah dan pepohonan!",
        illustration: "🌧️🌱🌳🌾🎉",
        keywords: ["hujan", "dingin", "subur"],
      },
    ],
    questions: [
      {
        question: "Apa yang menyebabkan air di danau menguap ke udara?",
        options: ["Panas dari sinar matahari ☀️", "Tiupan kipas angin", "Es krim meleleh"],
        answer: 0,
        explanation: "Panas matahari menghangatkan air dan mengubahnya menjadi uap air (evaporasi).",
      },
      {
        question: "Apa yang terbentuk saat jutaan uap air berkumpul di angkasa?",
        options: ["Gumpalan awan ☁️", "Pelangi batu", "Planet baru"],
        answer: 0,
        explanation: "Uap air yang mendingin berkondensasi menjadi butiran air kecil membentuk awan.",
      },
      {
        question: "Apa manfaat hujan bagi bumi kita?",
        options: ["Menyuburkan tanaman dan mengisi air danau 🌱", "Membuat jalanan terbakar", "Menghapus matahari"],
        answer: 0,
        explanation: "Hujan menyediakan air bersih yang sangat dibutuhkan oleh tumbuhan, hewan, dan manusia.",
      },
    ],
  },
  {
    id: "story_sci_02",
    title: "Misteri Daun yang Memasak Makanan Sendiri",
    category: "science",
    ageRange: "8-10",
    moralLesson: "Tumbuhan adalah pabrik oksigen bumi yang harus kita jaga dan lestarikan.",
    coverEmoji: "🍃☀️🔬",
    pages: [
      {
        pageNum: 1,
        text: "Bimo mengamati sehelai daun mangga dengan kaca pembesar. Daun itu berwarna hijau segar bersinar.",
        illustration: "🍃🔍🐰🌳",
        keywords: ["daun", "hijau", "klorofil"],
      },
      {
        pageNum: 2,
        text: "Pohon tidak memiliki kompor, tetapi daun mereka adalah 'dapur ajaib' berkat zat hijau bernama klorofil.",
        illustration: "🌿🍲☀️💨",
        keywords: ["dapur", "klorofil", "sinar"],
      },
      {
        pageNum: 3,
        text: "Dengan bantuan cahaya matahari, air dari akar, dan udara sekitar, daun memasak makanan dalam proses fotosintesis.",
        illustration: "☀️➕💧➕🍃➡️🍓",
        keywords: ["fotosintesis", "akar", "makanan"],
      },
      {
        pageNum: 4,
        text: "Hebatnya lagi, saat memasak, daun melepaskan udara segar berupa gas oksigen yang kita hirup setiap detik!",
        illustration: "🌬️✨🌳🧒💖",
        keywords: ["oksigen", "segar", "napas"],
      },
    ],
    questions: [
      {
        question: "Zat pewarna hijau pada daun yang membantu proses memasak disebut apa?",
        options: ["Klorofil 🍃", "Kecap manis", "Cat air"],
        answer: 0,
        explanation: "Klorofil adalah zat hijau daun yang menyerap energi cahaya matahari.",
      },
      {
        question: "Nama proses pembuatan makanan pada tumbuhan hijau adalah...",
        options: ["Fotosintesis ☀️🌱", "Metamorfosis", "Hibernasi"],
        answer: 0,
        explanation: "Fotosintesis menggabungkan air, karbon dioksida, dan cahaya menjadi zat makanan gula.",
      },
      {
        question: "Gas apa yang dihasilkan oleh daun yang sangat berguna bagi pernapasan kita?",
        options: ["Oksigen (O2) 🌬️", "Gas elpiji", "Asap knalpot"],
        answer: 0,
        explanation: "Oksigen yang dihasilkan tumbuhan menyegarkan udara dan menjaga seluruh makhluk hidup tetap bernapas.",
      },
    ],
  },

  // --- SUBKATEGORI E: BUDAYA INDONESIA ---
  {
    id: "story_cul_01",
    title: "Rumah Gadang dengan Atap Tanduk Rusa",
    category: "culture",
    ageRange: "6-7",
    moralLesson: "Keragaman rumah adat di Nusantara menunjukkan kecerdasan arsitektur leluhur bangsa kita.",
    coverEmoji: "🏛️🇮🇩🌾",
    pages: [
      {
        pageNum: 1,
        text: "Adit dan Bimo berwisata ke Minangkabau di Sumatera Barat. Mereka melihat rumah megah dengan atap melengkung indah.",
        illustration: "🏛️⛰️🐰👦🇮🇩",
        keywords: ["rumah gadang", "sumatera barat", "atap"],
      },
      {
        pageNum: 2,
        text: "Bimo takjub melihat ujung atapnya yang runcing seperti tanduk kerbau (gonjong) menunjuk anggun ke langit biru.",
        illustration: "🐂🏛️⛅✨",
        keywords: ["gonjong", "tanduk kerbau", "megah"],
      },
      {
        pageNum: 3,
        text: "Dinding Rumah Gadang dihiasi ukiran kayu penuh warna dengan motif bunga pakis dan daun-daunan alam.",
        illustration: "🎨🪵🌺🌿",
        keywords: ["ukiran", "motif", "warna"],
      },
      {
        pageNum: 4,
        text: "Rumah ini dibangun di atas tiang kayu yang tahan gempa. Nenek menyuguhkan rendang daging yang wangi dan lezat!",
        illustration: "🍲😋👵🏡💖",
        keywords: ["tahan gempa", "rendang", "ramah"],
      },
    ],
    questions: [
      {
        question: "Dari daerah manakah Rumah Gadang berasal?",
        options: ["Minangkabau, Sumatera Barat 🇮🇩", "Kutub Utara ❄️", "Gurun Sahara 🏜️"],
        answer: 0,
        explanation: "Rumah Gadang adalah rumah adat tradisional masyarakat Minangkabau di Sumatera Barat.",
      },
      {
        question: "Bentuk atap Rumah Gadang menyerupai apa?",
        options: ["Tanduk kerbau yang runcing (Gonjong) 🐂", "Bola sepak bulat", "Piring terbang"],
        answer: 0,
        explanation: "Atap gonjong melengkung ke atas terinspirasi dari keberanian tanduk kerbau.",
      },
      {
        question: "Makanan tradisional khas Minang yang sangat terkenal di seluruh dunia adalah...",
        options: ["Rendang yang gurih dan wangi 🍲", "Pizza keju", "Sushi ikan"],
        answer: 0,
        explanation: "Rendang adalah salah satu warisan kuliner terenak di dunia dari Minangkabau.",
      },
    ],
  },
  {
    id: "story_cul_02",
    title: "Alunan Angklung Bambu Merdu Pak Ujang",
    category: "culture",
    ageRange: "6-7",
    moralLesson: "Kebersamaan dan harmoni membuat alunan lagu terdengar indah sempurna.",
    coverEmoji: "🎋🎶🇮🇩",
    pages: [
      {
        pageNum: 1,
        text: "Di Saung Mang Ujang di Jawa Barat, barisan bambu kuning tersusun rapi menjadi alat musik bernama Angklung.",
        illustration: "🎋🎵🏡🌤️",
        keywords: ["angklung", "bambu", "jawa barat"],
      },
      {
        pageNum: 2,
        text: "Pak Ujang membagikan satu angklung untuk setiap anak. 'Satu tabung bambu ini membunyikan nada Do, yang itu Re!'",
        illustration: "🎋👦👧🐰🎶",
        keywords: ["nada", "do re mi", "tabung"],
      },
      {
        pageNum: 3,
        text: "Jika digoyangkan sendiri, nadanya sepi. Namun saat digetarkan bersama-sama, terciptalah lagu merdu 'Halo-Halo Bandung'!",
        illustration: "🎶✨🎋🤝🎉",
        keywords: ["bersama", "harmoni", "lagu"],
      },
      {
        pageNum: 4,
        text: "Angklung mengajarkan kita bahwa persatuan dan kekompakan menciptakan harmoni yang paling indah di dunia.",
        illustration: "🇮🇩💖🎋✨🤝",
        keywords: ["persatuan", "kompak", "indah"],
      },
    ],
    questions: [
      {
        question: "Dari bahan apakah alat musik tradisional Angklung dibuat?",
        options: ["Bambu pilihan 🎋", "Besi baja tebal", "Plastik bekas"],
        answer: 0,
        explanation: "Angklung dibuat dari ruas-ruas bambu yang dikeringkan dan diukir menghasilkan nada murni.",
      },
      {
        question: "Bagaimana cara memainkan alat musik Angklung?",
        options: ["Digoyangkan atau digetarkan dengan tangan 🎋🖐️", "Ditiup dengan mulut", "Dipukul palu keras"],
        answer: 0,
        explanation: "Angklung dibunyikan dengan cara digoyang sehingga benturan badan bambu menghasilkan suara merdu.",
      },
      {
        question: "Pelajaran apa yang diajarkan dari bermain angklung bersama?",
        options: ["Pentingnya kerjasama dan kekompakan 🤝", "Harus berebut paling keras", "Bermain sendiri-sendiri"],
        answer: 0,
        explanation: "Angklung hanya bisa memainkan melodi utuh jika setiap orang bekerjasama membunyikan nadanya tepat waktu.",
      },
    ],
  },

  // --- SUBKATEGORI F: CERITA DUNIA ---
  {
    id: "story_wld_01",
    title: "Festival Lentera Merah di Negeri Tirai Bambu",
    category: "world",
    ageRange: "6-7",
    moralLesson: "Menghargai keragaman perayaan budaya dunia memperluas wawasan dan persaudaraan kita.",
    coverEmoji: "🏮🐉🇨🇳",
    pages: [
      {
        pageNum: 1,
        text: "Malam itu di kota kuno Beijing, ribuan lentera kertas bulat berwarna merah mulai dinyalakan menghiasi jalanan.",
        illustration: "🏮🏮🌃✨🇨🇳",
        keywords: ["lentera", "merah", "beijing"],
      },
      {
        pageNum: 2,
        text: "Warna merah melambangkan harapan baik, keberuntungan, dan kebahagiaan bagi keluarga di awal musim semi.",
        illustration: "🏮👨‍👩‍👧‍👦🌸💖",
        keywords: ["keberuntungan", "keluarga", "musim semi"],
      },
      {
        pageNum: 3,
        text: "Tarian naga panjang berliuk-liuk diiringi tabuhan tambur yang bersemangat: Dong... dong... ceng!",
        illustration: "🐉🥁💥🎉",
        keywords: ["naga", "tambur", "tarian"],
      },
      {
        pageNum: 4,
        text: "Bimo menikmati semangkuk bola-bola ketan manis hangat bernama Yuanxiao bersama teman-teman barunya.",
        illustration: "🥣😋🐰🇨🇳🏮",
        keywords: ["yuanxiao", "ketan manis", "hangat"],
      },
    ],
    questions: [
      {
        question: "Benda hiasan apa yang dipasang memenuhi jalanan saat festival musim semi?",
        options: ["Lentera kertas merah 🏮", "Balon hitam pekat", "Payung basah"],
        answer: 0,
        explanation: "Lentera merah dipasang sebagai simbol cahaya, kehangatan, dan harapan baik.",
      },
      {
        question: "Apa nama tarian tradisional berliuk yang diiringi tabuhan tambur gembira?",
        options: ["Tarian Naga (Barongsai & Dragon Dance) 🐉", "Tarian robot kaku", "Tarian katak lompat"],
        answer: 0,
        explanation: "Tarian naga adalah pertunjukan seni budaya yang sangat megah dan penuh semangat.",
      },
      {
        question: "Apa makanan bulat manis hangat yang dinikmati bersama saat festival lentera?",
        options: ["Bola ketan Yuanxiao 🥣", "Keripik asin", "Burger dingin"],
        answer: 0,
        explanation: "Yuanxiao berbentuk bulat melambangkan kebersamaan dan keutuhan keluarga tercinta.",
      },
    ],
  },
  {
    id: "story_wld_02",
    title: "Menari di Bawah Hujan Kelopak Sakura Jepang",
    category: "world",
    ageRange: "6-7",
    moralLesson: "Keindahan alam selalu mengingatkan kita untuk menikmati saat ini dan menjaga bumi tetap asri.",
    coverEmoji: "🌸🗾🗻",
    pages: [
      {
        pageNum: 1,
        text: "Di tepi danau dekat Gunung Fuji yang berpuncak salju, pohon-pohon sakura mulai bermekaran dengan bunga merah muda yang lembut.",
        illustration: "🌸🗻🌊☀️🗾",
        keywords: ["sakura", "gunung fuji", "jepang"],
      },
      {
        pageNum: 2,
        text: "Keluarga-keluarga menggelar tikar piknik di bawah pohon dalam tradisi Hanami yang penuh sukacita.",
        illustration: "🧺🍱🌸👨‍👩‍👧‍👦",
        keywords: ["hanami", "piknik", "bento"],
      },
      {
        pageNum: 3,
        text: "Angin sepoi-sepoi bertiup perlahan, menerbangkan kelopak bunga merah muda seperti hujan salju musim semi.",
        illustration: "🌸🍃💨✨👧🐰",
        keywords: ["kelopak", "angin", "hujan bunga"],
      },
      {
        pageNum: 4,
        text: "Bimo memungut sehelai kelopak dan meletakkannya di buku catatan kenangan indahnya dari Negeri Matahari Terbit.",
        illustration: "📖🌸🐰💖🎉",
        keywords: ["kenangan", "indah", "buku"],
      },
    ],
    questions: [
      {
        question: "Bunga nasional Jepang yang mekar anggun berwarna merah muda adalah...",
        options: ["Bunga Sakura 🌸", "Bunga Mawar berduri 🌹", "Kaktus padang pasir 🌵"],
        answer: 0,
        explanation: "Bunga Sakura mekar serentak di musim semi menandakan awal musim yang baru dan segar.",
      },
      {
        question: "Tradisi berkumpul dan berpiknik menikmati keindahan bunga sakura disebut...",
        options: ["Hanami 🍱🌸", "Origami kertas", "Sumo"],
        answer: 0,
        explanation: "Hanami secara harfiah berarti melihat bunga dan dinikmati bersama keluarga.",
      },
      {
        question: "Gunung tertinggi dan terkenal di Jepang yang berhiaskan salju di puncaknya bernama...",
        options: ["Gunung Fuji 🗻", "Gunung Everest", "Gunung Merapi"],
        answer: 0,
        explanation: "Gunung Fuji adalah simbol keindahan alam Jepang yang megah dan tenang.",
      },
    ],
  },
];
