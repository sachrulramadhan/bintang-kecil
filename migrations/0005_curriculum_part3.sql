-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-05', l.id, m.category_id, 'Untuk melangkah 2 kali ke kanan, urutan perintah yang benar adalah...?', 'code-4-5-001-latihan-05', 'Urutan perintah melangkah dua kali ke kanan adalah?', '[{"type":"question","title":"Untuk melangkah 2 kali ke kanan, urutan perintah yang benar adalah...?","body":"✔ ➡️ ➡️\n• ➡️ ⬅️\n• ⬆️ ⬇️"},{"type":"text","title":"Petunjuk","body":"Dua buah panah kanan berturut-turut."}]', '', '', m.age_min, m.age_max, 'beginner', '["Untuk melangkah 2 kali ke kanan, urutan perintah yang benar adalah...?"]', '["spatial-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-06', l.id, m.category_id, 'Wortel ada 1 langkah ke atas ⬆️ dan 1 langkah ke kanan ➡️. Urutan perintahnya adalah...?', 'code-4-5-001-latihan-06', 'Satu langkah ke atas lalu satu ke kanan, urutannya bagaimana?', '[{"type":"question","title":"Wortel ada 1 langkah ke atas ⬆️ dan 1 langkah ke kanan ➡️. Urutan perintahnya adalah...?","body":"✔ ⬆️ lalu ➡️\n• ⬇️ lalu ⬅️\n• ⬅️ lalu ⬅️"},{"type":"text","title":"Petunjuk","body":"Panah atas dulu, lalu panah kanan."}]', '', '', m.age_min, m.age_max, 'developing', '["Wortel ada 1 langkah ke atas ⬆️ dan 1 langkah ke kanan ➡️. Urutan perintahnya adalah...?"]', '["spatial-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-07', l.id, m.category_id, 'Dalam coding komputer, susunan urutan langkah teratur disebut...?', 'code-4-5-001-latihan-07', 'Susunan urutan langkah teratur disebut apa?', '[{"type":"question","title":"Dalam coding komputer, susunan urutan langkah teratur disebut...?","body":"✔ Algoritma 🤖\n• Menggambar 🎨\n• Bernyanyi 🎵"},{"type":"text","title":"Petunjuk","body":"Kata yang diawali huruf A: Algoritma."}]', '', '', m.age_min, m.age_max, 'developing', '["Dalam coding komputer, susunan urutan langkah teratur disebut...?"]', '["spatial-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-08', l.id, m.category_id, 'Bila Bimo melangkah ke kanan ➡️ lalu ke kiri ⬅️, Bimo berada di...?', 'code-4-5-001-latihan-08', 'Maju ke kanan lalu mundur ke kiri, posisinya di mana?', '[{"type":"question","title":"Bila Bimo melangkah ke kanan ➡️ lalu ke kiri ⬅️, Bimo berada di...?","body":"✔ Kembali ke tempat semula 📍\n• Sangat jauh 🚀\n• Di atas pohon 🌳"},{"type":"text","title":"Petunjuk","body":"Kembali lagi ke tempat semula."}]', '', '', m.age_min, m.age_max, 'developing', '["Bila Bimo melangkah ke kanan ➡️ lalu ke kiri ⬅️, Bimo berada di...?"]', '["spatial-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-09', l.id, m.category_id, 'Bimo ingin mengambil 3 bintang berturut-turut di baris atas. Perintah apa yang dibutuhkan?', 'code-4-5-001-latihan-09', 'Mengambil tiga bintang ke atas berturut-turut butuh perintah apa?', '[{"type":"question","title":"Bimo ingin mengambil 3 bintang berturut-turut di baris atas. Perintah apa yang dibutuhkan?","body":"✔ ⬆️ ⬆️ ⬆️\n• ⬇️ ⬇️ ⬇️\n• ➡️ ➡️ ➡️"},{"type":"text","title":"Petunjuk","body":"Tiga langkah ke atas."}]', '', '', m.age_min, m.age_max, 'developing', '["Bimo ingin mengambil 3 bintang berturut-turut di baris atas. Perintah apa yang dibutuhkan?"]', '["directional-coding"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-10', l.id, m.category_id, 'Apakah komputer bisa bergerak sendiri tanpa ada perintah dari kita?', 'code-4-5-001-latihan-10', 'Apakah robot dan komputer bisa jalan sendiri tanpa instruksi?', '[{"type":"question","title":"Apakah komputer bisa bergerak sendiri tanpa ada perintah dari kita?","body":"✔ Tidak, komputer butuh perintah kita 💻\n• Bisa jalan sendiri tanpa perintah 🚶‍♂️"},{"type":"text","title":"Petunjuk","body":"Komputer butuh programmer cilik seperti kamu untuk memberi instruksi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apakah komputer bisa bergerak sendiri tanpa ada perintah dari kita?"]', '["spatial-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'eng-4-5-001', 'english', 'Animal Friends & Hello Song 🐱🐶', 'Mengenal nama-nama hewan lucu dalam Bahasa Inggris: Cat, Dog, Bird, Fish, dan Rabbit!', 4, 5, 'developing', 8, '["Mengenal kosakata hewan: Cat, Dog, Bird, Fish, Rabbit","Menyapa dan bernyanyi dalam bahasa Inggris sederhana"]', '["english-animals","english-listening"]', '["eng-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-4-5-001-1', 'eng-4-5-001', 'Hello Animal Friends!', '[{"type":"text","title":"Hello Animal Friends!","body":"Cat is Kucing 🐱! Dog is Anjing 🐶! Bird is Burung 🐦! Fish is Ikan 🐟! Rabbit is Kelinci 🐰 like Bimo!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-4-5-001-2', 'eng-4-5-001', 'Animal Sounds in English', '[{"type":"text","title":"Animal Sounds in English","body":"Touch the animals to hear their English names!\n🐱 Cat 🐱 — Cat! The cat says meow!\n🐶 Dog 🐶 — Dog! The dog says woof woof!\n🐰 Rabbit 🐰 — Rabbit! Bimo is a happy rabbit!\n🐟 Fish 🐟 — Fish! Fish swims in the water!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-4-5-001-3', 'eng-4-5-001', '10 Soal Animal Friends', '[{"type":"quiz","title":"10 Soal Animal Friends","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-4-5-001-4', 'eng-4-5-001', 'Terrific! Animal Friends Master!', '[{"type":"text","title":"Terrific! Animal Friends Master!","body":"Terrific! You know Cat, Dog, Bird, Fish, and Rabbit! Keep singing and speaking English!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-01', l.id, m.category_id, '''CAT'' dalam bahasa Indonesia adalah hewan apa? 🐱', 'eng-4-5-001-latihan-01', 'What animal is a cat in Indonesian?', '[{"type":"question","title":"''CAT'' dalam bahasa Indonesia adalah hewan apa? 🐱","body":"✔ Kucing 🐱\n• Anjing 🐶\n• Burung 🐦"},{"type":"text","title":"Petunjuk","body":"Hewan yang suka bersuara meong."}]', '', '', m.age_min, m.age_max, 'beginner', '["''CAT'' dalam bahasa Indonesia adalah hewan apa? 🐱"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-02', l.id, m.category_id, '''DOG'' dalam bahasa Indonesia artinya...?', 'eng-4-5-001-latihan-02', 'What animal is a dog?', '[{"type":"question","title":"''DOG'' dalam bahasa Indonesia artinya...?","body":"✔ Anjing 🐶\n• Kelinci 🐰\n• Ikan 🐟"},{"type":"text","title":"Petunjuk","body":"Hewan yang suka menggonggong guk-guk."}]', '', '', m.age_min, m.age_max, 'beginner', '["''DOG'' dalam bahasa Indonesia artinya...?"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-03', l.id, m.category_id, 'Kelinci Bimo dalam bahasa Inggris disebut...?', 'eng-4-5-001-latihan-03', 'What is kelinci in English?', '[{"type":"question","title":"Kelinci Bimo dalam bahasa Inggris disebut...?","body":"✔ Rabbit 🐰\n• Cat 🐱\n• Bird 🐦"},{"type":"text","title":"Petunjuk","body":"Rabbit hop hop hop!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kelinci Bimo dalam bahasa Inggris disebut...?"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-04', l.id, m.category_id, 'Hewan yang bisa terbang di langit (BIRD) adalah...? 🐦', 'eng-4-5-001-latihan-04', 'What is bird in Indonesian?', '[{"type":"question","title":"Hewan yang bisa terbang di langit (BIRD) adalah...? 🐦","body":"✔ Burung 🐦\n• Ikan 🐟\n• Gajah 🐘"},{"type":"text","title":"Petunjuk","body":"Burung punya sayap untuk terbang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hewan yang bisa terbang di langit (BIRD) adalah...? 🐦"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-05', l.id, m.category_id, '''FISH'' adalah hewan yang hidup dan berenang di dalam...? 🐟', 'eng-4-5-001-latihan-05', 'Where does a fish live and swim?', '[{"type":"question","title":"''FISH'' adalah hewan yang hidup dan berenang di dalam...? 🐟","body":"✔ Water / Air 💧\n• Pohon 🌳\n• Awan ☁️"},{"type":"text","title":"Petunjuk","body":"Water (air)."}]', '', '', m.age_min, m.age_max, 'beginner', '["''FISH'' adalah hewan yang hidup dan berenang di dalam...? 🐟"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-06', l.id, m.category_id, 'What does the CAT say? 🐱', 'eng-4-5-001-latihan-06', 'What sound does a cat make?', '[{"type":"question","title":"What does the CAT say? 🐱","body":"✔ Meow! 🐱\n• Woof! 🐶\n• Moo! 🐮"},{"type":"text","title":"Petunjuk","body":"Meow meow!"}]', '', '', m.age_min, m.age_max, 'beginner', '["What does the CAT say? 🐱"]', '["english-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-07', l.id, m.category_id, 'What does the DOG say? 🐶', 'eng-4-5-001-latihan-07', 'What sound does a dog make?', '[{"type":"question","title":"What does the DOG say? 🐶","body":"✔ Woof woof! 🐶\n• Quack quack! 🦆\n• Tweet tweet! 🐦"},{"type":"text","title":"Petunjuk","body":"Woof woof!"}]', '', '', m.age_min, m.age_max, 'beginner', '["What does the DOG say? 🐶"]', '["english-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-08', l.id, m.category_id, 'How do you say ''Selamat Pagi'' in English? 🌅', 'eng-4-5-001-latihan-08', 'How do you say Selamat Pagi in English?', '[{"type":"question","title":"How do you say ''Selamat Pagi'' in English? 🌅","body":"✔ Good Morning! 🌅\n• Good Night! 🌙\n• Goodbye! 👋"},{"type":"text","title":"Petunjuk","body":"Good morning!"}]', '', '', m.age_min, m.age_max, 'beginner', '["How do you say ''Selamat Pagi'' in English? 🌅"]', '["english-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-09', l.id, m.category_id, 'How do you say ''Selamat Malam'' in English? 🌙', 'eng-4-5-001-latihan-09', 'How do you say Selamat Malam in English?', '[{"type":"question","title":"How do you say ''Selamat Malam'' in English? 🌙","body":"✔ Good Night! 🌙\n• Good Morning! ☀️\n• Hello! 👋"},{"type":"text","title":"Petunjuk","body":"Good night before sleeping."}]', '', '', m.age_min, m.age_max, 'beginner', '["How do you say ''Selamat Malam'' in English? 🌙"]', '["english-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-4-5-001-latihan-10', l.id, m.category_id, 'Complete the sentence: ''I have a cute pet ... 🐱''', 'eng-4-5-001-latihan-10', 'Complete the sentence: I have a cute pet...', '[{"type":"question","title":"Complete the sentence: ''I have a cute pet ... 🐱''","body":"✔ Cat 🐱\n• Tree 🌳\n• Car 🚗"},{"type":"text","title":"Petunjuk","body":"Kucing adalah cat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Complete the sentence: ''I have a cute pet ... 🐱''"]', '["english-animals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-4-5-001-3'
   WHERE m.id = 'eng-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-6-7-001', 'mathematics', 'Pola Bentuk Geometri Ajaib (ABAB & ABC)', 'Menemukan keteraturan pola bentuk lingkaran, segitiga, dan persegi yang tersusun rapi!', 6, 7, 'developing', 10, '["Mengenal bentuk geometri: Lingkaran, Segitiga, Persegi","Melanjutkan susunan pola berulang ABAB dan ABC"]', '["pattern-recognition","geometry-shapes"]', '["math-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-001-1', 'math-6-7-001', 'Bentuk Geometri dan Polanya', '[{"type":"text","title":"Bentuk Geometri dan Polanya","body":"Lingkaran bulat 🔴, Segitiga punya 3 sudut 🔺, Persegi punya 4 sisi sama panjang 🟦. Bila disusun bergantian, terciptalah pola ajaib!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-001-2', 'math-6-7-001', 'Sentuh Pola', '[{"type":"text","title":"Sentuh Pola","body":"Sentuh bentuk geometri berikut!\n🔴 Lingkaran 🔴 — Lingkaran bulat tanpa sudut!\n🔺 Segitiga 🔺 — Segitiga memiliki tiga sudut runcing!\n🟦 Persegi 🟦 — Persegi memiliki empat sisi sama panjang!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-001-3', 'math-6-7-001', '10 Soal Pola Geometri', '[{"type":"quiz","title":"10 Soal Pola Geometri","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-001-4', 'math-6-7-001', 'Kamu Ahli Geometri & Pola!', '[{"type":"text","title":"Kamu Ahli Geometri & Pola!","body":"Keren sekali! Sekarang kamu bisa mengenali pola teratur di alam semesta dan benda-benda di sekitarmu!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-01', l.id, m.category_id, 'Lanjutkan pola ABAB ini: 🔴 🔺 🔴 🔺 ... bentuk berikutnya adalah?', 'math-6-7-001-latihan-01', 'Lingkaran, segitiga, lingkaran, segitiga, berikutnya adalah apa?', '[{"type":"question","title":"Lanjutkan pola ABAB ini: 🔴 🔺 🔴 🔺 ... bentuk berikutnya adalah?","body":"✔ Lingkaran 🔴\n• Persegi 🟦\n• Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Setelah segitiga, pola kembali ke bentuk pertama yaitu lingkaran."}]', '', '', m.age_min, m.age_max, 'beginner', '["Lanjutkan pola ABAB ini: 🔴 🔺 🔴 🔺 ... bentuk berikutnya adalah?"]', '["pattern-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-02', l.id, m.category_id, 'Berapa banyak sudut yang dimiliki oleh bangun SEGITIGA? 🔺', 'math-6-7-001-latihan-02', 'Berapa banyak sudut yang dimiliki oleh segitiga?', '[{"type":"question","title":"Berapa banyak sudut yang dimiliki oleh bangun SEGITIGA? 🔺","body":"✔ 3 Sudut\n• 4 Sudut\n• 0 Sudut"},{"type":"text","title":"Petunjuk","body":"Hitung sudut lancipnya: satu, dua, tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa banyak sudut yang dimiliki oleh bangun SEGITIGA? 🔺"]', '["geometry-shapes"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-03', l.id, m.category_id, 'Lanjutkan pola warna ini: 🟡 🔵 🟡 🔵 ... warna apa berikutnya?', 'math-6-7-001-latihan-03', 'Kuning, biru, kuning, biru, berikutnya warna apa?', '[{"type":"question","title":"Lanjutkan pola warna ini: 🟡 🔵 🟡 🔵 ... warna apa berikutnya?","body":"✔ Kuning 🟡\n• Merah 🔴\n• Hijau 🟢"},{"type":"text","title":"Petunjuk","body":"Kembali lagi ke warna kuning."}]', '', '', m.age_min, m.age_max, 'beginner', '["Lanjutkan pola warna ini: 🟡 🔵 🟡 🔵 ... warna apa berikutnya?"]', '["pattern-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-04', l.id, m.category_id, 'Bangun datar yang bulat dan TIDAK memiliki sudut lancip sama sekali adalah...?', 'math-6-7-001-latihan-04', 'Bangun datar apa yang bulat tanpa sudut?', '[{"type":"question","title":"Bangun datar yang bulat dan TIDAK memiliki sudut lancip sama sekali adalah...?","body":"✔ Lingkaran ⚪\n• Persegi ⬜\n• Segitiga 🔺"},{"type":"text","title":"Petunjuk","body":"Bentuk seperti uang koin dan roda sepeda."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bangun datar yang bulat dan TIDAK memiliki sudut lancip sama sekali adalah...?"]', '["geometry-shapes"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-05', l.id, m.category_id, 'Lanjutkan pola ABC ini: 🔴 🟦 🔺 | 🔴 🟦 ... bentuk apa yang hilang?', 'math-6-7-001-latihan-05', 'Merah, biru, segitiga. Lalu merah, biru, berikutnya apa?', '[{"type":"question","title":"Lanjutkan pola ABC ini: 🔴 🟦 🔺 | 🔴 🟦 ... bentuk apa yang hilang?","body":"✔ Segitiga 🔺\n• Lingkaran 🔴\n• Persegi 🟦"},{"type":"text","title":"Petunjuk","body":"Bentuk ketiga adalah segitiga merah/oranye."}]', '', '', m.age_min, m.age_max, 'developing', '["Lanjutkan pola ABC ini: 🔴 🟦 🔺 | 🔴 🟦 ... bentuk apa yang hilang?"]', '["pattern-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-06', l.id, m.category_id, 'Berapa banyak sisi yang sama panjang pada bangun PERSEGI? 🟦', 'math-6-7-001-latihan-06', 'Berapa banyak sisi sama panjang pada persegi?', '[{"type":"question","title":"Berapa banyak sisi yang sama panjang pada bangun PERSEGI? 🟦","body":"✔ 4 Sisi\n• 3 Sisi\n• 5 Sisi"},{"type":"text","title":"Petunjuk","body":"Atas, bawah, kiri, kanan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa banyak sisi yang sama panjang pada bangun PERSEGI? 🟦"]', '["geometry-shapes"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-07', l.id, m.category_id, 'Pola angka: 2, 4, 6, 8, ... angka berapakah selanjutnya?', 'math-6-7-001-latihan-07', 'Dua, empat, enam, delapan, angka berapa berikutnya?', '[{"type":"question","title":"Pola angka: 2, 4, 6, 8, ... angka berapakah selanjutnya?","body":"✔ 10\n• 9\n• 11"},{"type":"text","title":"Petunjuk","body":"Pola lompat 2 angka setiap langkah. 8 + 2 = 10."}]', '', '', m.age_min, m.age_max, 'developing', '["Pola angka: 2, 4, 6, 8, ... angka berapakah selanjutnya?"]', '["pattern-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-08', l.id, m.category_id, 'Benda di rumah yang bentuk permukaannya mirip LINGKARAN adalah...?', 'math-6-7-001-latihan-08', 'Benda di rumah apa yang berbentuk lingkaran?', '[{"type":"question","title":"Benda di rumah yang bentuk permukaannya mirip LINGKARAN adalah...?","body":"✔ Jam Dinding Bulat ⏰\n• Pintu Kamar 🚪\n• Buku Tulis 📚"},{"type":"text","title":"Petunjuk","body":"Benda yang berdetik dan menunjukkan waktu di dinding."}]', '', '', m.age_min, m.age_max, 'beginner', '["Benda di rumah yang bentuk permukaannya mirip LINGKARAN adalah...?"]', '["geometry-shapes"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-09', l.id, m.category_id, 'Pola ukuran: Kecil, Sedang, Besar | Kecil, Sedang, ... apa selanjutnya?', 'math-6-7-001-latihan-09', 'Kecil, sedang, besar. Kecil, sedang, berikutnya apa?', '[{"type":"question","title":"Pola ukuran: Kecil, Sedang, Besar | Kecil, Sedang, ... apa selanjutnya?","body":"✔ Besar\n• Kecil\n• Mungil"},{"type":"text","title":"Petunjuk","body":"Bentuk yang paling raksasa."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pola ukuran: Kecil, Sedang, Besar | Kecil, Sedang, ... apa selanjutnya?"]', '["pattern-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-001-latihan-10', l.id, m.category_id, 'Bentuk potongan pizza yang lezat menyerupai bangun... ? 🍕', 'math-6-7-001-latihan-10', 'Potongan seiris pizza menyerupai bangun datar apa?', '[{"type":"question","title":"Bentuk potongan pizza yang lezat menyerupai bangun... ? 🍕","body":"✔ Segitiga 🔺\n• Persegi Panjang 📄\n• Lingkaran Penuh ⚪"},{"type":"text","title":"Petunjuk","body":"Punya 3 sisi runcing."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bentuk potongan pizza yang lezat menyerupai bangun... ? 🍕"]', '["geometry-shapes"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-001-3'
   WHERE m.id = 'math-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-6-7-002', 'mathematics', 'Pengurangan Ceria: Berbagi Benda Lezat (1-10)', 'Belajar konsep pengurangan benda konkret dari 10 sampai 1 dengan berbagi donat bersama teman!', 6, 7, 'developing', 10, '["Memahami konsep pengurangan sebagai mengambil atau membagikan benda","Menghitung pengurangan bilangan 1 sampai 10"]', '["subtraction-concrete","math-logic"]', '["math-6-7-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-002-1', 'math-6-7-002', 'Donat Berkurang Dimakan Bimo', '[{"type":"text","title":"Donat Berkurang Dimakan Bimo","body":"Bimo punya 5 donat 🍩🍩🍩🍩🍩. Bimo makan 2 donat dengan lahap. Nyam! Sekarang tersisa berapa donat di piring?"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-002-2', 'math-6-7-002', 'Hitung Sisa Benda', '[{"type":"text","title":"Hitung Sisa Benda","body":"Sentuh pengurangan donat ini!\n🍩 5 - 1 = 4 — Lima dikurangi satu tersisa empat donat!\n🍩🍩 5 - 2 = 3 — Lima dikurangi dua tersisa tiga donat!\n🍩🍩🍩 10 - 5 = 5 — Sepuluh dikurangi lima tersisa lima donat!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-002-3', 'math-6-7-002', '10 Soal Pengurangan Ceria', '[{"type":"quiz","title":"10 Soal Pengurangan Ceria","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-6-7-002-4', 'math-6-7-002', 'Kamu Juara Berhitung!', '[{"type":"text","title":"Kamu Juara Berhitung!","body":"Wah luar biasa! Sekarang kamu sudah bisa menghitung pengurangan sampai angka 10 dengan sangat cepat!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-01', l.id, m.category_id, 'Bimo punya 3 apel 🍎🍎🍎. 1 apel dimakan adik. Berapa apel yang tersisa? (3 - 1 = ...)', 'math-6-7-002-latihan-01', 'Tiga apel dikurangi satu apel sama dengan berapa?', '[{"type":"question","title":"Bimo punya 3 apel 🍎🍎🍎. 1 apel dimakan adik. Berapa apel yang tersisa? (3 - 1 = ...)","body":"✔ 2 Apel 🍎🍎\n• 1 Apel 🍎\n• 3 Apel 🍎🍎🍎"},{"type":"text","title":"Petunjuk","body":"Hitung sisa apel: tiga dikurang satu sama dengan dua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo punya 3 apel 🍎🍎🍎. 1 apel dimakan adik. Berapa apel yang tersisa? (3 - 1 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-02', l.id, m.category_id, '5 Balon ditiup 🎈🎈🎈🎈🎈. 2 balon meletus DOR! Berapa balon yang masih utuh? (5 - 2 = ...)', 'math-6-7-002-latihan-02', 'Lima balon dikurangi dua balon meletus, tersisa berapa?', '[{"type":"question","title":"5 Balon ditiup 🎈🎈🎈🎈🎈. 2 balon meletus DOR! Berapa balon yang masih utuh? (5 - 2 = ...)","body":"✔ 3 Balon 🎈🎈🎈\n• 4 Balon 🎈🎈🎈🎈\n• 2 Balon 🎈🎈"},{"type":"text","title":"Petunjuk","body":"Lima dikurangi dua sama dengan tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["5 Balon ditiup 🎈🎈🎈🎈🎈. 2 balon meletus DOR! Berapa balon yang masih utuh? (5 - 2 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-03', l.id, m.category_id, 'Berapakah hasil dari 4 - 2?', 'math-6-7-002-latihan-03', 'Berapa hasil empat dikurangi dua?', '[{"type":"question","title":"Berapakah hasil dari 4 - 2?","body":"✔ 2\n• 1\n• 3"},{"type":"text","title":"Petunjuk","body":"Buka 4 jari, tutup 2 jari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapakah hasil dari 4 - 2?"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-04', l.id, m.category_id, '6 Ikan berenang di kolam 🐟. 3 ikan berenang pergi. Berapa ikan yang masih tinggal? (6 - 3 = ...)', 'math-6-7-002-latihan-04', 'Enam ikan dikurangi tiga ikan, tersisa berapa ikan?', '[{"type":"question","title":"6 Ikan berenang di kolam 🐟. 3 ikan berenang pergi. Berapa ikan yang masih tinggal? (6 - 3 = ...)","body":"✔ 3 Ikan 🐟🐟🐟\n• 2 Ikan 🐟🐟\n• 4 Ikan 🐟🐟🐟🐟"},{"type":"text","title":"Petunjuk","body":"Setengah dari enam adalah tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["6 Ikan berenang di kolam 🐟. 3 ikan berenang pergi. Berapa ikan yang masih tinggal? (6 - 3 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-05', l.id, m.category_id, 'Berapakah hasil dari 7 - 1?', 'math-6-7-002-latihan-05', 'Berapa hasil tujuh dikurangi satu?', '[{"type":"question","title":"Berapakah hasil dari 7 - 1?","body":"✔ 6\n• 5\n• 8"},{"type":"text","title":"Petunjuk","body":"Angka sebelum angka 7 adalah angka 6."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapakah hasil dari 7 - 1?"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-06', l.id, m.category_id, 'Ada 8 burung di dahan pohon 🐦. 4 burung terbang ke langit. Berapa burung yang masih bertengger? (8 - 4 = ...)', 'math-6-7-002-latihan-06', 'Delapan burung dikurangi empat burung, tersisa berapa?', '[{"type":"question","title":"Ada 8 burung di dahan pohon 🐦. 4 burung terbang ke langit. Berapa burung yang masih bertengger? (8 - 4 = ...)","body":"✔ 4 Burung 🐦🐦🐦🐦\n• 5 Burung\n• 3 Burung"},{"type":"text","title":"Petunjuk","body":"Delapan dikurang empat sama dengan empat."}]', '', '', m.age_min, m.age_max, 'developing', '["Ada 8 burung di dahan pohon 🐦. 4 burung terbang ke langit. Berapa burung yang masih bertengger? (8 - 4 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-07', l.id, m.category_id, 'Ibu menggoreng 10 pisang goreng 🍌. Ayah dan adik makan 5 biji. Berapa sisa pisang goreng? (10 - 5 = ...)', 'math-6-7-002-latihan-07', 'Sepuluh dikurangi lima sama dengan berapa?', '[{"type":"question","title":"Ibu menggoreng 10 pisang goreng 🍌. Ayah dan adik makan 5 biji. Berapa sisa pisang goreng? (10 - 5 = ...)","body":"✔ 5 Pisang\n• 4 Pisang\n• 6 Pisang"},{"type":"text","title":"Petunjuk","body":"Sepuluh jari tangan dikurangi lima jari sama dengan lima."}]', '', '', m.age_min, m.age_max, 'developing', '["Ibu menggoreng 10 pisang goreng 🍌. Ayah dan adik makan 5 biji. Berapa sisa pisang goreng? (10 - 5 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-08', l.id, m.category_id, 'Berapakah hasil dari 9 - 3?', 'math-6-7-002-latihan-08', 'Berapa hasil sembilan dikurangi tiga?', '[{"type":"question","title":"Berapakah hasil dari 9 - 3?","body":"✔ 6\n• 5\n• 7"},{"type":"text","title":"Petunjuk","body":"Hitung mundur dari sembilan sebanyak tiga langkah: delapan, tujuh, enam."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 9 - 3?"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-09', l.id, m.category_id, 'Bimo punya 4 donat 🍩. Keempat-empatnya dibagikan ke teman sampai habis. Berapa donat Bimo sekarang? (4 - 4 = ...)', 'math-6-7-002-latihan-09', 'Empat dikurangi empat sama dengan berapa?', '[{"type":"question","title":"Bimo punya 4 donat 🍩. Keempat-empatnya dibagikan ke teman sampai habis. Berapa donat Bimo sekarang? (4 - 4 = ...)","body":"✔ 0 (Habis)\n• 1\n• 4"},{"type":"text","title":"Petunjuk","body":"Bila semua habis terbagi, hasilnya adalah nol."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo punya 4 donat 🍩. Keempat-empatnya dibagikan ke teman sampai habis. Berapa donat Bimo sekarang? (4 - 4 = ...)"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-6-7-002-latihan-10', l.id, m.category_id, 'Berapakah 10 - 2?', 'math-6-7-002-latihan-10', 'Berapa hasil sepuluh dikurangi dua?', '[{"type":"question","title":"Berapakah 10 - 2?","body":"✔ 8\n• 7\n• 9"},{"type":"text","title":"Petunjuk","body":"Dua angka sebelum sepuluh adalah delapan."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah 10 - 2?"]', '["subtraction-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-6-7-002-3'
   WHERE m.id = 'math-6-7-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'indo-6-7-001', 'indonesian', 'Membaca Kata Suku Tertutup & Kalimat Pendek', 'Membaca kata yang berakhiran konsonan (R, N, S, T, K) dan merangkai kalimat cerita pendek!', 6, 7, 'developing', 10, '["Membaca suku kata tertutup dengan akhiran konsonan","Memahami makna kalimat sederhana 3-4 kata"]', '["closed-syllables","sentence-reading"]', '["indo-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-6-7-001-1', 'indo-6-7-001', 'Bimo Membaca Buku Cerita', '[{"type":"text","title":"Bimo Membaca Buku Cerita","body":"Huruf K di akhir kata ''BU-KU'' jadi ''BU-KUK''. Akhiran N pada ''MA-KA'' jadi ''MA-KAN''. Yuk kita baca kalimat pendek bersama Bimo!"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-6-7-001-2', 'indo-6-7-001', 'Sentuh Kata Tertutup', '[{"type":"text","title":"Sentuh Kata Tertutup","body":"Sentuh kata-kata ini untuk mendengar lafalnya!\n🍽️ Makan 🍽️ — Makan! MA - KAN!\n🛒 Pasar 🛒 — Pasar! PA - SAR!\n🐰 Kelinci 🐰 — Kelinci melompat lincah!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-6-7-001-3', 'indo-6-7-001', '10 Soal Membaca Kalimat', '[{"type":"quiz","title":"10 Soal Membaca Kalimat","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-6-7-001-4', 'indo-6-7-001', 'Kamu Sudah Mahir Membaca!', '[{"type":"text","title":"Kamu Sudah Mahir Membaca!","body":"Luar biasa! Sekarang kamu sudah bisa membaca kata-kata panjang dan kalimat cerita sendiri dengan lancar!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-01', l.id, m.category_id, 'Kata ''RUMAH'' berakhiran dengan huruf konsonan apa? 🏠', 'indo-6-7-001-latihan-01', 'Kata Rumah diakhiri dengan huruf apa?', '[{"type":"question","title":"Kata ''RUMAH'' berakhiran dengan huruf konsonan apa? 🏠","body":"✔ Huruf H\n• Huruf M\n• Huruf R"},{"type":"text","title":"Petunjuk","body":"RU - MAH, huruf paling terakhir adalah H."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''RUMAH'' berakhiran dengan huruf konsonan apa? 🏠"]', '["closed-syllables"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-02', l.id, m.category_id, 'Lengkapi kalimat: ''Bimo suka makan wortel yang ... 🥕''', 'indo-6-7-001-latihan-02', 'Bimo suka makan wortel yang apa?', '[{"type":"question","title":"Lengkapi kalimat: ''Bimo suka makan wortel yang ... 🥕''","body":"✔ Manis dan segar 🥕\n• Asin sekali 🧂\n• Pahit ☕"},{"type":"text","title":"Petunjuk","body":"Wortel rasanya manis dan segar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Lengkapi kalimat: ''Bimo suka makan wortel yang ... 🥕''"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-03', l.id, m.category_id, 'Susun kata ini menjadi kalimat yang benar: [buku] - [Bimo] - [membaca]', 'indo-6-7-001-latihan-03', 'Susun kata buku Bimo membaca menjadi kalimat yang runtut!', '[{"type":"question","title":"Susun kata ini menjadi kalimat yang benar: [buku] - [Bimo] - [membaca]","body":"✔ Bimo membaca buku 📖\n• Buku membaca Bimo 🤖\n• Membaca buku Bimo 🚶"},{"type":"text","title":"Petunjuk","body":"Subjek dulu (Bimo), lalu kata kerja (membaca), lalu objek (buku)."}]', '', '', m.age_min, m.age_max, 'developing', '["Susun kata ini menjadi kalimat yang benar: [buku] - [Bimo] - [membaca]"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-04', l.id, m.category_id, 'Kata apa yang berima bunyi sama dengan kata ''BINTANG''? ⭐', 'indo-6-7-001-latihan-04', 'Kata apa yang rimanya sama dengan kata bintang?', '[{"type":"question","title":"Kata apa yang berima bunyi sama dengan kata ''BINTANG''? ⭐","body":"✔ Terbang 🕊️\n• Bulan 🌙\n• Matahari ☀️"},{"type":"text","title":"Petunjuk","body":"Berakhiran -ang: te-tang-ga, ter-bang."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata apa yang berima bunyi sama dengan kata ''BINTANG''? ⭐"]', '["closed-syllables"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-05', l.id, m.category_id, 'Lengkapi kalimat: ''Ikan berenang di dalam ... 🐟''', 'indo-6-7-001-latihan-05', 'Ikan berenang di dalam apa?', '[{"type":"question","title":"Lengkapi kalimat: ''Ikan berenang di dalam ... 🐟''","body":"✔ Air kolam 🌊\n• Pohon kelapa 🌴\n• Atap rumah 🏠"},{"type":"text","title":"Petunjuk","body":"Air yang jernih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Lengkapi kalimat: ''Ikan berenang di dalam ... 🐟''"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-06', l.id, m.category_id, 'Kata ''POHON'' terdiri dari berapa suku kata? (PO - HON) 🌳', 'indo-6-7-001-latihan-06', 'Berapa suku kata dalam kata pohon?', '[{"type":"question","title":"Kata ''POHON'' terdiri dari berapa suku kata? (PO - HON) 🌳","body":"✔ 2 Suku Kata\n• 3 Suku Kata\n• 1 Suku Kata"},{"type":"text","title":"Petunjuk","body":"Tepuk tanganmu: PO (satu) - HON (dua)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''POHON'' terdiri dari berapa suku kata? (PO - HON) 🌳"]', '["closed-syllables"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-07', l.id, m.category_id, 'Tanda baca yang diletakkan di akhir kalimat berita adalah...? (.)', 'indo-6-7-001-latihan-07', 'Tanda baca apa di akhir kalimat berita?', '[{"type":"question","title":"Tanda baca yang diletakkan di akhir kalimat berita adalah...? (.)","body":"✔ Tanda Titik (.)\n• Tanda Tanya (?)\n• Tanda Seru (!)"},{"type":"text","title":"Petunjuk","body":"Tanda titik berbentuk noktah kecil bulat di akhir kalimat."}]', '', '', m.age_min, m.age_max, 'developing', '["Tanda baca yang diletakkan di akhir kalimat berita adalah...? (.)"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-08', l.id, m.category_id, 'Kata ''MANDI'' diawali suku kata MAN- dan diakhiri suku kata...?', 'indo-6-7-001-latihan-08', 'Kata Mandi diakhiri dengan suku kata apa?', '[{"type":"question","title":"Kata ''MANDI'' diawali suku kata MAN- dan diakhiri suku kata...?","body":"✔ DI\n• DA\n• DU"},{"type":"text","title":"Petunjuk","body":"MAN - DI."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''MANDI'' diawali suku kata MAN- dan diakhiri suku kata...?"]', '["closed-syllables"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-09', l.id, m.category_id, 'Bacalah kalimat ini: ''Matahari terbit di sebelah timur.'' Apa yang terbit di pagi hari?', 'indo-6-7-001-latihan-09', 'Berdasarkan kalimat itu, apa yang terbit di timur?', '[{"type":"question","title":"Bacalah kalimat ini: ''Matahari terbit di sebelah timur.'' Apa yang terbit di pagi hari?","body":"✔ Matahari ☀️\n• Bulan 🌙\n• Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Benda langit matahari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bacalah kalimat ini: ''Matahari terbit di sebelah timur.'' Apa yang terbit di pagi hari?"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-6-7-001-latihan-10', l.id, m.category_id, 'Manakah kalimat yang menceritakan tentang kelinci Bimo yang gembira?', 'indo-6-7-001-latihan-10', 'Manakah kalimat yang menceritakan Bimo gembira melompat?', '[{"type":"question","title":"Manakah kalimat yang menceritakan tentang kelinci Bimo yang gembira?","body":"✔ Bimo kelinci melompat dengan riang gembira 🐰✨\n• Mobil melaju di jalan tol 🚗\n• Hujan turun sangat deras 🌧️"},{"type":"text","title":"Petunjuk","body":"Kelinci melompat dengan riang gembira."}]', '', '', m.age_min, m.age_max, 'developing', '["Manakah kalimat yang menceritakan tentang kelinci Bimo yang gembira?"]', '["sentence-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-6-7-001-3'
   WHERE m.id = 'indo-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'sci-6-7-001', 'science', 'Siklus Terjadinya Hujan & Awan Ajaib 🌧️', 'Mempelajari perjalanan tetesan air dari laut menguap ke awan hingga turun menjadi hujan berkah!', 6, 7, 'developing', 10, '["Memahami proses penguapan air laut oleh panas matahari","Mengetahui pembentukan awan dan tetesan air hujan"]', '["water-cycle","weather-science"]', '["sci-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-6-7-001-1', 'sci-6-7-001', 'Perjalanan Tetesan Air', '[{"type":"text","title":"Perjalanan Tetesan Air","body":"Air laut dipanaskan matahari lalu menguap ke atas menjadi awan putih ☁️. Saat awan sudah penuh dan berat, air jatuh kembali ke bumi sebagai HUJAN! 🌧️"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-6-7-001-2', 'sci-6-7-001', 'Sentuh Tahap Hujan', '[{"type":"text","title":"Sentuh Tahap Hujan","body":"Sentuh setiap tahapan siklus air!\n♨️ Penguapan — Air laut naik ke langit karena hangatnya matahari!\n☁️ Awan Berat — Awan putih berkumpul menjadi awan mendung tebal!\n🌧️ Hujan Segar — Tetesan air jatuh menyirami bumi dan tanaman!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-6-7-001-3', 'sci-6-7-001', '10 Soal Siklus Air Hujan', '[{"type":"quiz","title":"10 Soal Siklus Air Hujan","body":"10 soal latihan"}]', 2, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-6-7-001-4', 'sci-6-7-001', 'Peneliti Cilik yang Cerdas!', '[{"type":"text","title":"Peneliti Cilik yang Cerdas!","body":"Hebat sekali! Sekarang kamu mengerti rahasia sains di balik air hujan dan indahnya pelangi!"}]', 3, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-01', l.id, m.category_id, 'Dari mana sebagian besar air yang menguap ke langit berasal? 🌊', 'sci-6-7-001-latihan-01', 'Dari mana sebagian besar air menguap ke langit?', '[{"type":"question","title":"Dari mana sebagian besar air yang menguap ke langit berasal? 🌊","body":"✔ Lautan dan Sungai 🌊\n• Batu Karang 🪨\n• Gurun Pasir 🏜️"},{"type":"text","title":"Petunjuk","body":"Lautan yang sangat luas dan terkena sinar matahari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Dari mana sebagian besar air yang menguap ke langit berasal? 🌊"]', '["water-cycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-02', l.id, m.category_id, 'Apa yang memanaskan air laut sehingga bisa menguap naik ke atas? ☀️', 'sci-6-7-001-latihan-02', 'Energi apa yang memanaskan air laut?', '[{"type":"question","title":"Apa yang memanaskan air laut sehingga bisa menguap naik ke atas? ☀️","body":"✔ Panas Sinar Matahari ☀️\n• Cahaya Bulan 🌙\n• Hembusan Angin Dingin 🌬️"},{"type":"text","title":"Petunjuk","body":"Panas terik sinar matahari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang memanaskan air laut sehingga bisa menguap naik ke atas? ☀️"]', '["water-cycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-03', l.id, m.category_id, 'Gumpalan uap air putih yang melayang di langit disebut apa? ☁️', 'sci-6-7-001-latihan-03', 'Gumpalan uap air di langit disebut apa?', '[{"type":"question","title":"Gumpalan uap air putih yang melayang di langit disebut apa? ☁️","body":"✔ Awan ☁️\n• Pelangi 🌈\n• Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Awan putih di langit biru."}]', '', '', m.age_min, m.age_max, 'beginner', '["Gumpalan uap air putih yang melayang di langit disebut apa? ☁️"]', '["weather-science"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-04', l.id, m.category_id, 'Saat awan menjadi gelap keabu-abuan dan tebal, itu pertanda akan turun...?', 'sci-6-7-001-latihan-04', 'Awan mendung gelap pertanda akan turun apa?', '[{"type":"question","title":"Saat awan menjadi gelap keabu-abuan dan tebal, itu pertanda akan turun...?","body":"✔ Hujan 🌧️\n• Salju Panas ☀️\n• Malam Hari 🌙"},{"type":"text","title":"Petunjuk","body":"Tetesan air hujan dari langit."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat awan menjadi gelap keabu-abuan dan tebal, itu pertanda akan turun...?"]', '["weather-science"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-05', l.id, m.category_id, 'Benda yang kita pakai agar tidak basah saat bepergian di waktu hujan adalah...? ☂️', 'sci-6-7-001-latihan-05', 'Benda apa yang kita pakai saat hujan?', '[{"type":"question","title":"Benda yang kita pakai agar tidak basah saat bepergian di waktu hujan adalah...? ☂️","body":"✔ Payung & Jas Hujan ☂️\n• Kacamata Hitam 🕶️\n• Kipas Angin 🪭"},{"type":"text","title":"Petunjuk","body":"Payung atau jas hujan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Benda yang kita pakai agar tidak basah saat bepergian di waktu hujan adalah...? ☂️"]', '["weather-science"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-06', l.id, m.category_id, 'Lengkungan warna-warni yang indah di langit setelah hujan reda disebut...? 🌈', 'sci-6-7-001-latihan-06', 'Lengkungan warna-warni setelah hujan reda disebut apa?', '[{"type":"question","title":"Lengkungan warna-warni yang indah di langit setelah hujan reda disebut...? 🌈","body":"✔ Pelangi 🌈\n• Kilat ⚡\n• Bulan Sabit 🌙"},{"type":"text","title":"Petunjuk","body":"Me-ji-ku-hi-bi-ni-u: Pelangi!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Lengkungan warna-warni yang indah di langit setelah hujan reda disebut...? 🌈"]', '["weather-science"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-07', l.id, m.category_id, 'Air hujan yang jatuh ke tanah sebagian besar akan mengalir kembali ke mana?', 'sci-6-7-001-latihan-07', 'Ke mana air hujan mengalir kembali?', '[{"type":"question","title":"Air hujan yang jatuh ke tanah sebagian besar akan mengalir kembali ke mana?","body":"✔ Sungai dan Laut 🌊\n• Luar Angkasa 🚀\n• Di atas awan selamanya ☁️"},{"type":"text","title":"Petunjuk","body":"Sungai lalu kembali bermuara ke laut luas."}]', '', '', m.age_min, m.age_max, 'developing', '["Air hujan yang jatuh ke tanah sebagian besar akan mengalir kembali ke mana?"]', '["water-cycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-08', l.id, m.category_id, 'Mengapa air hujan sangat penting bagi para petani di sawah? 🌾', 'sci-6-7-001-latihan-08', 'Mengapa air hujan penting bagi petani?', '[{"type":"question","title":"Mengapa air hujan sangat penting bagi para petani di sawah? 🌾","body":"✔ Untuk menyirami tanaman padi agar subur 🌾\n• Untuk mencuci traktor saja 🚜\n• Tidak ada gunanya 🤷"},{"type":"text","title":"Petunjuk","body":"Tanaman padi membutuhkan banyak air untuk tumbuh dan berbuah beras."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengapa air hujan sangat penting bagi para petani di sawah? 🌾"]', '["water-cycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-09', l.id, m.category_id, 'Suara gemuruh yang menggelegar di langit saat hujan lebat disebut...?', 'sci-6-7-001-latihan-09', 'Suara menggelegar di langit saat hujan disebut apa?', '[{"type":"question","title":"Suara gemuruh yang menggelegar di langit saat hujan lebat disebut...?","body":"✔ Guntur / Petir ⚡\n• Sirene 🚨\n• Klakson Mobil 🚗"},{"type":"text","title":"Petunjuk","body":"Petir atau guntur."}]', '', '', m.age_min, m.age_max, 'beginner', '["Suara gemuruh yang menggelegar di langit saat hujan lebat disebut...?"]', '["weather-science"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-6-7-001-latihan-10', l.id, m.category_id, 'Perputaran air dari bumi ke langit lalu kembali ke bumi lagi disebut...?', 'sci-6-7-001-latihan-10', 'Apa nama perputaran air secara terus-menerus di bumi?', '[{"type":"question","title":"Perputaran air dari bumi ke langit lalu kembali ke bumi lagi disebut...?","body":"✔ Siklus Air (Daur Air) 💧🔄\n• Angin Puyuh 🌪️\n• Gempa Bumi 🌋"},{"type":"text","title":"Petunjuk","body":"Siklus air / daur air."}]', '', '', m.age_min, m.age_max, 'developing', '["Perputaran air dari bumi ke langit lalu kembali ke bumi lagi disebut...?"]', '["water-cycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-6-7-001-3'
   WHERE m.id = 'sci-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'code-6-7-001', 'coding', 'Perulangan (Loop) Langkah Kaki Bimo 🔁', 'Belajar membuat perintah coding yang efisien menggunakan perulangan (loop) tanpa perlu mengetik berulang kali!', 6, 7, 'developing', 10, '["Memahami konsep perulangan (loop) dalam pemrograman","Menyederhanakan urutan instruksi: ➡️ ➡️ ➡️ menjadi Ulangi 3x ke Kanan"]', '["looping-concept","code-efficiency"]', '["code-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-6-7-001-1', 'code-6-7-001', 'Apa itu Perulangan (Loop)?', '[{"type":"text","title":"Apa itu Perulangan (Loop)?","body":"Jika kamu ingin melompat 3 kali ke kanan, daripada mengetik kanan, kanan, kanan, kita cukup bilang: Ulangi 3x ke Kanan! 🔁"}]', 0, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-6-7-001-2', 'code-6-7-001', 'Sentuh Balok Perulangan', '[{"type":"text","title":"Sentuh Balok Perulangan","body":"Sentuh balok loop ini!\n🔁 2x Ulangi 2x ➡️ — Ulangi dua kali melangkah ke kanan!\n🔁 3x Ulangi 3x ⬆️ — Ulangi tiga kali melompat ke atas!"}]', 1, 3, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-6-7-001';
