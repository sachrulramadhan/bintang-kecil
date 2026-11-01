-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-6-7-001-3', 'code-6-7-001', '10 Soal Logika Loop', '[{"type":"quiz","title":"10 Soal Logika Loop","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-6-7-001-4', 'code-6-7-001', 'Hebat! Kamu Menguasai Konsep Loop!', '[{"type":"text","title":"Hebat! Kamu Menguasai Konsep Loop!","body":"Wah luar biasa! Kamu sudah berpikir seperti seorang programmer profesional sejati!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-01', l.id, m.category_id, 'Manakah perintah yang sama artinya dengan: ➡️ ➡️ ➡️ ?', 'code-6-7-001-latihan-01', 'Manakah perintah yang sama artinya dengan tiga langkah ke kanan?', '[{"type":"question","title":"Manakah perintah yang sama artinya dengan: ➡️ ➡️ ➡️ ?","body":"✔ Ulangi 3x ke Kanan 🔁\n• Ulangi 1x ke Kanan\n• Diam di tempat"},{"type":"text","title":"Petunjuk","body":"Ulangi 3 kali langkah ke kanan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah perintah yang sama artinya dengan: ➡️ ➡️ ➡️ ?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-02', l.id, m.category_id, 'Bila Bimo ingin melompat ke atas 4 kali berturut-turut (⬆️ ⬆️ ⬆️ ⬆️), balok loop mana yang dipakai?', 'code-6-7-001-latihan-02', 'Balok loop mana untuk melompat empat kali ke atas?', '[{"type":"question","title":"Bila Bimo ingin melompat ke atas 4 kali berturut-turut (⬆️ ⬆️ ⬆️ ⬆️), balok loop mana yang dipakai?","body":"✔ Ulangi 4x (⬆️) 🔁\n• Ulangi 2x (⬆️)\n• Ulangi 4x (⬇️)"},{"type":"text","title":"Petunjuk","body":"Ulangi 4 kali ke atas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila Bimo ingin melompat ke atas 4 kali berturut-turut (⬆️ ⬆️ ⬆️ ⬆️), balok loop mana yang dipakai?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-03', l.id, m.category_id, 'Apa keuntungan programmer menggunakan perintah perulangan (loop)?', 'code-6-7-001-latihan-03', 'Apa keuntungan menggunakan perintah perulangan loop?', '[{"type":"question","title":"Apa keuntungan programmer menggunakan perintah perulangan (loop)?","body":"✔ Kode lebih ringkas dan tidak capek mengetik berulang ⚡\n• Membuat komputer menjadi lambat 🐌\n• Tidak ada bedanya 🤷"},{"type":"text","title":"Petunjuk","body":"Kode menjadi lebih rapi, ringkas, dan cepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Apa keuntungan programmer menggunakan perintah perulangan (loop)?"]', '["code-efficiency"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-04', l.id, m.category_id, 'Bila dijalankan: ''Ulangi 2x (Kanan ➡️, Atas ⬆️)'', hasil langkah Bimo adalah...?', 'code-6-7-001-latihan-04', 'Ulangi dua kali kanan dan atas hasilnya bagaimana?', '[{"type":"question","title":"Bila dijalankan: ''Ulangi 2x (Kanan ➡️, Atas ⬆️)'', hasil langkah Bimo adalah...?","body":"✔ ➡️ ⬆️ ➡️ ⬆️\n• ➡️ ➡️ ⬆️ ⬆️\n• ⬆️ ⬆️ ➡️ ➡️"},{"type":"text","title":"Petunjuk","body":"Kanan, Atas, Kanan, Atas."}]', '', '', m.age_min, m.age_max, 'developing', '["Bila dijalankan: ''Ulangi 2x (Kanan ➡️, Atas ⬆️)'', hasil langkah Bimo adalah...?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-05', l.id, m.category_id, 'Ada tangga dengan 5 anak tangga naik. Perintah loop mana yang paling tepat untuk Bimo menaiki tangga?', 'code-6-7-001-latihan-05', 'Perintah loop apa untuk menaiki lima anak tangga?', '[{"type":"question","title":"Ada tangga dengan 5 anak tangga naik. Perintah loop mana yang paling tepat untuk Bimo menaiki tangga?","body":"✔ Ulangi 5x: Naik 1 Langkah 🪜\n• Ulangi 1x: Naik 1 Langkah\n• Ulangi 5x: Turun ke Bawah ⬇️"},{"type":"text","title":"Petunjuk","body":"Ulangi 5 kali melangkah naik."}]', '', '', m.age_min, m.age_max, 'developing', '["Ada tangga dengan 5 anak tangga naik. Perintah loop mana yang paling tepat untuk Bimo menaiki tangga?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-06', l.id, m.category_id, 'Ikon atau lambang apa yang biasa dipakai untuk menandakan perulangan?', 'code-6-7-001-latihan-06', 'Lambang apa yang menandakan perulangan?', '[{"type":"question","title":"Ikon atau lambang apa yang biasa dipakai untuk menandakan perulangan?","body":"✔ 🔁 (Panah Berputar)\n• 🛑 (Tanda Berhenti)\n• ❌ (Tanda Silang)"},{"type":"text","title":"Petunjuk","body":"Dua panah berputar membentuk lingkaran."}]', '', '', m.age_min, m.age_max, 'beginner', '["Ikon atau lambang apa yang biasa dipakai untuk menandakan perulangan?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-07', l.id, m.category_id, 'Perintah: ''Ulangi 3x: Tepuk Tangan 👏''. Berapa kali kita akan bertepuk tangan?', 'code-6-7-001-latihan-07', 'Berapa kali kita tepuk tangan bila diulangi tiga kali?', '[{"type":"question","title":"Perintah: ''Ulangi 3x: Tepuk Tangan 👏''. Berapa kali kita akan bertepuk tangan?","body":"✔ 3 Kali Tepukan 👏\n• 1 Kali Tepukan\n• 5 Kali Tepukan"},{"type":"text","title":"Petunjuk","body":"Satu, dua, tiga kali tepukan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Perintah: ''Ulangi 3x: Tepuk Tangan 👏''. Berapa kali kita akan bertepuk tangan?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-08', l.id, m.category_id, 'Bila perintah perulangan diatur angka 0x: ''Ulangi 0x ke Kanan'', apa yang dilakukan robot Bimo?', 'code-6-7-001-latihan-08', 'Bila diulangi nol kali, apa yang dilakukan robot?', '[{"type":"question","title":"Bila perintah perulangan diatur angka 0x: ''Ulangi 0x ke Kanan'', apa yang dilakukan robot Bimo?","body":"✔ Diam tidak bergerak 🛑\n• Berlari kencang 🏃\n• Melompat tinggi 🚀"},{"type":"text","title":"Petunjuk","body":"Nol artinya tidak melangkah sama sekali."}]', '', '', m.age_min, m.age_max, 'developing', '["Bila perintah perulangan diatur angka 0x: ''Ulangi 0x ke Kanan'', apa yang dilakukan robot Bimo?"]', '["code-efficiency"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-09', l.id, m.category_id, 'Dalam permainan robot, kapan perulangan harus berhenti?', 'code-6-7-001-latihan-09', 'Kapan perulangan robot harus berhenti?', '[{"type":"question","title":"Dalam permainan robot, kapan perulangan harus berhenti?","body":"✔ Saat robot mencapai bendera tujuan 🏁\n• Tidak boleh berhenti selamanya 🔄\n• Saat layar dimatikan saja 💻"},{"type":"text","title":"Petunjuk","body":"Saat robot sudah mencapai tujuan atau mengambil bendera bintang."}]', '', '', m.age_min, m.age_max, 'developing', '["Dalam permainan robot, kapan perulangan harus berhenti?"]', '["looping-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-6-7-001-latihan-10', l.id, m.category_id, 'Manakah cara coding yang paling pintar untuk menulis 10 langkah ke kanan?', 'code-6-7-001-latihan-10', 'Manakah cara coding paling pintar untuk sepuluh langkah ke kanan?', '[{"type":"question","title":"Manakah cara coding yang paling pintar untuk menulis 10 langkah ke kanan?","body":"✔ Ulangi 10x: Kanan ➡️ 🔁\n• Mengetik panah kanan sepuluh kali panjang-panjang ➡️➡️➡️"},{"type":"text","title":"Petunjuk","body":"Gunakan balok perulangan 10x."}]', '', '', m.age_min, m.age_max, 'developing', '["Manakah cara coding yang paling pintar untuk menulis 10 langkah ke kanan?"]', '["code-efficiency"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-6-7-001-3'
   WHERE m.id = 'code-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'eng-6-7-001', 'english', 'Daily Activities & Simple Sentences 🌞', 'Belajar kalimat aktivitas sehari-hari dalam Bahasa Inggris: I wake up, I eat, I play, and I sleep!', 6, 7, 'developing', 10, '["Mengenal kata kerja aktivitas sehari-hari dalam bahasa Inggris","Menyusun kalimat sederhana: Subjek + Kata Kerja"]', '["daily-activities","sentence-building"]', '["eng-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-6-7-001-1', 'eng-6-7-001', 'My Daily Routine', '[{"type":"text","title":"My Daily Routine","body":"I wake up in the morning ☀️! I eat breakfast 🍳! I read books 📚! I sleep at night 🌙!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-6-7-001-2', 'eng-6-7-001', 'Daily Verbs', '[{"type":"text","title":"Daily Verbs","body":"Touch to hear the daily action words!\n🍽️ I Eat 🍽️ — I eat! I eat healthy food!\n⚽ I Play ⚽ — I play! I play with my friends!\n😴 I Sleep 😴 — I sleep! I sleep tight at night!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-6-7-001-3', 'eng-6-7-001', '10 Soal Daily English', '[{"type":"quiz","title":"10 Soal Daily English","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-6-7-001-4', 'eng-6-7-001', 'Awesome! Daily English Master!', '[{"type":"text","title":"Awesome! Daily English Master!","body":"Awesome! You can now speak simple daily English sentences with confidence! Keep shining!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-01', l.id, m.category_id, '''I EAT'' dalam bahasa Indonesia artinya...?', 'eng-6-7-001-latihan-01', 'What does I eat mean in Indonesian?', '[{"type":"question","title":"''I EAT'' dalam bahasa Indonesia artinya...?","body":"✔ Saya Makan 🍽️\n• Saya Minum 🥛\n• Saya Tidur 😴"},{"type":"text","title":"Petunjuk","body":"Aktivitas saat kita menyantap makanan."}]', '', '', m.age_min, m.age_max, 'beginner', '["''I EAT'' dalam bahasa Indonesia artinya...?"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-02', l.id, m.category_id, '''I SLEEP'' artinya dalam bahasa Indonesia adalah...?', 'eng-6-7-001-latihan-02', 'What does I sleep mean in Indonesian?', '[{"type":"question","title":"''I SLEEP'' artinya dalam bahasa Indonesia adalah...?","body":"✔ Saya Tidur 😴\n• Saya Mandi 🚿\n• Saya Berlari 🏃"},{"type":"text","title":"Petunjuk","body":"Aktivitas istirahat di malam hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["''I SLEEP'' artinya dalam bahasa Indonesia adalah...?"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-03', l.id, m.category_id, 'Complete the sentence: ''I ... with my toy car 🚗''', 'eng-6-7-001-latihan-03', 'Complete the sentence: I what with my toy car?', '[{"type":"question","title":"Complete the sentence: ''I ... with my toy car 🚗''","body":"✔ Play (Bermain) 🎮\n• Sleep (Tidur) 🛏️\n• Eat (Makan) 🍞"},{"type":"text","title":"Petunjuk","body":"Saya bermain dengan mobil mainanku."}]', '', '', m.age_min, m.age_max, 'beginner', '["Complete the sentence: ''I ... with my toy car 🚗''"]', '["sentence-building"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-04', l.id, m.category_id, '''I DRINK WATER'' artinya...?', 'eng-6-7-001-latihan-04', 'What does I drink water mean?', '[{"type":"question","title":"''I DRINK WATER'' artinya...?","body":"✔ Saya minum air 💧\n• Saya makan roti 🍞\n• Saya mencuci tangan 🧼"},{"type":"text","title":"Petunjuk","body":"Saya minum air."}]', '', '', m.age_min, m.age_max, 'beginner', '["''I DRINK WATER'' artinya...?"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-05', l.id, m.category_id, 'How do you say ''Saya suka membaca'' in English? 📚', 'eng-6-7-001-latihan-05', 'How do you say Saya suka membaca in English?', '[{"type":"question","title":"How do you say ''Saya suka membaca'' in English? 📚","body":"✔ I like to read 📖\n• I like to sleep 😴\n• I like to swim 🏊"},{"type":"text","title":"Petunjuk","body":"I like to read."}]', '', '', m.age_min, m.age_max, 'developing', '["How do you say ''Saya suka membaca'' in English? 📚"]', '["sentence-building"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-06', l.id, m.category_id, '''BOOK'' in Indonesian is...?', 'eng-6-7-001-latihan-06', 'What is book in Indonesian?', '[{"type":"question","title":"''BOOK'' in Indonesian is...?","body":"✔ Buku 📚\n• Pensil ✏️\n• Meja 🪑"},{"type":"text","title":"Petunjuk","body":"Benda yang kita baca untuk belajar."}]', '', '', m.age_min, m.age_max, 'beginner', '["''BOOK'' in Indonesian is...?"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-07', l.id, m.category_id, 'When do we say ''GOOD AFTERNOON''? ☀️', 'eng-6-7-001-latihan-07', 'When do we say good afternoon?', '[{"type":"question","title":"When do we say ''GOOD AFTERNOON''? ☀️","body":"✔ Siang atau Sore Hari ☀️\n• Tengah Malam 🌃\n• Subuh Hari 🌅"},{"type":"text","title":"Petunjuk","body":"Di siang atau sore hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["When do we say ''GOOD AFTERNOON''? ☀️"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-08', l.id, m.category_id, '''I WASH MY HANDS'' means...?', 'eng-6-7-001-latihan-08', 'What does I wash my hands mean in Indonesian?', '[{"type":"question","title":"''I WASH MY HANDS'' means...?","body":"✔ Saya mencuci tangan 🧼\n• Saya menyisir rambut 💇\n• Saya memakai sepatu 👟"},{"type":"text","title":"Petunjuk","body":"Saya mencuci tangan dengan sabun."}]', '', '', m.age_min, m.age_max, 'beginner', '["''I WASH MY HANDS'' means...?"]', '["daily-activities"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-09', l.id, m.category_id, 'How do you ask ''Siapa namamu?'' in English?', 'eng-6-7-001-latihan-09', 'How do you ask Siapa namamu in English?', '[{"type":"question","title":"How do you ask ''Siapa namamu?'' in English?","body":"✔ What is your name? 🤝\n• How are you? 😊\n• Where do you go? 🚶"},{"type":"text","title":"Petunjuk","body":"What is your name?"}]', '', '', m.age_min, m.age_max, 'developing', '["How do you ask ''Siapa namamu?'' in English?"]', '["sentence-building"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-6-7-001-latihan-10', l.id, m.category_id, 'The answer to ''How are you?'' when you are happy is...?', 'eng-6-7-001-latihan-10', 'What do you answer when someone asks How are you?', '[{"type":"question","title":"The answer to ''How are you?'' when you are happy is...?","body":"✔ I am fine, thank you! 😄\n• My name is Bimo 🐰\n• Goodbye! 👋"},{"type":"text","title":"Petunjuk","body":"I am fine, thank you!"}]', '', '', m.age_min, m.age_max, 'beginner', '["The answer to ''How are you?'' when you are happy is...?"]', '["sentence-building"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-6-7-001-3'
   WHERE m.id = 'eng-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-8-10-001', 'mathematics', 'Perkalian dan Pembagian Ceria (Tabel 1-10)', 'Memahami perkalian sebagai penjumlahan berulang dan pembagian sebagai pengurangan berulang secara seru!', 8, 10, 'developing', 12, '["Menguasai konsep perkalian sebagai penjumlahan berulang","Memahami hubungan antara perkalian dan pembagian","Menyelesaikan operasi hitung perkalian dan pembagian sampai 100"]', '["multiplication","division","math-logic"]', '["math-6-7-002"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-001-1', 'math-8-10-001', 'Perkalian adalah Penjumlahan Berulang', '[{"type":"text","title":"Perkalian adalah Penjumlahan Berulang","body":"3 dikali 4 artinya 4 + 4 + 4 = 12! Dan kebalikannya: 12 dibagi 3 adalah 4! Mudah sekali kan?"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-001-2', 'math-8-10-001', 'Tabel Perkalian Interaktif', '[{"type":"text","title":"Tabel Perkalian Interaktif","body":"Sentuh perkalian ini!\n✖️ 3 x 4 = 12 — Tiga kali empat sama dengan dua belas!\n✖️ 5 x 5 = 25 — Lima kali lima sama dengan dua puluh lima!\n➗ 20 : 4 = 5 — Dua puluh dibagi empat sama dengan lima!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-001-3', 'math-8-10-001', '10 Soal Perkalian & Pembagian', '[{"type":"quiz","title":"10 Soal Perkalian & Pembagian","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-001-4', 'math-8-10-001', 'Kamu Juara Perkalian & Pembagian!', '[{"type":"text","title":"Kamu Juara Perkalian & Pembagian!","body":"Luar biasa hebat! Kamu sudah menguasai perkalian dan pembagian bilangan dasar dengan cepat dan tepat!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-01', l.id, m.category_id, 'Berapakah hasil dari 6 × 7?', 'math-8-10-001-latihan-01', 'Berapa hasil enam dikali tujuh?', '[{"type":"question","title":"Berapakah hasil dari 6 × 7?","body":"✔ 42\n• 36\n• 48\n• 54"},{"type":"text","title":"Petunjuk","body":"6 dikali 7 sama dengan 42."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 6 × 7?"]', '["multiplication"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-02', l.id, m.category_id, 'Berapakah hasil dari 8 × 9?', 'math-8-10-001-latihan-02', 'Berapa hasil delapan dikali sembilan?', '[{"type":"question","title":"Berapakah hasil dari 8 × 9?","body":"✔ 72\n• 64\n• 81\n• 68"},{"type":"text","title":"Petunjuk","body":"8 dikali 10 adalah 80, kurangi 8 jadi 72."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 8 × 9?"]', '["multiplication"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-03', l.id, m.category_id, 'Ada 36 permen dibagikan sama rata kepada 4 anak 🍬. Berapa permen yang didapat setiap anak? (36 ÷ 4 = ...)', 'math-8-10-001-latihan-03', 'Tiga puluh enam dibagi empat sama dengan berapa?', '[{"type":"question","title":"Ada 36 permen dibagikan sama rata kepada 4 anak 🍬. Berapa permen yang didapat setiap anak? (36 ÷ 4 = ...)","body":"✔ 9 Permen\n• 8 Permen\n• 7 Permen\n• 6 Permen"},{"type":"text","title":"Petunjuk","body":"4 dikali berapa yang hasilnya 36? Yaitu 9."}]', '', '', m.age_min, m.age_max, 'developing', '["Ada 36 permen dibagikan sama rata kepada 4 anak 🍬. Berapa permen yang didapat setiap anak? (36 ÷ 4 = ...)"]', '["division"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-04', l.id, m.category_id, 'Berapakah hasil dari 45 ÷ 5?', 'math-8-10-001-latihan-04', 'Empat puluh lima dibagi lima sama dengan berapa?', '[{"type":"question","title":"Berapakah hasil dari 45 ÷ 5?","body":"✔ 9\n• 8\n• 7\n• 6"},{"type":"text","title":"Petunjuk","body":"5 dikali 9 adalah 45."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapakah hasil dari 45 ÷ 5?"]', '["division"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-05', l.id, m.category_id, 'Bimo membeli 5 kotak donat 🍩. Setiap kotak berisi 6 donat. Berapa total seluruh donat Bimo? (5 × 6 = ...)', 'math-8-10-001-latihan-05', 'Lima dikali enam sama dengan berapa?', '[{"type":"question","title":"Bimo membeli 5 kotak donat 🍩. Setiap kotak berisi 6 donat. Berapa total seluruh donat Bimo? (5 × 6 = ...)","body":"✔ 30 Donat\n• 25 Donat\n• 35 Donat\n• 28 Donat"},{"type":"text","title":"Petunjuk","body":"5 dikali 6 sama dengan 30."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo membeli 5 kotak donat 🍩. Setiap kotak berisi 6 donat. Berapa total seluruh donat Bimo? (5 × 6 = ...)"]', '["multiplication"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-06', l.id, m.category_id, 'Berapakah hasil dari 7 × 8?', 'math-8-10-001-latihan-06', 'Berapa hasil tujuh dikali delapan?', '[{"type":"question","title":"Berapakah hasil dari 7 × 8?","body":"✔ 56\n• 54\n• 64\n• 49"},{"type":"text","title":"Petunjuk","body":"Hasilnya adalah 56."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 7 × 8?"]', '["multiplication"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-07', l.id, m.category_id, 'Bila sebuah bilangan dikalikan dengan angka 0, hasilnya selalu...?', 'math-8-10-001-latihan-07', 'Bila suatu bilangan dikali nol, hasilnya selalu apa?', '[{"type":"question","title":"Bila sebuah bilangan dikalikan dengan angka 0, hasilnya selalu...?","body":"✔ 0 (Nol)\n• 1 (Satu)\n• Bilangan itu sendiri\n• 100"},{"type":"text","title":"Petunjuk","body":"Apapun yang dikalikan nol hasilnya tetap nol."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila sebuah bilangan dikalikan dengan angka 0, hasilnya selalu...?"]', '["math-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-08', l.id, m.category_id, 'Berapakah hasil dari 64 ÷ 8?', 'math-8-10-001-latihan-08', 'Berapa hasil enam puluh empat dibagi delapan?', '[{"type":"question","title":"Berapakah hasil dari 64 ÷ 8?","body":"✔ 8\n• 7\n• 9\n• 6"},{"type":"text","title":"Petunjuk","body":"8 dikali 8 adalah 64."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 64 ÷ 8?"]', '["division"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-09', l.id, m.category_id, 'Berapakah 9 × 9?', 'math-8-10-001-latihan-09', 'Berapa hasil sembilan dikali sembilan?', '[{"type":"question","title":"Berapakah 9 × 9?","body":"✔ 81\n• 79\n• 88\n• 90"},{"type":"text","title":"Petunjuk","body":"Sembilan kuadrat adalah 81."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah 9 × 9?"]', '["multiplication"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-001-latihan-10', l.id, m.category_id, 'Ibu membagikan 50 kue kepada 10 piring secara merata. Berapa kue pada setiap piring? (50 ÷ 10 = ...)', 'math-8-10-001-latihan-10', 'Lima puluh dibagi sepuluh sama dengan berapa?', '[{"type":"question","title":"Ibu membagikan 50 kue kepada 10 piring secara merata. Berapa kue pada setiap piring? (50 ÷ 10 = ...)","body":"✔ 5 Kue\n• 4 Kue\n• 10 Kue\n• 6 Kue"},{"type":"text","title":"Petunjuk","body":"50 dibagi 10 sama dengan 5."}]', '', '', m.age_min, m.age_max, 'beginner', '["Ibu membagikan 50 kue kepada 10 piring secara merata. Berapa kue pada setiap piring? (50 ÷ 10 = ...)"]', '["division"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-001-3'
   WHERE m.id = 'math-8-10-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-8-10-002', 'mathematics', 'Mengenal Pecahan Sederhana (1/2, 1/3, 1/4)', 'Memahami pecahan dari sepotong pizza, kue cokelat, dan semangka segar bersama Bimo!', 8, 10, 'developing', 12, '["Mengenal konsep pembilang dan penyebut pada pecahan","Membandingkan nilai pecahan sederhana (1/2 > 1/4)"]', '["fractions-basics","visual-math"]', '["math-8-10-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-002-1', 'math-8-10-002', 'Berbagi Pizza Pecahan', '[{"type":"text","title":"Berbagi Pizza Pecahan","body":"Satu pizza dipotong 2 bagian sama besar, satu bagiannya bernilai 1/2 (setengah)! Angka 1 di atas adalah pembilang, angka 2 di bawah adalah penyebut!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-002-2', 'math-8-10-002', 'Sentuh Pecahan', '[{"type":"text","title":"Sentuh Pecahan","body":"Sentuh pecahan pizza berikut!\n🍕 1/2 Pizza 🍕 — Satu per dua atau setengah bagian!\n🍕 1/4 Pizza 🍕 — Satu per empat atau seperempat bagian!\n🍕 3/4 Pizza 🍕 — Tiga per empat bagian!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-002-3', 'math-8-10-002', '10 Soal Pecahan Sederhana', '[{"type":"quiz","title":"10 Soal Pecahan Sederhana","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-8-10-002-4', 'math-8-10-002', 'Hebat! Kamu Menguasai Pecahan!', '[{"type":"text","title":"Hebat! Kamu Menguasai Pecahan!","body":"Wah luar biasa! Sekarang kamu sudah paham betul konsep pembilang, penyebut, dan pecahan sederhana!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-01', l.id, m.category_id, 'Pada pecahan 1/2, angka 1 yang berada di atas disebut sebagai...?', 'math-8-10-002-latihan-01', 'Angka yang berada di bagian atas pecahan disebut apa?', '[{"type":"question","title":"Pada pecahan 1/2, angka 1 yang berada di atas disebut sebagai...?","body":"✔ Pembilang\n• Penyebut\n• Pembagi\n• Hasil"},{"type":"text","title":"Petunjuk","body":"Bagian atas disebut pembilang, bagian bawah disebut penyebut."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pada pecahan 1/2, angka 1 yang berada di atas disebut sebagai...?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-02', l.id, m.category_id, 'Sebuah kue dipotong menjadi 4 bagian sama besar. Bimo memakan 1 potong. Berapa bagian kue yang dimakan Bimo? 🍰', 'math-8-10-002-latihan-02', 'Satu potong dari empat potong kue bernilai pecahan berapa?', '[{"type":"question","title":"Sebuah kue dipotong menjadi 4 bagian sama besar. Bimo memakan 1 potong. Berapa bagian kue yang dimakan Bimo? 🍰","body":"✔ 1/4 (Seperempat)\n• 1/2 (Setengah)\n• 1/3 (Sepertiga)\n• 3/4"},{"type":"text","title":"Petunjuk","body":"Satu bagian dari empat bagian sama dengan 1/4 (seperempat)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Sebuah kue dipotong menjadi 4 bagian sama besar. Bimo memakan 1 potong. Berapa bagian kue yang dimakan Bimo? 🍰"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-03', l.id, m.category_id, 'Manakah potongan yang lebih BESAR: 1/2 pizza atau 1/4 pizza? 🍕', 'math-8-10-002-latihan-03', 'Mana yang lebih besar antara setengah pizza dan seperempat pizza?', '[{"type":"question","title":"Manakah potongan yang lebih BESAR: 1/2 pizza atau 1/4 pizza? 🍕","body":"✔ 1/2 Pizza (Lebih Besar) 🍕\n• 1/4 Pizza\n• Keduanya sama besar"},{"type":"text","title":"Petunjuk","body":"Setengah pizza lebih besar daripada seperempat pizza."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah potongan yang lebih BESAR: 1/2 pizza atau 1/4 pizza? 🍕"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-04', l.id, m.category_id, 'Pecahan 2/4 sama nilainya dengan pecahan sederhana...?', 'math-8-10-002-latihan-04', 'Dua per empat senilai dengan pecahan apa?', '[{"type":"question","title":"Pecahan 2/4 sama nilainya dengan pecahan sederhana...?","body":"✔ 1/2\n• 1/3\n• 1/4\n• 3/4"},{"type":"text","title":"Petunjuk","body":"2 dari 4 bagian sama dengan setengah (1/2)."}]', '', '', m.age_min, m.age_max, 'developing', '["Pecahan 2/4 sama nilainya dengan pecahan sederhana...?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-05', l.id, m.category_id, 'Ibu membagi semangka utuh menjadi 8 potong sama rata. Kakak memakan 3 potong. Bagian yang dimakan kakak adalah...?', 'math-8-10-002-latihan-05', 'Tiga potong dari delapan potong semangka bernilai berapa?', '[{"type":"question","title":"Ibu membagi semangka utuh menjadi 8 potong sama rata. Kakak memakan 3 potong. Bagian yang dimakan kakak adalah...?","body":"✔ 3/8\n• 5/8\n• 3/4\n• 1/8"},{"type":"text","title":"Petunjuk","body":"Pembilang 3, penyebut 8 = 3/8."}]', '', '', m.age_min, m.age_max, 'developing', '["Ibu membagi semangka utuh menjadi 8 potong sama rata. Kakak memakan 3 potong. Bagian yang dimakan kakak adalah...?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-06', l.id, m.category_id, 'Berapakah hasil dari 1/4 + 2/4?', 'math-8-10-002-latihan-06', 'Satu per empat ditambah dua per empat sama dengan berapa?', '[{"type":"question","title":"Berapakah hasil dari 1/4 + 2/4?","body":"✔ 3/4\n• 2/4\n• 3/8\n• 1/2"},{"type":"text","title":"Petunjuk","body":"Karena penyebutnya sama-sama 4, jumlahkan pembilangnya: 1 + 2 = 3."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 1/4 + 2/4?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-07', l.id, m.category_id, 'Berapakah hasil dari 4/5 - 1/5?', 'math-8-10-002-latihan-07', 'Empat per lima dikurangi satu per lima sama dengan berapa?', '[{"type":"question","title":"Berapakah hasil dari 4/5 - 1/5?","body":"✔ 3/5\n• 2/5\n• 1/5\n• 4/5"},{"type":"text","title":"Petunjuk","body":"4 dikurangi 1 adalah 3, penyebut tetap 5."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 4/5 - 1/5?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-08', l.id, m.category_id, 'Pecahan yang bernilai SATU UTUH bila penyebutnya 4 adalah...?', 'math-8-10-002-latihan-08', 'Pecahan apa yang bernilai satu utuh dengan penyebut empat?', '[{"type":"question","title":"Pecahan yang bernilai SATU UTUH bila penyebutnya 4 adalah...?","body":"✔ 4/4\n• 1/4\n• 3/4\n• 2/4"},{"type":"text","title":"Petunjuk","body":"Pembilang dan penyebut bernilai sama: 4/4 = 1."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pecahan yang bernilai SATU UTUH bila penyebutnya 4 adalah...?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-09', l.id, m.category_id, 'Manakah pecahan yang nilainya paling KECIL?', 'math-8-10-002-latihan-09', 'Manakah pecahan yang nilainya paling kecil?', '[{"type":"question","title":"Manakah pecahan yang nilainya paling KECIL?","body":"✔ 1/8\n• 1/2\n• 1/4\n• 1/3"},{"type":"text","title":"Petunjuk","body":"Makin banyak pembaginya (penyebut makin besar), nilai potongannya makin kecil."}]', '', '', m.age_min, m.age_max, 'developing', '["Manakah pecahan yang nilainya paling KECIL?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-8-10-002-latihan-10', l.id, m.category_id, 'Bimo minum setengah gelas susu 🥛. Kalimat matematika pecahannya adalah...?', 'math-8-10-002-latihan-10', 'Setengah gelas susu dituliskan dalam pecahan bagaimana?', '[{"type":"question","title":"Bimo minum setengah gelas susu 🥛. Kalimat matematika pecahannya adalah...?","body":"✔ 1/2 Gelas\n• 1/4 Gelas\n• 2/1 Gelas\n• 3/4 Gelas"},{"type":"text","title":"Petunjuk","body":"Satu per dua (1/2)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo minum setengah gelas susu 🥛. Kalimat matematika pecahannya adalah...?"]', '["fractions-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-8-10-002-3'
   WHERE m.id = 'math-8-10-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'sci-8-10-001', 'science', 'Menjelajahi Tata Surya & 8 Planet Ajaib 🪐', 'Mengenal matahari sebagai pusat tata surya dan kedelapan planet yang mengelilinginya!', 8, 10, 'developing', 12, '["Menyebutkan 8 planet dalam tata surya secara berurutan","Memahami ciri khas planet Bumi, Mars, Jupiter, dan Saturnus"]', '["solar-system","astronomy-basics"]', '["sci-6-7-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-8-10-001-1', 'sci-8-10-001', 'Matahari dan 8 Sahabat Planet', '[{"type":"text","title":"Matahari dan 8 Sahabat Planet","body":"Matahari ☀️ adalah bintang raksasa di pusat tata surya! Planet-planetnya: Merkurius, Venus, Bumi kita 🌍, Mars merah, Jupiter raksasa, Saturnus bercincin 🪐, Uranus, dan Neptunus!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-8-10-001-2', 'sci-8-10-001', 'Sentuh Planet', '[{"type":"text","title":"Sentuh Planet","body":"Sentuh planet-planet ini!\n🌍 Bumi 🌍 — Bumi adalah rumah kita dengan air dan oksigen kehidupan!\n🔴 Mars 🔴 — Mars disebut planet merah karena kaya akan karat besi!\n🪐 Saturnus 🪐 — Saturnus terkenal dengan cincin es dan debu yang sangat indah!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-8-10-001-3', 'sci-8-10-001', '10 Soal Tata Surya', '[{"type":"quiz","title":"10 Soal Tata Surya","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-8-10-001-4', 'sci-8-10-001', 'Astronot Cilik Penjelajah Semesta!', '[{"type":"text","title":"Astronot Cilik Penjelajah Semesta!","body":"Hebat sekali! Sekarang kamu sudah hafal delapan planet di tata surya kita! Teruslah bermimpi setinggi bintang di langit!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-01', l.id, m.category_id, 'Bintang besar yang menjadi pusat dari sistem tata surya kita adalah...? ☀️', 'sci-8-10-001-latihan-01', 'Apa nama bintang di pusat tata surya kita?', '[{"type":"question","title":"Bintang besar yang menjadi pusat dari sistem tata surya kita adalah...? ☀️","body":"✔ Matahari ☀️\n• Bulan 🌙\n• Bintang Kejora ⭐\n• Komet ☄️"},{"type":"text","title":"Petunjuk","body":"Matahari memancarkan cahaya dan panas ke seluruh planet."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bintang besar yang menjadi pusat dari sistem tata surya kita adalah...? ☀️"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-02', l.id, m.category_id, 'Planet tempat kita hidup dan memiliki air serta udara untuk bernapas adalah...? 🌍', 'sci-8-10-001-latihan-02', 'Planet tempat kita tinggal bernama apa?', '[{"type":"question","title":"Planet tempat kita hidup dan memiliki air serta udara untuk bernapas adalah...? 🌍","body":"✔ Bumi (Earth) 🌍\n• Mars 🔴\n• Merkurius ⚪\n• Venus 🟡"},{"type":"text","title":"Petunjuk","body":"Planet Bumi yang berwarna biru dan hijau."}]', '', '', m.age_min, m.age_max, 'beginner', '["Planet tempat kita hidup dan memiliki air serta udara untuk bernapas adalah...? 🌍"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-03', l.id, m.category_id, 'Planet yang terkenal dengan sebutan ''Planet Merah'' adalah...? 🔴', 'sci-8-10-001-latihan-03', 'Planet apa yang dijuluki Planet Merah?', '[{"type":"question","title":"Planet yang terkenal dengan sebutan ''Planet Merah'' adalah...? 🔴","body":"✔ Mars 🔴\n• Jupiter 🪐\n• Saturnus 💫\n• Neptunus 🔵"},{"type":"text","title":"Petunjuk","body":"Planet keempat dari matahari, tetangga Bumi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Planet yang terkenal dengan sebutan ''Planet Merah'' adalah...? 🔴"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-04', l.id, m.category_id, 'Planet manakah yang merupakan planet TERBESAR di tata surya kita?', 'sci-8-10-001-latihan-04', 'Planet apa yang ukurannya paling besar di tata surya?', '[{"type":"question","title":"Planet manakah yang merupakan planet TERBESAR di tata surya kita?","body":"✔ Jupiter 🪐\n• Bumi 🌍\n• Merkurius ⚪\n• Mars 🔴"},{"type":"text","title":"Petunjuk","body":"Planet raksasa gas dengan badai bintik merah besar."}]', '', '', m.age_min, m.age_max, 'developing', '["Planet manakah yang merupakan planet TERBESAR di tata surya kita?"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-05', l.id, m.category_id, 'Planet yang memiliki cincin es dan bebatuan paling indah dan jelas terlihat adalah...? 🪐', 'sci-8-10-001-latihan-05', 'Planet apa yang terkenal dengan cincinnya yang indah?', '[{"type":"question","title":"Planet yang memiliki cincin es dan bebatuan paling indah dan jelas terlihat adalah...? 🪐","body":"✔ Saturnus 🪐\n• Uranus 🔵\n• Merkurius ⚪\n• Venus 🟡"},{"type":"text","title":"Petunjuk","body":"Saturnus adalah planet bercincin megah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Planet yang memiliki cincin es dan bebatuan paling indah dan jelas terlihat adalah...? 🪐"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-06', l.id, m.category_id, 'Planet yang posisinya paling DEKAT dengan Matahari adalah...?', 'sci-8-10-001-latihan-06', 'Planet apa yang letaknya paling dekat dengan matahari?', '[{"type":"question","title":"Planet yang posisinya paling DEKAT dengan Matahari adalah...?","body":"✔ Merkurius\n• Venus\n• Bumi\n• Mars"},{"type":"text","title":"Petunjuk","body":"Planet terkecil dan terdekat ke matahari: Merkurius."}]', '', '', m.age_min, m.age_max, 'developing', '["Planet yang posisinya paling DEKAT dengan Matahari adalah...?"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-07', l.id, m.category_id, 'Berapa jumlah planet resmi yang mengelilingi matahari dalam tata surya kita?', 'sci-8-10-001-latihan-07', 'Ada berapa jumlah planet resmi di tata surya kita?', '[{"type":"question","title":"Berapa jumlah planet resmi yang mengelilingi matahari dalam tata surya kita?","body":"✔ 8 Planet\n• 9 Planet\n• 7 Planet\n• 10 Planet"},{"type":"text","title":"Petunjuk","body":"Delapan planet utama."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa jumlah planet resmi yang mengelilingi matahari dalam tata surya kita?"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-08', l.id, m.category_id, 'Benda langit alami yang mengelilingi planet Bumi kita setiap malam adalah...? 🌙', 'sci-8-10-001-latihan-08', 'Apa nama satelit alami yang mengelilingi bumi?', '[{"type":"question","title":"Benda langit alami yang mengelilingi planet Bumi kita setiap malam adalah...? 🌙","body":"✔ Bulan (Moon) 🌙\n• Matahari ☀️\n• Komet Halley ☄️\n• Meteor 🌠"},{"type":"text","title":"Petunjuk","body":"Bulan adalah satelit alami Bumi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Benda langit alami yang mengelilingi planet Bumi kita setiap malam adalah...? 🌙"]', '["astronomy-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-09', l.id, m.category_id, 'Peristiwa perputaran Bumi pada porosnya yang menyebabkan terjadinya siang dan malam disebut...?', 'sci-8-10-001-latihan-09', 'Perputaran bumi pada porosnya disebut apa?', '[{"type":"question","title":"Peristiwa perputaran Bumi pada porosnya yang menyebabkan terjadinya siang dan malam disebut...?","body":"✔ Rotasi Bumi 🌍🔄\n• Revolusi Bumi 🛸\n• Gerhana Matahari 🌑\n• Gravitasi 🧲"},{"type":"text","title":"Petunjuk","body":"Rotasi bumi berlangsung sekitar 24 jam sehari."}]', '', '', m.age_min, m.age_max, 'developing', '["Peristiwa perputaran Bumi pada porosnya yang menyebabkan terjadinya siang dan malam disebut...?"]', '["astronomy-basics"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-8-10-001-latihan-10', l.id, m.category_id, 'Planet terluar dan paling dingin yang berwarna biru es di tata surya adalah...?', 'sci-8-10-001-latihan-10', 'Planet terluar berwarna biru es bernama apa?', '[{"type":"question","title":"Planet terluar dan paling dingin yang berwarna biru es di tata surya adalah...?","body":"✔ Neptunus 🔵\n• Mars 🔴\n• Venus 🟡\n• Jupiter 🪐"},{"type":"text","title":"Petunjuk","body":"Neptunus, planet kedelapan."}]', '', '', m.age_min, m.age_max, 'developing', '["Planet terluar dan paling dingin yang berwarna biru es di tata surya adalah...?"]', '["solar-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-8-10-001-3'
   WHERE m.id = 'sci-8-10-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'code-8-10-001', 'coding', 'Kondisi Logika If-Else & Pengambilan Keputusan 🤖', 'Belajar membuat program yang bisa mengambil keputusan cerdas: ''JIKA lapar MAKA makan, JIKA TIDAK maka bermain''!', 8, 10, 'developing', 12, '["Memahami konsep kondisi Benar (True) dan Salah (False)","Menyusun logika Jika-Maka (If-Else) dalam kehidupan sehari-hari dan kode"]', '["conditional-logic","boolean-logic"]', '["code-6-7-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-8-10-001-1', 'code-8-10-001', 'Logika Jika - Maka (If - Else)', '[{"type":"text","title":"Logika Jika - Maka (If - Else)","body":"JIKA hari hujan (IF), MAKA bawa payung ☂️! JIKA TIDAK hujan (ELSE), MAKA pakai kacamata hitam 😎! Itu adalah cara komputer berpikir logis!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-8-10-001-2', 'code-8-10-001', 'Simulasi Kondisi', '[{"type":"text","title":"Simulasi Kondisi","body":"Sentuh kondisi di bawah!\n🌧️ IF Hujan = True — Kondisi benar! Bawa payung!\n🪫 IF Baterai Lemah — Isi daya robot sekarang!\n✅ ELSE Aman — Kondisi normal, teruskan bermain!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-8-10-001-3', 'code-8-10-001', '10 Soal Logika If-Else', '[{"type":"quiz","title":"10 Soal Logika If-Else","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-8-10-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-8-10-001-4', 'code-8-10-001', 'Pemikir Logis yang Hebat!', '[{"type":"text","title":"Pemikir Logis yang Hebat!","body":"Keren sekali! Sekarang kamu mengerti bagaimana komputer dan kecerdasan buatan mengambil keputusan logis!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-01', l.id, m.category_id, 'Kondisi: JIKA lampu lalu lintas berwarna MERAH 🔴, MAKA mobil harus...?', 'code-8-10-001-latihan-01', 'Jika lampu merah, maka mobil harus apa?', '[{"type":"question","title":"Kondisi: JIKA lampu lalu lintas berwarna MERAH 🔴, MAKA mobil harus...?","body":"✔ Berhenti 🛑\n• Melaju kencang 🚗\n• Belok putar arah 🔄\n• Membunyikan klakson saja 📢"},{"type":"text","title":"Petunjuk","body":"Warna merah artinya berhenti."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kondisi: JIKA lampu lalu lintas berwarna MERAH 🔴, MAKA mobil harus...?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-02', l.id, m.category_id, 'Kondisi: JIKA nilai kuis >= 70 MAKA ''Lulus'', JIKA TIDAK MAKA ''Remedial''. Bila Bimo mendapat nilai 85, apa hasilnya?', 'code-8-10-001-latihan-02', 'Bila syarat lulus 70 dan Bimo dapat 85, apa hasilnya?', '[{"type":"question","title":"Kondisi: JIKA nilai kuis >= 70 MAKA ''Lulus'', JIKA TIDAK MAKA ''Remedial''. Bila Bimo mendapat nilai 85, apa hasilnya?","body":"✔ Lulus 🎉\n• Remedial 📚\n• Tidak ada status\n• Error ⚠️"},{"type":"text","title":"Petunjuk","body":"85 lebih besar dari 70, jadi kondisi True (Benar)."}]', '', '', m.age_min, m.age_max, 'developing', '["Kondisi: JIKA nilai kuis >= 70 MAKA ''Lulus'', JIKA TIDAK MAKA ''Remedial''. Bila Bimo mendapat nilai 85, apa hasilnya?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-03', l.id, m.category_id, 'Dalam coding komputer, nilai kebenaran hanya ada dua, yaitu...?', 'code-8-10-001-latihan-03', 'Apa dua nilai kebenaran dalam logika boolean?', '[{"type":"question","title":"Dalam coding komputer, nilai kebenaran hanya ada dua, yaitu...?","body":"✔ Benar (True) dan Salah (False) ✅❌\n• Besar dan Kecil 🐘🐜\n• Hitam dan Putih ⬛⬜\n• Cepat dan Lambat 🏎️"},{"type":"text","title":"Petunjuk","body":"Benar (True) dan Salah (False)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Dalam coding komputer, nilai kebenaran hanya ada dua, yaitu...?"]', '["boolean-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-04', l.id, m.category_id, 'Program pintu otomatis: JIKA ada orang mendekat (Sensor = True) MAKA pintu terbuka. Kapan pintu akan tertutup?', 'code-8-10-001-latihan-04', 'Kapan pintu otomatis akan tertutup?', '[{"type":"question","title":"Program pintu otomatis: JIKA ada orang mendekat (Sensor = True) MAKA pintu terbuka. Kapan pintu akan tertutup?","body":"✔ Saat tidak ada orang mendekat (ELSE) 🚶‍♂️\n• Pintu terbuka selamanya\n• Saat listrik mati saja\n• Pintu tidak bisa tertutup"},{"type":"text","title":"Petunjuk","body":"Saat tidak ada orang yang mendekat (Sensor = False / ELSE)."}]', '', '', m.age_min, m.age_max, 'developing', '["Program pintu otomatis: JIKA ada orang mendekat (Sensor = True) MAKA pintu terbuka. Kapan pintu akan tertutup?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-05', l.id, m.category_id, 'Pernyataan matematika: ''8 > 5'' (Delapan lebih besar dari lima). Apakah pernyataan ini True atau False?', 'code-8-10-001-latihan-05', 'Apakah delapan lebih besar dari lima itu benar atau salah?', '[{"type":"question","title":"Pernyataan matematika: ''8 > 5'' (Delapan lebih besar dari lima). Apakah pernyataan ini True atau False?","body":"✔ True (Benar) ✅\n• False (Salah) ❌"},{"type":"text","title":"Petunjuk","body":"Delapan memang lebih besar dari lima."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pernyataan matematika: ''8 > 5'' (Delapan lebih besar dari lima). Apakah pernyataan ini True atau False?"]', '["boolean-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';
