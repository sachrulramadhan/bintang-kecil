-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-09', l.id, m.category_id, 'How do you say ''Halo'' in English? 👋', 'eng-2-3-001-latihan-09', 'How do you say Halo in English?', '[{"type":"question","title":"How do you say ''Halo'' in English? 👋","body":"✔ Hello! 👋\n• Goodbye! 🚶\n• Thank you! 🙏"},{"type":"text","title":"Petunjuk","body":"Say Hello!"}]', '', '', m.age_min, m.age_max, 'beginner', '["How do you say ''Halo'' in English? 👋"]', '["vocabulary-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-10', l.id, m.category_id, 'How do you say ''Terima kasih'' in English? 🙏', 'eng-2-3-001-latihan-10', 'How do you say Terima kasih in English?', '[{"type":"question","title":"How do you say ''Terima kasih'' in English? 🙏","body":"✔ Thank You! 🙏\n• Hello! 👋\n• No ❌"},{"type":"text","title":"Petunjuk","body":"Say Thank you!"}]', '', '', m.age_min, m.age_max, 'beginner', '["How do you say ''Terima kasih'' in English? 🙏"]', '["vocabulary-listening"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-4-5-001', 'mathematics', 'Penjumlahan Ceria dengan Bintang', 'Menggabungkan dua kelompok bintang berkilau untuk belajar penjumlahan dasar 1 sampai 5!', 4, 5, 'developing', 8, '["Memahami konsep penjumlahan sebagai menggabungkan dua kelompok benda","Menghitung hasil penjumlahan konkret hingga 5"]', '["addition-concrete","counting"]', '["math-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-001-1', 'math-4-5-001', 'Menggabungkan Bintang', '[{"type":"text","title":"Menggabungkan Bintang","body":"Bila kita punya 1 bintang ⭐ lalu mendapat 1 bintang lagi ⭐, semuanya jadi 2 bintang! Itu namanya penjumlahan!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-001-2', 'math-4-5-001', 'Gabungkan Bintang', '[{"type":"text","title":"Gabungkan Bintang","body":"Sentuh penjumlahan bintang berikut!\n⭐⭐ ⭐ + ⭐ — 1 ditambah 1 sama dengan 2!\n⭐⭐⭐ ⭐⭐ + ⭐ — 2 ditambah 1 sama dengan 3!\n⭐⭐⭐⭐ ⭐⭐ + ⭐⭐ — 2 ditambah 2 sama dengan 4!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-001-3', 'math-4-5-001', '10 Soal Penjumlahan Ceria', '[{"type":"quiz","title":"10 Soal Penjumlahan Ceria","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-001-4', 'math-4-5-001', 'Hebat! Kamu Jago Menjumlahkan!', '[{"type":"text","title":"Hebat! Kamu Jago Menjumlahkan!","body":"Luar biasa! Sekarang kamu sudah bisa menjumlahkan angka sampai 5 bersama Bimo!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-01', l.id, m.category_id, '1 Bintang + 1 Bintang = Berapa bintang? ⭐ + ⭐', 'math-4-5-001-latihan-01', 'Satu bintang ditambah satu bintang sama dengan berapa?', '[{"type":"question","title":"1 Bintang + 1 Bintang = Berapa bintang? ⭐ + ⭐","body":"✔ 2 Bintang ⭐⭐\n• 3 Bintang ⭐⭐⭐\n• 1 Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Hitung semua bintang: satu... dua!"}]', '', '', m.age_min, m.age_max, 'beginner', '["1 Bintang + 1 Bintang = Berapa bintang? ⭐ + ⭐"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-02', l.id, m.category_id, '2 Apel + 1 Apel = Berapa apel? 🍎🍎 + 🍎', 'math-4-5-001-latihan-02', 'Dua apel ditambah satu apel jadi berapa?', '[{"type":"question","title":"2 Apel + 1 Apel = Berapa apel? 🍎🍎 + 🍎","body":"✔ 3 Apel 🍎🍎🍎\n• 2 Apel 🍎🍎\n• 4 Apel 🍎🍎🍎🍎"},{"type":"text","title":"Petunjuk","body":"Dua, lalu tambah satu jadi tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["2 Apel + 1 Apel = Berapa apel? 🍎🍎 + 🍎"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-03', l.id, m.category_id, '2 Pisang + 2 Pisang = Berapa pisang? 🍌🍌 + 🍌🍌', 'math-4-5-001-latihan-03', 'Dua pisang ditambah dua pisang jadi berapa?', '[{"type":"question","title":"2 Pisang + 2 Pisang = Berapa pisang? 🍌🍌 + 🍌🍌","body":"✔ 4 Pisang\n• 3 Pisang\n• 5 Pisang"},{"type":"text","title":"Petunjuk","body":"Dua tambah dua sama dengan empat."}]', '', '', m.age_min, m.age_max, 'beginner', '["2 Pisang + 2 Pisang = Berapa pisang? 🍌🍌 + 🍌🍌"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-04', l.id, m.category_id, '3 Jeruk + 1 Jeruk = Berapa jeruk? 🍊🍊🍊 + 🍊', 'math-4-5-001-latihan-04', 'Tiga jeruk ditambah satu jeruk jadi berapa?', '[{"type":"question","title":"3 Jeruk + 1 Jeruk = Berapa jeruk? 🍊🍊🍊 + 🍊","body":"✔ 4 Jeruk\n• 5 Jeruk\n• 2 Jeruk"},{"type":"text","title":"Petunjuk","body":"Tiga lalu melangkah satu jadi empat."}]', '', '', m.age_min, m.age_max, 'beginner', '["3 Jeruk + 1 Jeruk = Berapa jeruk? 🍊🍊🍊 + 🍊"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-05', l.id, m.category_id, '3 Permen + 2 Permen = Berapa permen? 🍬🍬🍬 + 🍬🍬', 'math-4-5-001-latihan-05', 'Tiga permen ditambah dua permen jadi berapa?', '[{"type":"question","title":"3 Permen + 2 Permen = Berapa permen? 🍬🍬🍬 + 🍬🍬","body":"✔ 5 Permen\n• 4 Permen\n• 6 Permen"},{"type":"text","title":"Petunjuk","body":"Hitung semua jari di satu tangan: ada lima!"}]', '', '', m.age_min, m.age_max, 'developing', '["3 Permen + 2 Permen = Berapa permen? 🍬🍬🍬 + 🍬🍬"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-06', l.id, m.category_id, '4 Balon + 1 Balon = Berapa balon? 🎈🎈🎈🎈 + 🎈', 'math-4-5-001-latihan-06', 'Empat balon ditambah satu balon jadi berapa?', '[{"type":"question","title":"4 Balon + 1 Balon = Berapa balon? 🎈🎈🎈🎈 + 🎈","body":"✔ 5 Balon\n• 4 Balon\n• 3 Balon"},{"type":"text","title":"Petunjuk","body":"Empat ditambah satu sama dengan lima."}]', '', '', m.age_min, m.age_max, 'developing', '["4 Balon + 1 Balon = Berapa balon? 🎈🎈🎈🎈 + 🎈"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-07', l.id, m.category_id, 'Bimo punya 1 wortel 🥕, lalu memetik 3 wortel lagi 🥕🥕🥕. Berapa total wortel Bimo?', 'math-4-5-001-latihan-07', 'Satu wortel ditambah tiga wortel jadi berapa?', '[{"type":"question","title":"Bimo punya 1 wortel 🥕, lalu memetik 3 wortel lagi 🥕🥕🥕. Berapa total wortel Bimo?","body":"✔ 4 Wortel\n• 3 Wortel\n• 5 Wortel"},{"type":"text","title":"Petunjuk","body":"Satu ditambah tiga sama dengan empat."}]', '', '', m.age_min, m.age_max, 'developing', '["Bimo punya 1 wortel 🥕, lalu memetik 3 wortel lagi 🥕🥕🥕. Berapa total wortel Bimo?"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-08', l.id, m.category_id, 'Tanda matematika apa yang dipakai untuk penjumlahan? (Tambah)', 'math-4-5-001-latihan-08', 'Tanda matematika apa untuk penjumlahan?', '[{"type":"question","title":"Tanda matematika apa yang dipakai untuk penjumlahan? (Tambah)","body":"✔ + (Plus / Tambah)\n• - (Kurang)\n• = (Sama Dengan)"},{"type":"text","title":"Petunjuk","body":"Tanda tambah berbentuk tanda silang tegak (+)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tanda matematika apa yang dipakai untuk penjumlahan? (Tambah)"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-09', l.id, m.category_id, '0 Kue + 3 Kue = Berapa kue? 🧁🧁🧁', 'math-4-5-001-latihan-09', 'Nol kue ditambah tiga kue jadi berapa kue?', '[{"type":"question","title":"0 Kue + 3 Kue = Berapa kue? 🧁🧁🧁","body":"✔ 3 Kue\n• 0 Kue\n• 1 Kue"},{"type":"text","title":"Petunjuk","body":"Nol artinya tidak ada, jadi hasilnya tetap tiga."}]', '', '', m.age_min, m.age_max, 'developing', '["0 Kue + 3 Kue = Berapa kue? 🧁🧁🧁"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-001-latihan-10', l.id, m.category_id, 'Berapakah 2 + 3?', 'math-4-5-001-latihan-10', 'Berapakah hasil dua ditambah tiga?', '[{"type":"question","title":"Berapakah 2 + 3?","body":"✔ 5\n• 4\n• 6"},{"type":"text","title":"Petunjuk","body":"Dua jari ditambah tiga jari sama dengan lima jari."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah 2 + 3?"]', '["addition-concrete"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-001-3'
   WHERE m.id = 'math-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-4-5-002', 'mathematics', 'Mengenal Angka 4 sampai 10 & Roket Meluncur', 'Belajar berhitung maju dan hitung mundur roket peluncuran luar angkasa!', 4, 5, 'developing', 8, '["Mengenali urutan angka 4 hingga 10","Melakukan hitung mundur sederhana 5, 4, 3, 2, 1"]', '["counting-10","countdown"]', '["math-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-002-1', 'math-4-5-002', 'Hitung Mundur Roket: 5, 4, 3, 2, 1, Meluncur!', '[{"type":"text","title":"Hitung Mundur Roket: 5, 4, 3, 2, 1, Meluncur!","body":"Ayo naik roket bintang Bimo! Hitung mundur bersama: 5... 4... 3... 2... 1... Wuuusss meluncur ke angkasa! 🚀"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-002-2', 'math-4-5-002', 'Sentuh Angka 4 sampai 10', '[{"type":"text","title":"Sentuh Angka 4 sampai 10","body":"Sentuh angka-angka ini!\n4️⃣ Angka 4 — Empat!\n5️⃣ Angka 5 — Lima!\n6️⃣ Angka 6 — Enam!\n🔟 Angka 10 — Sepuluh!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-002-3', 'math-4-5-002', '10 Soal Angka 4-10', '[{"type":"quiz","title":"10 Soal Angka 4-10","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-4-5-002-4', 'math-4-5-002', 'Roket Meluncur Sempurna!', '[{"type":"text","title":"Roket Meluncur Sempurna!","body":"Wah hebat sekali astronot cilik! Kamu sudah menguasai angka 4 sampai 10!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-01', l.id, m.category_id, 'Setelah angka 3, angka berikutnya adalah...?', 'math-4-5-002-latihan-01', 'Setelah angka tiga, angka berikutnya adalah angka berapa?', '[{"type":"question","title":"Setelah angka 3, angka berikutnya adalah...?","body":"✔ Angka 4\n• Angka 5\n• Angka 2"},{"type":"text","title":"Petunjuk","body":"Satu, dua, tiga, lalu..."}]', '', '', m.age_min, m.age_max, 'beginner', '["Setelah angka 3, angka berikutnya adalah...?"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-02', l.id, m.category_id, 'Ada berapa jari di satu tanganmu? 🖐️', 'math-4-5-002-latihan-02', 'Ada berapa jumlah jari di satu tanganmu?', '[{"type":"question","title":"Ada berapa jari di satu tanganmu? 🖐️","body":"✔ 5 Jari\n• 4 Jari\n• 6 Jari"},{"type":"text","title":"Petunjuk","body":"Ibu jari, telunjuk, tengah, manis, kelingking."}]', '', '', m.age_min, m.age_max, 'beginner', '["Ada berapa jari di satu tanganmu? 🖐️"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-03', l.id, m.category_id, 'Hitung mundur roket sebelum meluncur: 3, 2, ... lalu?', 'math-4-5-002-latihan-03', 'Tiga, dua, lalu angka berapa sebelum roket meluncur?', '[{"type":"question","title":"Hitung mundur roket sebelum meluncur: 3, 2, ... lalu?","body":"✔ 1 (Satu!) 🚀\n• 4 (Empat)\n• 0 (Nol)"},{"type":"text","title":"Petunjuk","body":"Angka satu sebelum roket meluncur!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Hitung mundur roket sebelum meluncur: 3, 2, ... lalu?"]', '["countdown"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-04', l.id, m.category_id, 'Angka yang ada di antara 5 dan 7 adalah angka...?', 'math-4-5-002-latihan-04', 'Angka apa yang berada di antara lima dan tujuh?', '[{"type":"question","title":"Angka yang ada di antara 5 dan 7 adalah angka...?","body":"✔ 6 (Enam)\n• 8 (Delapan)\n• 4 (Empat)"},{"type":"text","title":"Petunjuk","body":"Lima, lalu angka ini, lalu tujuh."}]', '', '', m.age_min, m.age_max, 'developing', '["Angka yang ada di antara 5 dan 7 adalah angka...?"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-05', l.id, m.category_id, 'Berapa jumlah kaki laba-laba? 🕷️', 'math-4-5-002-latihan-05', 'Berapa jumlah kaki laba-laba?', '[{"type":"question","title":"Berapa jumlah kaki laba-laba? 🕷️","body":"✔ 8 Kaki\n• 6 Kaki\n• 4 Kaki"},{"type":"text","title":"Petunjuk","body":"Laba-laba punya empat kaki di kiri dan empat di kanan."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapa jumlah kaki laba-laba? 🕷️"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-06', l.id, m.category_id, 'Berapa jumlah total jari di kedua tanganmu? 🖐️🖐️', 'math-4-5-002-latihan-06', 'Berapa total jari di kedua belah tanganmu?', '[{"type":"question","title":"Berapa jumlah total jari di kedua tanganmu? 🖐️🖐️","body":"✔ 10 Jari 🔟\n• 8 Jari\n• 9 Jari"},{"type":"text","title":"Petunjuk","body":"Lima di tangan kiri ditambah lima di tangan kanan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa jumlah total jari di kedua tanganmu? 🖐️🖐️"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-07', l.id, m.category_id, 'Hitung mundur lengkap dari 5 adalah...?', 'math-4-5-002-latihan-07', 'Bagaimana urutan hitung mundur dari angka lima?', '[{"type":"question","title":"Hitung mundur lengkap dari 5 adalah...?","body":"✔ 5, 4, 3, 2, 1\n• 1, 2, 3, 4, 5\n• 5, 3, 4, 2, 1"},{"type":"text","title":"Petunjuk","body":"Mulai dari lima, empat, tiga, dua, satu."}]', '', '', m.age_min, m.age_max, 'developing', '["Hitung mundur lengkap dari 5 adalah...?"]', '["countdown"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-08', l.id, m.category_id, 'Angka sebelum angka 9 adalah angka...?', 'math-4-5-002-latihan-08', 'Angka berapa tepat sebelum angka sembilan?', '[{"type":"question","title":"Angka sebelum angka 9 adalah angka...?","body":"✔ 8 (Delapan)\n• 7 (Tujuh)\n• 10 (Sepuluh)"},{"type":"text","title":"Petunjuk","body":"Tujuh, delapan, sembilan."}]', '', '', m.age_min, m.age_max, 'developing', '["Angka sebelum angka 9 adalah angka...?"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-09', l.id, m.category_id, 'Manakah kumpulan yang berjumlah 7 bintang? ⭐', 'math-4-5-002-latihan-09', 'Manakah yang berjumlah tujuh bintang?', '[{"type":"question","title":"Manakah kumpulan yang berjumlah 7 bintang? ⭐","body":"✔ ⭐⭐⭐⭐⭐⭐⭐ (7 Bintang)\n• ⭐⭐⭐⭐⭐ (5 Bintang)\n• ⭐⭐⭐⭐⭐⭐ (6 Bintang)"},{"type":"text","title":"Petunjuk","body":"Hitung pelan-pelan sampai tujuh."}]', '', '', m.age_min, m.age_max, 'developing', '["Manakah kumpulan yang berjumlah 7 bintang? ⭐"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-4-5-002-latihan-10', l.id, m.category_id, 'Berapa roda pada 2 sepeda motor? 🏍️🏍️', 'math-4-5-002-latihan-10', 'Berapa jumlah roda pada dua buah sepeda motor?', '[{"type":"question","title":"Berapa roda pada 2 sepeda motor? 🏍️🏍️","body":"✔ 4 Roda\n• 2 Roda\n• 6 Roda"},{"type":"text","title":"Petunjuk","body":"Satu motor punya 2 roda. 2 motor punya 2 + 2 = 4 roda."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapa roda pada 2 sepeda motor? 🏍️🏍️"]', '["counting-10"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-4-5-002-3'
   WHERE m.id = 'math-4-5-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'indo-4-5-001', 'indonesian', 'Mengenal Suku Kata Terbuka BA, BI, BU, BE, BO', 'Menggabungkan huruf konsonan B dengan vokal menjadi kata bermakna seperti Bola dan Buku!', 4, 5, 'developing', 8, '["Menggabungkan huruf B dengan vokal: BA, BI, BU, BE, BO","Membaca kata sederhana 2 suku kata: BOLA, BUKU, BAJU"]', '["syllable-formation","early-reading"]', '["indo-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-001-1', 'indo-4-5-001', 'B Bertemu Teman Vokal', '[{"type":"text","title":"B Bertemu Teman Vokal","body":"B bertemu A jadi BA! B bertemu U jadi BU! B bertemu O jadi BO!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-001-2', 'indo-4-5-001', 'Sentuh Suku Kata', '[{"type":"text","title":"Sentuh Suku Kata","body":"Sentuh suku katanya untuk mendengarkan bunyinya!\n👕 BA - Baju — B - A dibaca BA! BA untuk Baju!\n⭐ BI - Bintang — B - I dibaca BI! BI untuk Bintang!\n📚 BU - Buku — B - U dibaca BU! BU untuk Buku!\n⚽ BO - Bola — B - O dibaca BO! BO untuk Bola!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-001-3', 'indo-4-5-001', '10 Soal Suku Kata BA-BI-BU-BE-BO', '[{"type":"quiz","title":"10 Soal Suku Kata BA-BI-BU-BE-BO","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-001-4', 'indo-4-5-001', 'Kamu Sudah Bisa Merangkai Kata!', '[{"type":"text","title":"Kamu Sudah Bisa Merangkai Kata!","body":"Horeee! Membaca BA-BI-BU-BE-BO membuatmu semakin lancar membaca kata!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-01', l.id, m.category_id, 'Kata ''BOLA'' diawali dengan suku kata apa? ⚽', 'indo-4-5-001-latihan-01', 'Kata BOLA diawali suku kata apa?', '[{"type":"question","title":"Kata ''BOLA'' diawali dengan suku kata apa? ⚽","body":"✔ BO\n• BA\n• BU"},{"type":"text","title":"Petunjuk","body":"B digabung dengan O berbunyi BO."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''BOLA'' diawali dengan suku kata apa? ⚽"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-02', l.id, m.category_id, 'Kata ''BUKU'' diawali dengan suku kata apa? 📚', 'indo-4-5-001-latihan-02', 'Kata BUKU diawali suku kata apa?', '[{"type":"question","title":"Kata ''BUKU'' diawali dengan suku kata apa? 📚","body":"✔ BU\n• BI\n• BA"},{"type":"text","title":"Petunjuk","body":"B digabung dengan U berbunyi BU."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''BUKU'' diawali dengan suku kata apa? 📚"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-03', l.id, m.category_id, 'Kata ''BAJU'' diawali dengan suku kata apa? 👕', 'indo-4-5-001-latihan-03', 'Kata BAJU diawali suku kata apa?', '[{"type":"question","title":"Kata ''BAJU'' diawali dengan suku kata apa? 👕","body":"✔ BA\n• BE\n• BO"},{"type":"text","title":"Petunjuk","body":"B digabung dengan A berbunyi BA."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''BAJU'' diawali dengan suku kata apa? 👕"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-04', l.id, m.category_id, 'Bila huruf B digabung dengan I, dibaca apa?', 'indo-4-5-001-latihan-04', 'Huruf B ditambah huruf I dibaca apa?', '[{"type":"question","title":"Bila huruf B digabung dengan I, dibaca apa?","body":"✔ BI\n• BU\n• BA"},{"type":"text","title":"Petunjuk","body":"B - I dibaca BI seperti Bintang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila huruf B digabung dengan I, dibaca apa?"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-05', l.id, m.category_id, 'Suku kata BA digabung dengan JU menjadi kata...?', 'indo-4-5-001-latihan-05', 'BA digabung JU menjadi kata apa?', '[{"type":"question","title":"Suku kata BA digabung dengan JU menjadi kata...?","body":"✔ BAJU 👕\n• BATU 🪨\n• BOLA ⚽"},{"type":"text","title":"Petunjuk","body":"Pakaian yang kita pakai sehari-hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Suku kata BA digabung dengan JU menjadi kata...?"]', '["early-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-06', l.id, m.category_id, 'Suku kata BO digabung dengan LA menjadi kata...?', 'indo-4-5-001-latihan-06', 'BO digabung LA menjadi kata apa?', '[{"type":"question","title":"Suku kata BO digabung dengan LA menjadi kata...?","body":"✔ BOLA ⚽\n• BUKU 📚\n• BOTOL 🍼"},{"type":"text","title":"Petunjuk","body":"Benda bulat untuk ditendang saat main sepak bola."}]', '', '', m.age_min, m.age_max, 'beginner', '["Suku kata BO digabung dengan LA menjadi kata...?"]', '["early-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-07', l.id, m.category_id, 'Bila B bertemu E, dibaca...?', 'indo-4-5-001-latihan-07', 'Bila huruf B bertemu E, dibaca apa?', '[{"type":"question","title":"Bila B bertemu E, dibaca...?","body":"✔ BE\n• BO\n• BA"},{"type":"text","title":"Petunjuk","body":"B - E dibaca BE seperti Bebek."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila B bertemu E, dibaca...?"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-08', l.id, m.category_id, 'Kata ''BINTANG'' diawali dengan suku kata apa? ⭐', 'indo-4-5-001-latihan-08', 'Kata Bintang diawali suku kata apa?', '[{"type":"question","title":"Kata ''BINTANG'' diawali dengan suku kata apa? ⭐","body":"✔ BI\n• BA\n• BU"},{"type":"text","title":"Petunjuk","body":"B - I berbunyi BI."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata ''BINTANG'' diawali dengan suku kata apa? ⭐"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-09', l.id, m.category_id, 'Susun suku kata ini menjadi kata benda: KU + BU 📚', 'indo-4-5-001-latihan-09', 'Susun suku kata BU dan KU menjadi kata benda apa?', '[{"type":"question","title":"Susun suku kata ini menjadi kata benda: KU + BU 📚","body":"✔ BUKU 📚\n• KUBU\n• KUKU 💅"},{"type":"text","title":"Petunjuk","body":"BU dulu, lalu KU = BUKU."}]', '', '', m.age_min, m.age_max, 'developing', '["Susun suku kata ini menjadi kata benda: KU + BU 📚"]', '["early-reading"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-001-latihan-10', l.id, m.category_id, 'Kata ''BEBEK'' diawali dengan suku kata...?', 'indo-4-5-001-latihan-10', 'Kata Bebek diawali suku kata apa?', '[{"type":"question","title":"Kata ''BEBEK'' diawali dengan suku kata...?","body":"✔ BE 🦆\n• BO\n• BU"},{"type":"text","title":"Petunjuk","body":"B - E berbunyi BE."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''BEBEK'' diawali dengan suku kata...?"]', '["syllable-formation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-001-3'
   WHERE m.id = 'indo-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'indo-4-5-002', 'indonesian', 'Tiga Kata Ajaib: Tolong, Maaf, Terima Kasih', 'Belajar mengucapkan kata-kata sopan dalam pergaulan sehari-hari bersama teman dan keluarga.', 4, 5, 'developing', 7, '["Mengucapkan kata ''Tolong'' saat meminta bantuan","Mengucapkan ''Terima Kasih'' setelah dibantu atau diberi hadiah","Mengucapkan ''Maaf'' saat melakukan kesalahan"]', '["polite-words","social-etiquette"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-002-1', 'indo-4-5-002', 'Kata Ajaib yang Menghangatkan Hati', '[{"type":"text","title":"Kata Ajaib yang Menghangatkan Hati","body":"Tiga kata ajaib: Tolong, Maaf, dan Terima Kasih akan membuat semua orang tersenyum bahagia!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-002-2', 'indo-4-5-002', 'Kapan Mengucapkannya?', '[{"type":"text","title":"Kapan Mengucapkannya?","body":"Sentuh situasinya untuk mengetahui kata ajaibnya!\n🤝 Saat Minta Bantuan — Ucapkan: Tolong ya Bunda!\n🎁 Saat Diberi Hadiah — Ucapkan: Terima kasih banyak!\n🥺 Saat Berbuat Salah — Ucapkan: Maafkan aku ya teman!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-002-3', 'indo-4-5-002', '10 Soal Kata Ajaib', '[{"type":"quiz","title":"10 Soal Kata Ajaib","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-4-5-002-4', 'indo-4-5-002', 'Anak Santun Juara!', '[{"type":"text","title":"Anak Santun Juara!","body":"Hebat sekali! Kamu adalah anak yang santun, ramah, dan berbudi pekerti luhur!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-01', l.id, m.category_id, 'Saat kita ingin meminta bantuan Ayah mengambil mainan di atas lemari, kita ucapkan kata apa?', 'indo-4-5-002-latihan-01', 'Saat meminta bantuan orang lain, kata apa yang kita ucapkan?', '[{"type":"question","title":"Saat kita ingin meminta bantuan Ayah mengambil mainan di atas lemari, kita ucapkan kata apa?","body":"✔ Tolong 🙏\n• Cepat! 😠\n• Maaf 🥺"},{"type":"text","title":"Petunjuk","body":"Ucapkan kata ini dengan sopan di awal kalimat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat kita ingin meminta bantuan Ayah mengambil mainan di atas lemari, kita ucapkan kata apa?"]', '["polite-words"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-02', l.id, m.category_id, 'Saat Ibu memberi kue lezat atau hadiah ulang tahun, apa yang harus kita ucapkan? 🎁', 'indo-4-5-002-latihan-02', 'Apa yang kita ucapkan saat diberi hadiah atau makanan enak?', '[{"type":"question","title":"Saat Ibu memberi kue lezat atau hadiah ulang tahun, apa yang harus kita ucapkan? 🎁","body":"✔ Terima Kasih! 😊\n• Tolong! ✋\n• Biasa saja 😒"},{"type":"text","title":"Petunjuk","body":"Ungkapan rasa syukur dan terima kasih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat Ibu memberi kue lezat atau hadiah ulang tahun, apa yang harus kita ucapkan? 🎁"]', '["polite-words"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-03', l.id, m.category_id, 'Saat tidak sengaja menabrak teman hingga pensilnya jatuh, kita segera mengucapkan...?', 'indo-4-5-002-latihan-03', 'Saat kita berbuat salah, kata ajaib apa yang kita ucapkan?', '[{"type":"question","title":"Saat tidak sengaja menabrak teman hingga pensilnya jatuh, kita segera mengucapkan...?","body":"✔ Maaf ya 🥺\n• Terima kasih 😄\n• Lari pergi 🏃"},{"type":"text","title":"Petunjuk","body":"Mengakui kesalahan dan memohon maaf."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat tidak sengaja menabrak teman hingga pensilnya jatuh, kita segera mengucapkan...?"]', '["polite-words"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-04', l.id, m.category_id, 'Bagaimana cara meminta tolong yang santun kepada Kakak?', 'indo-4-5-002-latihan-04', 'Bagaimana cara meminta tolong yang santun?', '[{"type":"question","title":"Bagaimana cara meminta tolong yang santun kepada Kakak?","body":"✔ ''Kakak, tolong bantu aku ya'' 😊\n• ''Ambilkan mainanku sekarang!'' 😠\n• ''Hei kamu, ke sini!'' 😤"},{"type":"text","title":"Petunjuk","body":"Gunakan kata tolong dengan suara yang lembut."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bagaimana cara meminta tolong yang santun kepada Kakak?"]', '["social-etiquette"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-05', l.id, m.category_id, 'Setelah teman meminjamkan krayon warnanya kepada kita, kita mengucapkan apa?', 'indo-4-5-002-latihan-05', 'Setelah dipinjami barang oleh teman, kita ucapkan apa?', '[{"type":"question","title":"Setelah teman meminjamkan krayon warnanya kepada kita, kita mengucapkan apa?","body":"✔ Terima kasih sudah meminjamkan! 🙏\n• Ini krayon jelek 😒\n• Diam saja 😶"},{"type":"text","title":"Petunjuk","body":"Ucapan terima kasih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Setelah teman meminjamkan krayon warnanya kepada kita, kita mengucapkan apa?"]', '["polite-words"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-06', l.id, m.category_id, 'Mengapa kata ''Maaf'' disebut kata ajaib?', 'indo-4-5-002-latihan-06', 'Mengapa kata maaf disebut kata ajaib?', '[{"type":"question","title":"Mengapa kata ''Maaf'' disebut kata ajaib?","body":"✔ Bisa menghapus sedih dan mendamaikan hati ❤️\n• Bisa mengeluarkan kilat ⚡\n• Bisa membuat orang tertawa keras 🤣"},{"type":"text","title":"Petunjuk","body":"Karena bisa membuat hati teman yang sedih menjadi tenang kembali."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengapa kata ''Maaf'' disebut kata ajaib?"]', '["social-etiquette"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-07', l.id, m.category_id, 'Saat kita ingin lewat di depan orang tua yang sedang duduk, kita mengucapkan permisi dan...?', 'indo-4-5-002-latihan-07', 'Apa yang kita ucapkan saat lewat di depan orang yang lebih tua?', '[{"type":"question","title":"Saat kita ingin lewat di depan orang tua yang sedang duduk, kita mengucapkan permisi dan...?","body":"✔ ''Permisi ya, Ayah/Ibu'' 🚶‍♂️\n• ''Awas lewat!'' 😠\n• Berlari kencang 🏃"},{"type":"text","title":"Petunjuk","body":"Ucapkan permisi dengan badan membungkuk sopan."}]', '', '', m.age_min, m.age_max, 'developing', '["Saat kita ingin lewat di depan orang tua yang sedang duduk, kita mengucapkan permisi dan...?"]', '["social-etiquette"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-08', l.id, m.category_id, 'Apakah anak yang suka mengucap kata ajaib disukai teman-teman?', 'indo-4-5-002-latihan-08', 'Apakah anak yang santun disukai teman-teman?', '[{"type":"question","title":"Apakah anak yang suka mengucap kata ajaib disukai teman-teman?","body":"✔ Ya, sangat disukai banyak teman! 🌟\n• Tidak disukai 😢"},{"type":"text","title":"Petunjuk","body":"Semua orang senang berteman dengan anak yang ramah dan sopan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apakah anak yang suka mengucap kata ajaib disukai teman-teman?"]', '["social-etiquette"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-09', l.id, m.category_id, 'Bimo tidak sengaja menumpahkan air minum di meja. Apa yang harus Bimo lakukan?', 'indo-4-5-002-latihan-09', 'Apa yang harus dilakukan saat tidak sengaja menumpahkan air?', '[{"type":"question","title":"Bimo tidak sengaja menumpahkan air minum di meja. Apa yang harus Bimo lakukan?","body":"✔ Minta maaf dan bantu mengelap mejanya 🧽\n• Menyalahkan orang lain 👉\n• Pura-pura tidak tahu 🙈"},{"type":"text","title":"Petunjuk","body":"Minta maaf lalu membantu membersihkan mejanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Bimo tidak sengaja menumpahkan air minum di meja. Apa yang harus Bimo lakukan?"]', '["social-etiquette"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-4-5-002-latihan-10', l.id, m.category_id, 'Tiga kata ajaib yang selalu kita ingat adalah...?', 'indo-4-5-002-latihan-10', 'Sebutkan tiga kata ajaib budi pekerti kita!', '[{"type":"question","title":"Tiga kata ajaib yang selalu kita ingat adalah...?","body":"✔ Tolong, Maaf, Terima Kasih ✨\n• Makan, Minum, Tidur 🍔\n• Lari, Lompat, Lempar ⚽"},{"type":"text","title":"Petunjuk","body":"Tolong, Maaf, dan Terima Kasih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tiga kata ajaib yang selalu kita ingat adalah...?"]', '["polite-words"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-4-5-002-3'
   WHERE m.id = 'indo-4-5-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'sci-4-5-001', 'science', 'Pertumbuhan Tanaman dari Biji Kecil 🌱', 'Melihat keajaiban biji kecil yang disiram air dan disinari matahari hingga tumbuh menjadi pohon!', 4, 5, 'developing', 8, '["Mengenal tahapan pertumbuhan tanaman: biji, tunas, daun, bunga, buah","Mengetahui kebutuhan tanaman: air, tanah, dan sinar matahari"]', '["plant-lifecycle","environmental-care"]', '["sci-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-4-5-001-1', 'sci-4-5-001', 'Biji Kecil yang Tumbuh', '[{"type":"text","title":"Biji Kecil yang Tumbuh","body":"Tanam biji di tanah yang gembur 🌱, siram dengan air segar 💧, beri sinar matahari hangat ☀️. Lihat, tunas hijau mulai muncul!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-4-5-001-2', 'sci-4-5-001', 'Kebutuhan Tanaman', '[{"type":"text","title":"Kebutuhan Tanaman","body":"Sentuh apa saja yang dibutuhkan tanaman untuk tumbuh subur!\n🪴 Tanah Subur — Tanah memberi tempat akar bertumpu dan makan!\n💧 Air Segar — Air membuat tanaman segar dan tidak layu!\n☀️ Sinar Matahari — Sinar matahari memberi energi untuk membuat makanan hijau!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-4-5-001-3', 'sci-4-5-001', '10 Soal Pertumbuhan Tanaman', '[{"type":"quiz","title":"10 Soal Pertumbuhan Tanaman","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-4-5-001-4', 'sci-4-5-001', 'Kamu Sahabat Tumbuhan!', '[{"type":"text","title":"Kamu Sahabat Tumbuhan!","body":"Luar biasa! Sekarang kamu tahu cara merawat tanaman agar tumbuh subur dan rindang!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-01', l.id, m.category_id, 'Tahap paling awal dari pertumbuhan tanaman adalah...? 🌱', 'sci-4-5-001-latihan-01', 'Tahap paling awal dari pertumbuhan tanaman adalah apa?', '[{"type":"question","title":"Tahap paling awal dari pertumbuhan tanaman adalah...? 🌱","body":"✔ Biji Kecil 🌱\n• Pohon Besar 🌳\n• Buah Matang 🍎"},{"type":"text","title":"Petunjuk","body":"Butiran kecil yang kita tanam ke dalam tanah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tahap paling awal dari pertumbuhan tanaman adalah...? 🌱"]', '["plant-lifecycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-02', l.id, m.category_id, 'Apa yang harus kita siramkan ke pot tanaman setiap hari? 💧', 'sci-4-5-001-latihan-02', 'Apa yang harus kita siramkan ke tanaman agar tidak layu?', '[{"type":"question","title":"Apa yang harus kita siramkan ke pot tanaman setiap hari? 💧","body":"✔ Air Bersih 💧\n• Minyak Goreng 🛢️\n• Susu Manis 🥛"},{"type":"text","title":"Petunjuk","body":"Cairan segar yang menyejukkan tanaman."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang harus kita siramkan ke pot tanaman setiap hari? 💧"]', '["environmental-care"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-03', l.id, m.category_id, 'Benda langit apa yang memberi cahaya hangat bagi tanaman untuk bertumbuh? ☀️', 'sci-4-5-001-latihan-03', 'Benda langit apa yang menyinari tanaman?', '[{"type":"question","title":"Benda langit apa yang memberi cahaya hangat bagi tanaman untuk bertumbuh? ☀️","body":"✔ Matahari ☀️\n• Bulan 🌙\n• Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Matahari yang terbit di pagi hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Benda langit apa yang memberi cahaya hangat bagi tanaman untuk bertumbuh? ☀️"]', '["environmental-care"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-04', l.id, m.category_id, 'Bagian tanaman yang berada di dalam tanah untuk menyerap air disebut...? 🌾', 'sci-4-5-001-latihan-04', 'Bagian tanaman yang berada di dalam tanah disebut apa?', '[{"type":"question","title":"Bagian tanaman yang berada di dalam tanah untuk menyerap air disebut...? 🌾","body":"✔ Akar\n• Daun\n• Bunga"},{"type":"text","title":"Petunjuk","body":"Akar menancap kuat di bawah tanah."}]', '', '', m.age_min, m.age_max, 'developing', '["Bagian tanaman yang berada di dalam tanah untuk menyerap air disebut...? 🌾"]', '["plant-lifecycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-05', l.id, m.category_id, 'Warna daun yang sehat dan segar pada umumnya adalah...? 🍃', 'sci-4-5-001-latihan-05', 'Warna daun yang sehat pada umumnya adalah warna apa?', '[{"type":"question","title":"Warna daun yang sehat dan segar pada umumnya adalah...? 🍃","body":"✔ Hijau Segar 🟢\n• Ungu Gelap 🟣\n• Hitam ⚫"},{"type":"text","title":"Petunjuk","body":"Warna hijau rumput yang cerah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna daun yang sehat dan segar pada umumnya adalah...? 🍃"]', '["nature-observation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-06', l.id, m.category_id, 'Apa yang terjadi bila tanaman tidak pernah disiram air berhari-hari?', 'sci-4-5-001-latihan-06', 'Apa yang terjadi bila tanaman tidak disiram air?', '[{"type":"question","title":"Apa yang terjadi bila tanaman tidak pernah disiram air berhari-hari?","body":"✔ Layu dan Kering 🥀\n• Tumbuh Cepat 🚀\n• Berubah Jadi Emas ✨"},{"type":"text","title":"Petunjuk","body":"Tanaman akan layu dan kering."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang terjadi bila tanaman tidak pernah disiram air berhari-hari?"]', '["environmental-care"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-07', l.id, m.category_id, 'Setelah tanaman berbunga indah, lama-kelamaan bunga akan berubah menjadi...? 🌸 -> 🍎', 'sci-4-5-001-latihan-07', 'Setelah berbunga, tanaman akan menghasilkan apa yang lezat?', '[{"type":"question","title":"Setelah tanaman berbunga indah, lama-kelamaan bunga akan berubah menjadi...? 🌸 -> 🍎","body":"✔ Buah Lezat 🍎\n• Batu Keras 🪨\n• Kayu Kering 🪵"},{"type":"text","title":"Petunjuk","body":"Buah manis yang bisa kita makan."}]', '', '', m.age_min, m.age_max, 'developing', '["Setelah tanaman berbunga indah, lama-kelamaan bunga akan berubah menjadi...? 🌸 -> 🍎"]', '["plant-lifecycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-08', l.id, m.category_id, 'Di manakah tempat paling baik untuk menaruh pot tanaman di rumah?', 'sci-4-5-001-latihan-08', 'Di mana tempat yang baik untuk menaruh pot tanaman?', '[{"type":"question","title":"Di manakah tempat paling baik untuk menaruh pot tanaman di rumah?","body":"✔ Halaman yang terkena sinar matahari 🏡☀️\n• Di dalam lemari pakaian yang gelap 🚪\n• Di bawah kolong tempat tidur 🛏️"},{"type":"text","title":"Petunjuk","body":"Tempat yang mendapat udara segar dan sinar matahari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Di manakah tempat paling baik untuk menaruh pot tanaman di rumah?"]', '["environmental-care"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-09', l.id, m.category_id, 'Serangga apa yang suka hinggap di bunga untuk menghisap nektar manis? 🐝', 'sci-4-5-001-latihan-09', 'Serangga apa yang suka hinggap di bunga manis?', '[{"type":"question","title":"Serangga apa yang suka hinggap di bunga untuk menghisap nektar manis? 🐝","body":"✔ Lebah dan Kupu-kupu 🐝🦋\n• Ikan Mas 🐟\n• Kucing 🐱"},{"type":"text","title":"Petunjuk","body":"Lebah menghasilkan madu yang lezat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Serangga apa yang suka hinggap di bunga untuk menghisap nektar manis? 🐝"]', '["environmental-care"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-4-5-001-latihan-10', l.id, m.category_id, 'Urutan pertumbuhan tanaman yang benar adalah...?', 'sci-4-5-001-latihan-10', 'Bagaimana urutan pertumbuhan tanaman dari awal?', '[{"type":"question","title":"Urutan pertumbuhan tanaman yang benar adalah...?","body":"✔ Biji -> Tunas -> Pohon -> Berbuah 🌱🌳🍎\n• Buah -> Biji -> Pohon -> Tunas\n• Pohon -> Tunas -> Biji"},{"type":"text","title":"Petunjuk","body":"Biji, tunas kecil, daun, lalu pohon berbuah."}]', '', '', m.age_min, m.age_max, 'developing', '["Urutan pertumbuhan tanaman yang benar adalah...?"]', '["plant-lifecycle"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-4-5-001-3'
   WHERE m.id = 'sci-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'code-4-5-001', 'coding', 'Petualangan Balok Panah Arah Bimo ➡️⬆️', 'Belajar logika arah dan urutan langkah (algoritma) untuk mengarahkan robot kelinci Bimo!', 4, 5, 'developing', 8, '["Mengenal arah: Kanan ➡️, Kiri ⬅️, Atas ⬆️, Bawah ⬇️","Menyusun urutan 2-3 langkah mencapai tujuan"]', '["spatial-logic","directional-coding"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-4-5-001-1', 'code-4-5-001', 'Menggerakkan Robot Bimo', '[{"type":"text","title":"Menggerakkan Robot Bimo","body":"Beri perintah panah: Kanan ➡️ untuk jalan ke kanan, Atas ⬆️ untuk melompat ke atas!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-4-5-001-2', 'code-4-5-001', 'Balok Panah Arah', '[{"type":"text","title":"Balok Panah Arah","body":"Sentuh setiap balok arah!\n➡️ Kanan ➡️ — Maju ke kanan!\n⬅️ Kiri ⬅️ — Maju ke kiri!\n⬆️ Atas ⬆️ — Melompat ke atas!\n⬇️ Bawah ⬇️ — Turun ke bawah!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-4-5-001-3', 'code-4-5-001', '10 Soal Balok Panah Coding', '[{"type":"quiz","title":"10 Soal Balok Panah Coding","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-code-4-5-001-4', 'code-4-5-001', 'Kamu Programmer Cilik Hebat!', '[{"type":"text","title":"Kamu Programmer Cilik Hebat!","body":"Keren sekali! Kamu sudah bisa menyusun balok panah dan berpikir seperti seorang programmer komputer cilik!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-01', l.id, m.category_id, 'Bimo ingin berjalan ke KANAN menuju wortel 🥕. Panah mana yang harus dipilih?', 'code-4-5-001-latihan-01', 'Panah mana yang menunjuk ke arah kanan?', '[{"type":"question","title":"Bimo ingin berjalan ke KANAN menuju wortel 🥕. Panah mana yang harus dipilih?","body":"✔ ➡️ (Kanan)\n• ⬅️ (Kiri)\n• ⬇️ (Bawah)"},{"type":"text","title":"Petunjuk","body":"Panah yang mengarah ke sisi kanan layar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo ingin berjalan ke KANAN menuju wortel 🥕. Panah mana yang harus dipilih?"]', '["directional-coding"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-02', l.id, m.category_id, 'Bimo ingin melompat naik ke ATAS pohon 🌳. Panah mana yang harus dipilih?', 'code-4-5-001-latihan-02', 'Panah mana yang menunjuk ke arah atas?', '[{"type":"question","title":"Bimo ingin melompat naik ke ATAS pohon 🌳. Panah mana yang harus dipilih?","body":"✔ ⬆️ (Atas)\n• ⬇️ (Bawah)\n• ➡️ (Kanan)"},{"type":"text","title":"Petunjuk","body":"Panah yang menunjuk ke langit."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo ingin melompat naik ke ATAS pohon 🌳. Panah mana yang harus dipilih?"]', '["directional-coding"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-03', l.id, m.category_id, 'Bimo ingin berbalik arah ke KIRI. Panah mana yang harus dipilih?', 'code-4-5-001-latihan-03', 'Panah mana yang menunjuk ke arah kiri?', '[{"type":"question","title":"Bimo ingin berbalik arah ke KIRI. Panah mana yang harus dipilih?","body":"✔ ⬅️ (Kiri)\n• ➡️ (Kanan)\n• ⬆️ (Atas)"},{"type":"text","title":"Petunjuk","body":"Panah yang mengarah ke sisi kiri layar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo ingin berbalik arah ke KIRI. Panah mana yang harus dipilih?"]', '["directional-coding"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-4-5-001-latihan-04', l.id, m.category_id, 'Bimo ingin turun ke BAWAH bukit. Panah mana yang harus dipilih?', 'code-4-5-001-latihan-04', 'Panah mana yang menunjuk ke arah bawah?', '[{"type":"question","title":"Bimo ingin turun ke BAWAH bukit. Panah mana yang harus dipilih?","body":"✔ ⬇️ (Bawah)\n• ⬆️ (Atas)\n• ➡️ (Kanan)"},{"type":"text","title":"Petunjuk","body":"Panah yang mengarah ke tanah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo ingin turun ke BAWAH bukit. Panah mana yang harus dipilih?"]', '["directional-coding"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-4-5-001-3'
   WHERE m.id = 'code-4-5-001';
