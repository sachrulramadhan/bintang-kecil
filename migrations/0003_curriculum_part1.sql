-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('stories', 'Cerita Anak', '', '📖', '#4DA3FF', 0, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('mathematics', 'Matematika', '', '🔢', '#4DA3FF', 1, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('science', 'Sains', '', '🔬', '#4DA3FF', 2, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('social', 'IPS', '', '🌏', '#4DA3FF', 3, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('arabic', 'Bahasa Arab', '', '🕌', '#4DA3FF', 4, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('mandarin', 'Bahasa Mandarin', '', '🀄', '#4DA3FF', 5, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('indonesian', 'Bahasa Indonesia', '', '🇮🇩', '#4DA3FF', 6, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('english', 'Bahasa Inggris', '', '🔤', '#4DA3FF', 7, 'active');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)
  VALUES ('coding', 'Coding', '', '💻', '#4DA3FF', 8, 'active');

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-2-3-001', 'mathematics', 'Mengenal Angka 1 sampai 3', 'Mengenal bentuk angka 1, 2, dan 3 dengan buah-buahan lezat!', 2, 3, 'beginner', 6, '["Mengenali bentuk visual angka 1, 2, dan 3","Menghitung benda nyata hingga 3 butir buah"]', '["number-recognition","counting"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-001-1', 'math-2-3-001', 'Halo Angka 1, 2, dan 3!', '[{"type":"text","title":"Halo Angka 1, 2, dan 3!","body":"1 seperti pensil tegak, 2 seperti bebek berenang di air, 3 seperti burung terbang di angkasa!"}]', 0, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-001-2', 'math-2-3-001', 'Sentuh dan Hitung Buahnya!', '[{"type":"text","title":"Sentuh dan Hitung Buahnya!","body":"Sentuh buah di bawah ini untuk mendengar suaranya!\n🍎 Satu Apel — Satu apel merah segar!\n🍌🍌 Dua Pisang — Dua pisang kuning manis!\n🍊🍊🍊 Tiga Jeruk — Tiga jeruk manis berair!"}]', 1, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-001-3', 'math-2-3-001', 'Tebak Banyaknya Buah', '[{"type":"game","title":"Tebak Banyaknya Buah","body":"word-image"}]', 2, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-001-4', 'math-2-3-001', '10 Soal Latihan Angka 1-3', '[{"type":"quiz","title":"10 Soal Latihan Angka 1-3","body":"10 soal latihan"}]', 3, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-001-5', 'math-2-3-001', 'Hebat! Kamu Mengenal 1, 2, 3!', '[{"type":"text","title":"Hebat! Kamu Mengenal 1, 2, 3!","body":"Luar biasa! Sekarang kamu sudah bisa menghitung 1, 2, dan 3 buah!"}]', 4, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-01', l.id, m.category_id, 'Manakah yang berjumlah SATU (1)?', 'math-2-3-001-latihan-01', 'Manakah yang berjumlah satu?', '[{"type":"question","title":"Manakah yang berjumlah SATU (1)?","body":"✔ 1 Apel\n• 2 Apel\n• 3 Apel"},{"type":"text","title":"Petunjuk","body":"Cari buah yang hanya ada satu biji sendirian."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah yang berjumlah SATU (1)?"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-02', l.id, m.category_id, 'Berapa banyak buah pisang ini? 🍌🍌', 'math-2-3-001-latihan-02', 'Ada berapa buah pisang ini?', '[{"type":"question","title":"Berapa banyak buah pisang ini? 🍌🍌","body":"✔ 2 Pisang\n• 1 Pisang\n• 3 Pisang"},{"type":"text","title":"Petunjuk","body":"Hitung pelan-pelan: satu... dua!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa banyak buah pisang ini? 🍌🍌"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-03', l.id, m.category_id, 'Mana angka yang berbentuk seperti bebek berenang?', 'math-2-3-001-latihan-03', 'Mana angka dua yang meliuk seperti bebek?', '[{"type":"question","title":"Mana angka yang berbentuk seperti bebek berenang?","body":"✔ Angka 2\n• Angka 1\n• Angka 3"},{"type":"text","title":"Petunjuk","body":"Angka 2 punya leher melengkung dan ekor lurus di bawah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mana angka yang berbentuk seperti bebek berenang?"]', '["number-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-04', l.id, m.category_id, 'Ada berapa jeruk manis di sini? 🍊🍊🍊', 'math-2-3-001-latihan-04', 'Ada berapa jeruk manis di sini?', '[{"type":"question","title":"Ada berapa jeruk manis di sini? 🍊🍊🍊","body":"✔ 3 Jeruk\n• 1 Jeruk\n• 2 Jeruk"},{"type":"text","title":"Petunjuk","body":"Hitung: satu, dua, tiga!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Ada berapa jeruk manis di sini? 🍊🍊🍊"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-05', l.id, m.category_id, 'Manakah angka yang lurus seperti pensil tegak?', 'math-2-3-001-latihan-05', 'Manakah angka yang lurus seperti pensil tegak?', '[{"type":"question","title":"Manakah angka yang lurus seperti pensil tegak?","body":"✔ Angka 1\n• Angka 3\n• Angka 2"},{"type":"text","title":"Petunjuk","body":"Angka paling pertama yang sangat tegak."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah angka yang lurus seperti pensil tegak?"]', '["number-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-06', l.id, m.category_id, 'Bimo punya 1 wortel, lalu diberi 1 wortel lagi oleh Ibu 🥕🥕. Berapa wortel Bimo sekarang?', 'math-2-3-001-latihan-06', 'Satu wortel ditambah satu wortel jadi berapa?', '[{"type":"question","title":"Bimo punya 1 wortel, lalu diberi 1 wortel lagi oleh Ibu 🥕🥕. Berapa wortel Bimo sekarang?","body":"✔ 2 Wortel\n• 1 Wortel\n• 3 Wortel"},{"type":"text","title":"Petunjuk","body":"Satu ditambah satu sama dengan dua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo punya 1 wortel, lalu diberi 1 wortel lagi oleh Ibu 🥕🥕. Berapa wortel Bimo sekarang?"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-07', l.id, m.category_id, 'Mana jari tangan yang menunjukkan angka TIGA? ✌️☝️', 'math-2-3-001-latihan-07', 'Mana yang menunjukkan tiga jari?', '[{"type":"question","title":"Mana jari tangan yang menunjukkan angka TIGA? ✌️☝️","body":"✔ 3 Jari\n• 1 Jari\n• 2 Jari"},{"type":"text","title":"Petunjuk","body":"Tiga jari terangkat ke atas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mana jari tangan yang menunjukkan angka TIGA? ✌️☝️"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-08', l.id, m.category_id, 'Berapa banyak matahari di langit siang hari? ☀️', 'math-2-3-001-latihan-08', 'Berapa banyak matahari di langit siang hari?', '[{"type":"question","title":"Berapa banyak matahari di langit siang hari? ☀️","body":"✔ 1 Matahari\n• 2 Matahari\n• 3 Matahari"},{"type":"text","title":"Petunjuk","body":"Matahari kita hanya ada satu yang bersinar terang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa banyak matahari di langit siang hari? ☀️"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-09', l.id, m.category_id, 'Berapa jumlah telinga kelinci Bimo? 🐰', 'math-2-3-001-latihan-09', 'Berapa jumlah telinga kelinci Bimo?', '[{"type":"question","title":"Berapa jumlah telinga kelinci Bimo? 🐰","body":"✔ 2 Telinga\n• 1 Telinga\n• 3 Telinga"},{"type":"text","title":"Petunjuk","body":"Kelinci punya telinga di kanan dan kiri, jadi ada dua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa jumlah telinga kelinci Bimo? 🐰"]', '["counting"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-001-latihan-10', l.id, m.category_id, 'Urutan angka berhitung yang benar adalah...?', 'math-2-3-001-latihan-10', 'Urutan angka berhitung dari awal yang benar adalah?', '[{"type":"question","title":"Urutan angka berhitung yang benar adalah...?","body":"✔ 1, 2, 3\n• 3, 2, 1\n• 2, 1, 3"},{"type":"text","title":"Petunjuk","body":"Mulai dari satu, lalu dua, lalu tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["Urutan angka berhitung yang benar adalah...?"]', '["number-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-001-4'
   WHERE m.id = 'math-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-2-3-002', 'mathematics', 'Membedakan Besar dan Kecil', 'Melihat perbedaan ukuran benda bersama Gajah yang besar dan Semut yang kecil!', 2, 3, 'beginner', 6, '["Memahami konsep perbandingan ukuran ''besar'' dan ''kecil''","Mengelompokkan objek berdasarkan ukuran relatif"]', '["size-comparison","visual-discrimination"]', '["math-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-002-1', 'math-2-3-002', 'Gajah Besar dan Semut Kecil', '[{"type":"text","title":"Gajah Besar dan Semut Kecil","body":"Besar artinya memakan tempat banyak, kecil artinya imut dan pas di telapak tangan."}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-002-2', 'math-2-3-002', 'Sentuh Ukuran Benda', '[{"type":"text","title":"Sentuh Ukuran Benda","body":"Sentuh hewan-hewan ini untuk melihat ukurannya!\n🐘 Gajah Besar — Gajah besar sekali!\n🐜 Semut Kecil — Semut imut dan kecil!\n🍉 Semangka Besar — Semangka bulat besar!\n🍓 Stroberi Kecil — Stroberi mungil kecil!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-002-3', 'math-2-3-002', '10 Soal Besar dan Kecil', '[{"type":"quiz","title":"10 Soal Besar dan Kecil","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-2-3-002-4', 'math-2-3-002', 'Pintar! Kamu Sudah Tahu Besar & Kecil', '[{"type":"text","title":"Pintar! Kamu Sudah Tahu Besar & Kecil","body":"Wah hebat! Sekarang kamu bisa membedakan benda besar dan kecil di rumahmu!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-01', l.id, m.category_id, 'Manakah bola yang paling BESAR?', 'math-2-3-002-latihan-01', 'Manakah bola yang paling besar?', '[{"type":"question","title":"Manakah bola yang paling BESAR?","body":"✔ Bola Sepak Besar\n• Kelereng Kecil"},{"type":"text","title":"Petunjuk","body":"Pilih bola yang ukurannya paling raksasa."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah bola yang paling BESAR?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-02', l.id, m.category_id, 'Manakah hewan yang paling KECIL?', 'math-2-3-002-latihan-02', 'Manakah hewan yang kecil imut?', '[{"type":"question","title":"Manakah hewan yang paling KECIL?","body":"✔ Semut Kecil\n• Gajah Besar"},{"type":"text","title":"Petunjuk","body":"Hewan yang bisa berjalan di atas daun."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah hewan yang paling KECIL?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-03', l.id, m.category_id, 'Di antara buah ini, mana buah yang BESAR?', 'math-2-3-002-latihan-03', 'Mana buah yang besar?', '[{"type":"question","title":"Di antara buah ini, mana buah yang BESAR?","body":"✔ Semangka\n• Anggur"},{"type":"text","title":"Petunjuk","body":"Semangka sangat berat dan besar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Di antara buah ini, mana buah yang BESAR?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-04', l.id, m.category_id, 'Mana yang KECIL di antara pohon dan bunga? 🌳🌸', 'math-2-3-002-latihan-04', 'Mana yang kecil antara pohon dan bunga?', '[{"type":"question","title":"Mana yang KECIL di antara pohon dan bunga? 🌳🌸","body":"✔ Bunga Mungil\n• Pohon Tinggi"},{"type":"text","title":"Petunjuk","body":"Bunga mungil dan cantik di kebun."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mana yang KECIL di antara pohon dan bunga? 🌳🌸"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-05', l.id, m.category_id, 'Kendaraan mana yang paling BESAR?', 'math-2-3-002-latihan-05', 'Kendaraan mana yang paling besar?', '[{"type":"question","title":"Kendaraan mana yang paling BESAR?","body":"✔ Bus Besar\n• Sepeda Kecil"},{"type":"text","title":"Petunjuk","body":"Bus muat banyak penumpang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kendaraan mana yang paling BESAR?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-06', l.id, m.category_id, 'Bimo punya kotak susu mini dan galon air besar. Mana yang KECIL?', 'math-2-3-002-latihan-06', 'Mana yang kecil antara kotak susu mini dan galon air?', '[{"type":"question","title":"Bimo punya kotak susu mini dan galon air besar. Mana yang KECIL?","body":"✔ Kotak Susu Mini\n• Galon Air"},{"type":"text","title":"Petunjuk","body":"Kotak susu mini pas dipegang tangan anak."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bimo punya kotak susu mini dan galon air besar. Mana yang KECIL?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-07', l.id, m.category_id, 'Mana hewan yang BESAR di lautan?', 'math-2-3-002-latihan-07', 'Mana hewan laut yang berbadan sangat besar?', '[{"type":"question","title":"Mana hewan yang BESAR di lautan?","body":"✔ Ikan Paus Raksasa\n• Ikan Mas Kecil"},{"type":"text","title":"Petunjuk","body":"Ikan paus ukurannya raksasa."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mana hewan yang BESAR di lautan?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-08', l.id, m.category_id, 'Manakah rumah yang KECIL?', 'math-2-3-002-latihan-08', 'Manakah rumah yang kecil?', '[{"type":"question","title":"Manakah rumah yang KECIL?","body":"✔ Sarang Burung\n• Gedung Bertingkat"},{"type":"text","title":"Petunjuk","body":"Rumah burung mungil di atas pohon."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah rumah yang KECIL?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-09', l.id, m.category_id, 'Bila Bimo berdiri di samping Gajah, siapa yang lebih KECIL?', 'math-2-3-002-latihan-09', 'Siapa yang lebih kecil antara Bimo kelinci dan Gajah?', '[{"type":"question","title":"Bila Bimo berdiri di samping Gajah, siapa yang lebih KECIL?","body":"✔ Kelinci Bimo\n• Gajah"},{"type":"text","title":"Petunjuk","body":"Kelinci Bimo imut dan lincah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila Bimo berdiri di samping Gajah, siapa yang lebih KECIL?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-2-3-002-latihan-10', l.id, m.category_id, 'Mana piring yang paling cocok untuk meletakkan semangka besar?', 'math-2-3-002-latihan-10', 'Piring mana yang cocok untuk semangka besar?', '[{"type":"question","title":"Mana piring yang paling cocok untuk meletakkan semangka besar?","body":"✔ Piring Besar\n• Cangkir Teh Kecil"},{"type":"text","title":"Petunjuk","body":"Benda besar butuh wadah yang besar pula."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mana piring yang paling cocok untuk meletakkan semangka besar?"]', '["size-comparison"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-2-3-002-3'
   WHERE m.id = 'math-2-3-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'indo-2-3-001', 'indonesian', 'Mengenal Huruf Vokal A, I, U, E, O', 'Membuka mulut gembira menirukan bunyi vokal bersama lagu ceria!', 2, 3, 'beginner', 7, '["Mengenal 5 bunyi vokal dasar bahasa Indonesia","Melatih artikulasi mulut: A, I, U, E, O"]', '["phonics-vowels","speech-articulation"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-001-1', 'indo-2-3-001', 'Bernyanyi A - I - U - E - O', '[{"type":"text","title":"Bernyanyi A - I - U - E - O","body":"A = Apel, I = Ikan, U = Ulat, E = Elang, O = Obat."}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-001-2', 'indo-2-3-001', 'Sentuh Huruf A I U E O', '[{"type":"text","title":"Sentuh Huruf A I U E O","body":"Sentuh huruf-huruf vokal ini!\n🍎 A - Apel — Aaa! A untuk Apel!\n🐟 I - Ikan — Iii! I untuk Ikan berenang!\n🐛 U - Ulat — Uuu! U untuk Ulat daun!\n🦅 E - Elang — Eee! E untuk Elang gagah!\n💊 O - Obat — Ooo! O untuk Obat sehat!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-001-3', 'indo-2-3-001', '10 Soal Huruf Vokal', '[{"type":"quiz","title":"10 Soal Huruf Vokal","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-001-4', 'indo-2-3-001', 'Hebat! Kamu Hafal A-I-U-E-O!', '[{"type":"text","title":"Hebat! Kamu Hafal A-I-U-E-O!","body":"Keren sekali! Sekarang kamu sudah hafal kelima sahabat vokal A, I, U, E, dan O!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-01', l.id, m.category_id, 'Kata ''APEL'' dimulai dengan huruf apa? 🍎', 'indo-2-3-001-latihan-01', 'Kata Apel dimulai dengan huruf apa?', '[{"type":"question","title":"Kata ''APEL'' dimulai dengan huruf apa? 🍎","body":"✔ Huruf A\n• Huruf I\n• Huruf U"},{"type":"text","title":"Petunjuk","body":"Buka mulutmu lebar: Aaa!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''APEL'' dimulai dengan huruf apa? 🍎"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-02', l.id, m.category_id, 'Kata ''IKAN'' dimulai dengan huruf apa? 🐟', 'indo-2-3-001-latihan-02', 'Kata Ikan dimulai dengan huruf apa?', '[{"type":"question","title":"Kata ''IKAN'' dimulai dengan huruf apa? 🐟","body":"✔ Huruf I\n• Huruf A\n• Huruf O"},{"type":"text","title":"Petunjuk","body":"Tersenyumlah saat membunyikannya: Iii!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''IKAN'' dimulai dengan huruf apa? 🐟"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-03', l.id, m.category_id, 'Kata ''ULAT'' dimulai dengan huruf vokal apa? 🐛', 'indo-2-3-001-latihan-03', 'Kata Ulat dimulai dengan huruf apa?', '[{"type":"question","title":"Kata ''ULAT'' dimulai dengan huruf vokal apa? 🐛","body":"✔ Huruf U\n• Huruf E\n• Huruf A"},{"type":"text","title":"Petunjuk","body":"Bibir dimoncongkan ke depan: Uuu!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''ULAT'' dimulai dengan huruf vokal apa? 🐛"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-04', l.id, m.category_id, 'Kata ''ELANG'' dimulai dengan huruf apa? 🦅', 'indo-2-3-001-latihan-04', 'Kata Elang dimulai dengan huruf apa?', '[{"type":"question","title":"Kata ''ELANG'' dimulai dengan huruf apa? 🦅","body":"✔ Huruf E\n• Huruf O\n• Huruf I"},{"type":"text","title":"Petunjuk","body":"Bunyikan huruf E."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''ELANG'' dimulai dengan huruf apa? 🦅"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-05', l.id, m.category_id, 'Kata ''OBAT'' dimulai dengan huruf apa? 💊', 'indo-2-3-001-latihan-05', 'Kata Obat dimulai dengan huruf apa?', '[{"type":"question","title":"Kata ''OBAT'' dimulai dengan huruf apa? 💊","body":"✔ Huruf O\n• Huruf U\n• Huruf A"},{"type":"text","title":"Petunjuk","body":"Bentuk mulut bulat seperti donat: Ooo!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''OBAT'' dimulai dengan huruf apa? 💊"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-06', l.id, m.category_id, 'Berapa jumlah semua huruf vokal (A, I, U, E, O)?', 'indo-2-3-001-latihan-06', 'Berapa jumlah semua huruf vokal?', '[{"type":"question","title":"Berapa jumlah semua huruf vokal (A, I, U, E, O)?","body":"✔ 5 Huruf\n• 3 Huruf\n• 2 Huruf"},{"type":"text","title":"Petunjuk","body":"Satu, dua, tiga, empat, lima!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa jumlah semua huruf vokal (A, I, U, E, O)?"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-07', l.id, m.category_id, 'Bila kita tersenyum lebar sambil bernyanyi, kita membunyikan huruf...?', 'indo-2-3-001-latihan-07', 'Bunyi huruf saat kita tersenyum manis?', '[{"type":"question","title":"Bila kita tersenyum lebar sambil bernyanyi, kita membunyikan huruf...?","body":"✔ I (Iii)\n• O (Ooo)\n• U (Uuu)"},{"type":"text","title":"Petunjuk","body":"Iii seperti saat berfoto!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Bila kita tersenyum lebar sambil bernyanyi, kita membunyikan huruf...?"]', '["speech-articulation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-08', l.id, m.category_id, 'Manakah huruf yang bentuknya bulat sempurna seperti telur? 🥚', 'indo-2-3-001-latihan-08', 'Huruf apa yang bentuknya bulat seperti telur?', '[{"type":"question","title":"Manakah huruf yang bentuknya bulat sempurna seperti telur? 🥚","body":"✔ Huruf O\n• Huruf A\n• Huruf I"},{"type":"text","title":"Petunjuk","body":"Huruf O berbentuk lingkaran bulat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah huruf yang bentuknya bulat sempurna seperti telur? 🥚"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-09', l.id, m.category_id, 'Kata ''AYAH'' diawali dengan huruf apa? 👨', 'indo-2-3-001-latihan-09', 'Kata Ayah diawali dengan huruf apa?', '[{"type":"question","title":"Kata ''AYAH'' diawali dengan huruf apa? 👨","body":"✔ Huruf A\n• Huruf I\n• Huruf E"},{"type":"text","title":"Petunjuk","body":"A untuk Ayah tercinta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''AYAH'' diawali dengan huruf apa? 👨"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-001-latihan-10', l.id, m.category_id, 'Kata ''IBU'' diawali dengan huruf apa? 👩', 'indo-2-3-001-latihan-10', 'Kata Ibu diawali dengan huruf apa?', '[{"type":"question","title":"Kata ''IBU'' diawali dengan huruf apa? 👩","body":"✔ Huruf I\n• Huruf U\n• Huruf O"},{"type":"text","title":"Petunjuk","body":"I untuk Ibu tersayang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata ''IBU'' diawali dengan huruf apa? 👩"]', '["phonics-vowels"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-001-3'
   WHERE m.id = 'indo-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'indo-2-3-002', 'indonesian', 'Suara Hewan Lucu di Peternakan', 'Mendengarkan dan meniru suara hewan-hewan lucu di sekitar kita!', 2, 3, 'beginner', 6, '["Mengenal suara kucing, sapi, bebek, kambing, dan ayam","Melatih koordinasi pendengaran dan produksi suara anak"]', '["animal-sounds","auditory-discrimination"]', '["indo-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-002-1', 'indo-2-3-002', 'Kucing Meong dan Sapi Moo', '[{"type":"text","title":"Kucing Meong dan Sapi Moo","body":"Kucing bersuara Meong Meong! Sapi bersuara Mooo! Bebek bersuara Kwek Kwek! Ayo tirukan!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-002-2', 'indo-2-3-002', 'Sentuh Hewan Lucu', '[{"type":"text","title":"Sentuh Hewan Lucu","body":"Sentuh hewannya untuk mendengar suaranya!\n🐱 Kucing — Meong meong!\n🐮 Sapi — Moooo!\n🦆 Bebek — Kwek kwek kwek!\n🐔 Ayam — Kukuruyuk!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-002-3', 'indo-2-3-002', '10 Soal Suara Hewan', '[{"type":"quiz","title":"10 Soal Suara Hewan","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-002';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-indo-2-3-002-4', 'indo-2-3-002', 'Hore! Kamu Jago Meniru Suara!', '[{"type":"text","title":"Hore! Kamu Jago Meniru Suara!","body":"Wah seru sekali! Kamu sudah bisa menirukan banyak suara hewan ternak bersama Bimo!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-01', l.id, m.category_id, 'Hewan apa yang bunyinya ''Meong... Meong...''? 🐱', 'indo-2-3-002-latihan-01', 'Hewan apa yang bunyinya meong meong?', '[{"type":"question","title":"Hewan apa yang bunyinya ''Meong... Meong...''? 🐱","body":"✔ Kucing\n• Sapi\n• Bebek"},{"type":"text","title":"Petunjuk","body":"Hewan berbulu yang suka makan ikan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hewan apa yang bunyinya ''Meong... Meong...''? 🐱"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-02', l.id, m.category_id, 'Hewan apa yang bersuara ''Mooo... Mooo...''? 🐮', 'indo-2-3-002-latihan-02', 'Hewan apa yang bersuara mooo mooo?', '[{"type":"question","title":"Hewan apa yang bersuara ''Mooo... Mooo...''? 🐮","body":"✔ Sapi\n• Ayam\n• Kucing"},{"type":"text","title":"Petunjuk","body":"Hewan penghasil susu yang gemuk."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hewan apa yang bersuara ''Mooo... Mooo...''? 🐮"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-03', l.id, m.category_id, 'Bebek yang suka berenang bersuara apa? 🦆', 'indo-2-3-002-latihan-03', 'Bebek yang suka berenang bersuara apa?', '[{"type":"question","title":"Bebek yang suka berenang bersuara apa? 🦆","body":"✔ Kwek Kwek Kwek\n• Meong Meong\n• Mooo"},{"type":"text","title":"Petunjuk","body":"Kwek kwek kwek!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Bebek yang suka berenang bersuara apa? 🦆"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-04', l.id, m.category_id, 'Suara ayam jantan di pagi hari adalah...? 🐓', 'indo-2-3-002-latihan-04', 'Bagaimana suara ayam jantan membangunkan kita di pagi hari?', '[{"type":"question","title":"Suara ayam jantan di pagi hari adalah...? 🐓","body":"✔ Kukuruyuk!\n• Guk Guk!\n• Cit Cit!"},{"type":"text","title":"Petunjuk","body":"Kukuruyuuuk!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Suara ayam jantan di pagi hari adalah...? 🐓"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-05', l.id, m.category_id, 'Kambing yang suka makan rumput bersuara... ? 🐐', 'indo-2-3-002-latihan-05', 'Bagaimana suara kambing makan rumput?', '[{"type":"question","title":"Kambing yang suka makan rumput bersuara... ? 🐐","body":"✔ Mbeeek... Mbeeek...\n• Meong Meong\n• Mooo"},{"type":"text","title":"Petunjuk","body":"Mbeeeek... mbeeeek!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Kambing yang suka makan rumput bersuara... ? 🐐"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-06', l.id, m.category_id, 'Burung kecil di pohon berkicau bersuara...? 🐦', 'indo-2-3-002-latihan-06', 'Burung kecil di pohon berkicau bagaimana?', '[{"type":"question","title":"Burung kecil di pohon berkicau bersuara...? 🐦","body":"✔ Cuit Cuit Cuit\n• Mooo Mooo\n• Kwek Kwek"},{"type":"text","title":"Petunjuk","body":"Cuit cuit cuit!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Burung kecil di pohon berkicau bersuara...? 🐦"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-07', l.id, m.category_id, 'Katak yang melompat di kolam air berbunyi apa? 🐸', 'indo-2-3-002-latihan-07', 'Katak yang melompat di kolam air berbunyi apa?', '[{"type":"question","title":"Katak yang melompat di kolam air berbunyi apa? 🐸","body":"✔ Krok... Krok...\n• Meong... Meong...\n• Guk... Guk..."},{"type":"text","title":"Petunjuk","body":"Kwek-kwek atau tebluk-tebluk!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Katak yang melompat di kolam air berbunyi apa? 🐸"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-08', l.id, m.category_id, 'Anjing yang setia menjaga rumah menggonggong bersuara...? 🐕', 'indo-2-3-002-latihan-08', 'Bagaimana suara anjing menggonggong?', '[{"type":"question","title":"Anjing yang setia menjaga rumah menggonggong bersuara...? 🐕","body":"✔ Guk Guk Guk!\n• Kukuruyuk!\n• Cuit Cuit!"},{"type":"text","title":"Petunjuk","body":"Guk guk guk!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Anjing yang setia menjaga rumah menggonggong bersuara...? 🐕"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-09', l.id, m.category_id, 'Tikus kecil yang lari imut bersuara...? 🐭', 'indo-2-3-002-latihan-09', 'Tikus kecil bersuara bagaimana?', '[{"type":"question","title":"Tikus kecil yang lari imut bersuara...? 🐭","body":"✔ Cit Cit Cit!\n• Mooo!\n• Meong!"},{"type":"text","title":"Petunjuk","body":"Cit cit cit!"}]', '', '', m.age_min, m.age_max, 'beginner', '["Tikus kecil yang lari imut bersuara...? 🐭"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-indo-2-3-002-latihan-10', l.id, m.category_id, 'Hewan apa yang bunyinya paling keras di pagi hari saat matahari terbit? 🌅', 'indo-2-3-002-latihan-10', 'Hewan apa yang berkokok saat matahari terbit?', '[{"type":"question","title":"Hewan apa yang bunyinya paling keras di pagi hari saat matahari terbit? 🌅","body":"✔ Ayam Jantan 🐓\n• Kucing 🐱\n• Ikan 🐟"},{"type":"text","title":"Petunjuk","body":"Ayam jantan berkokok kukuruyuk."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hewan apa yang bunyinya paling keras di pagi hari saat matahari terbit? 🌅"]', '["animal-sounds"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-indo-2-3-002-3'
   WHERE m.id = 'indo-2-3-002';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'sci-2-3-001', 'science', 'Terang Siang dan Gelap Malam', 'Melihat indahnya matahari di siang hari dan bulan bintang di malam hari!', 2, 3, 'beginner', 6, '["Membedakan waktu siang hari dan malam hari","Mengenal matahari, bulan, dan bintang"]', '["day-night-concept","nature-observation"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-2-3-001-1', 'sci-2-3-001', 'Matahari Terang & Bulan Damai', '[{"type":"text","title":"Matahari Terang & Bulan Damai","body":"Siang hari ada matahari yang terang benderang ☀️! Malam hari ada bulan dan bintang berkelap-kelip 🌙⭐!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-2-3-001-2', 'sci-2-3-001', 'Sentuh Langit', '[{"type":"text","title":"Sentuh Langit","body":"Sentuh benda langit ini!\n☀️ Matahari — Matahari terbit di pagi hari membawa cahaya hangat!\n🌙 Bulan — Bulan bersinar lembut di malam hari saat kita tidur nyenyak!\n⭐ Bintang — Bintang kecil berkelap-kelip di langit malam yang damai!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-2-3-001-3', 'sci-2-3-001', '10 Soal Siang dan Malam', '[{"type":"quiz","title":"10 Soal Siang dan Malam","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-2-3-001-4', 'sci-2-3-001', 'Pintar! Kamu Tahu Siang dan Malam!', '[{"type":"text","title":"Pintar! Kamu Tahu Siang dan Malam!","body":"Hebat! Kamu sekarang tahu kapan saatnya bermain di siang hari dan tidur nyenyak di malam hari!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-01', l.id, m.category_id, 'Kapan kita bisa melihat matahari yang bersinar terang? ☀️', 'sci-2-3-001-latihan-01', 'Kapan matahari bersinar terang di langit?', '[{"type":"question","title":"Kapan kita bisa melihat matahari yang bersinar terang? ☀️","body":"✔ Siang Hari ☀️\n• Malam Hari 🌙"},{"type":"text","title":"Petunjuk","body":"Saat kita bangun tidur dan berangkat bermain."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kapan kita bisa melihat matahari yang bersinar terang? ☀️"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-02', l.id, m.category_id, 'Benda langit apa yang bersinar lembut saat kita tidur di malam hari? 🌙', 'sci-2-3-001-latihan-02', 'Apa yang bersinar di langit malam hari?', '[{"type":"question","title":"Benda langit apa yang bersinar lembut saat kita tidur di malam hari? 🌙","body":"✔ Bulan 🌙\n• Matahari ☀️"},{"type":"text","title":"Petunjuk","body":"Bulan berbentuk sabit atau bulat penuh."}]', '', '', m.age_min, m.age_max, 'beginner', '["Benda langit apa yang bersinar lembut saat kita tidur di malam hari? 🌙"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-03', l.id, m.category_id, 'Kapan langit bertabur bintang-bintang kecil yang indah? ⭐', 'sci-2-3-001-latihan-03', 'Kapan bintang-bintang berkelap-kelip di langit?', '[{"type":"question","title":"Kapan langit bertabur bintang-bintang kecil yang indah? ⭐","body":"✔ Malam Hari 🌙\n• Siang Hari ☀️"},{"type":"text","title":"Petunjuk","body":"Saat langit gelap dan lampu-lampu dinyalakan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kapan langit bertabur bintang-bintang kecil yang indah? ⭐"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-04', l.id, m.category_id, 'Apa yang kita lakukan saat malam hari tiba? 😴', 'sci-2-3-001-latihan-04', 'Apa yang kita lakukan saat malam hari tiba?', '[{"type":"question","title":"Apa yang kita lakukan saat malam hari tiba? 😴","body":"✔ Tidur Nyenyak 😴\n• Bermain di Lapangan ⚽"},{"type":"text","title":"Petunjuk","body":"Tubuh kita perlu istirahat dan tidur nyenyak."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang kita lakukan saat malam hari tiba? 😴"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-05', l.id, m.category_id, 'Warna langit di siang hari yang cerah adalah...? 🌤️', 'sci-2-3-001-latihan-05', 'Warna langit di siang hari yang cerah adalah apa?', '[{"type":"question","title":"Warna langit di siang hari yang cerah adalah...? 🌤️","body":"✔ Biru Cerah 🔵\n• Hitam Gelap ⚫"},{"type":"text","title":"Petunjuk","body":"Biru cerah dengan awan putih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna langit di siang hari yang cerah adalah...? 🌤️"]', '["nature-observation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-06', l.id, m.category_id, 'Warna langit saat tengah malam adalah...? 🌌', 'sci-2-3-001-latihan-06', 'Warna langit saat tengah malam adalah apa?', '[{"type":"question","title":"Warna langit saat tengah malam adalah...? 🌌","body":"✔ Gelap / Hitam ⚫\n• Kuning Terang 🟡"},{"type":"text","title":"Petunjuk","body":"Gelap dan hitam bertabur bintang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna langit saat tengah malam adalah...? 🌌"]', '["nature-observation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-07', l.id, m.category_id, 'Apa yang membuat bumi terasa hangat di siang hari?', 'sci-2-3-001-latihan-07', 'Apa yang memberi kehangatan di bumi saat siang hari?', '[{"type":"question","title":"Apa yang membuat bumi terasa hangat di siang hari?","body":"✔ Sinar Matahari ☀️\n• Es Batu 🧊"},{"type":"text","title":"Petunjuk","body":"Cahaya matahari yang hangat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang membuat bumi terasa hangat di siang hari?"]', '["nature-observation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-08', l.id, m.category_id, 'Kapan kita menyalakan lampu kamar agar terang?', 'sci-2-3-001-latihan-08', 'Kapan kita menyalakan lampu di rumah?', '[{"type":"question","title":"Kapan kita menyalakan lampu kamar agar terang?","body":"✔ Malam Hari 🌙\n• Siang Hari Terik ☀️"},{"type":"text","title":"Petunjuk","body":"Saat hari mulai gelap di malam hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kapan kita menyalakan lampu kamar agar terang?"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-09', l.id, m.category_id, 'Hewan nokturnal seperti Burung Hantu bangun dan mencari makan di waktu...?', 'sci-2-3-001-latihan-09', 'Kapan burung hantu bangun dan terbang?', '[{"type":"question","title":"Hewan nokturnal seperti Burung Hantu bangun dan mencari makan di waktu...?","body":"✔ Malam Hari 🌙\n• Siang Hari ☀️"},{"type":"text","title":"Petunjuk","body":"Burung hantu matanya tajam di malam hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hewan nokturnal seperti Burung Hantu bangun dan mencari makan di waktu...?"]', '["nature-observation"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-2-3-001-latihan-10', l.id, m.category_id, 'Saat ayam jantan berkokok kukuruyuk, itu tandanya waktu apa tiba? 🌅', 'sci-2-3-001-latihan-10', 'Saat ayam berkokok, tanda waktu apa tiba?', '[{"type":"question","title":"Saat ayam jantan berkokok kukuruyuk, itu tandanya waktu apa tiba? 🌅","body":"✔ Pagi Hari 🌅\n• Tengah Malam 🌃"},{"type":"text","title":"Petunjuk","body":"Matahari mulai terbit di pagi hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat ayam jantan berkokok kukuruyuk, itu tandanya waktu apa tiba? 🌅"]', '["day-night-concept"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-2-3-001-3'
   WHERE m.id = 'sci-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'eng-2-3-001', 'english', 'My First Colors: Red, Blue, Yellow', 'Belajar warna dasar dalam Bahasa Inggris bersama Bimo yang ceria!', 2, 3, 'beginner', 6, '["Mengenal kata Red (Merah), Blue (Biru), dan Yellow (Kuning)","Menghubungkan warna dengan benda nyata"]', '["english-colors","vocabulary-listening"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-2-3-001-1', 'eng-2-3-001', 'Red, Blue, and Yellow!', '[{"type":"text","title":"Red, Blue, and Yellow!","body":"Red = Apel Merah 🍎 | Blue = Langit Biru 🔵 | Yellow = Pisang Kuning 🍌"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-2-3-001-2', 'eng-2-3-001', 'Touch the Colors', '[{"type":"text","title":"Touch the Colors","body":"Touch the colorful cards to hear their English names!\n🔴 Red — Red! Red is merah, like a sweet strawberry!\n🔵 Blue — Blue! Blue is biru, like the wide ocean!\n🟡 Yellow — Yellow! Yellow is kuning, like the bright sun!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-2-3-001-3', 'eng-2-3-001', '10 Soal Warna Bahasa Inggris', '[{"type":"quiz","title":"10 Soal Warna Bahasa Inggris","body":"10 soal latihan"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-eng-2-3-001-4', 'eng-2-3-001', 'Good Job! Colors Master!', '[{"type":"text","title":"Good Job! Colors Master!","body":"Good job! You know Red, Blue, and Yellow! You are very smart!"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-01', l.id, m.category_id, 'Warna ''RED'' dalam bahasa Indonesia adalah...?', 'eng-2-3-001-latihan-01', 'What color is red in Indonesian?', '[{"type":"question","title":"Warna ''RED'' dalam bahasa Indonesia adalah...?","body":"✔ Merah 🔴\n• Biru 🔵\n• Kuning 🟡"},{"type":"text","title":"Petunjuk","body":"Warna buah apel dan stroberi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna ''RED'' dalam bahasa Indonesia adalah...?"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-02', l.id, m.category_id, 'Warna ''BLUE'' dalam bahasa Indonesia artinya...?', 'eng-2-3-001-latihan-02', 'What color is blue in Indonesian?', '[{"type":"question","title":"Warna ''BLUE'' dalam bahasa Indonesia artinya...?","body":"✔ Biru 🔵\n• Merah 🔴\n• Kuning 🟡"},{"type":"text","title":"Petunjuk","body":"Warna langit yang cerah dan lautan luas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna ''BLUE'' dalam bahasa Indonesia artinya...?"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-03', l.id, m.category_id, 'Warna ''YELLOW'' dalam bahasa Indonesia adalah...?', 'eng-2-3-001-latihan-03', 'What color is yellow in Indonesian?', '[{"type":"question","title":"Warna ''YELLOW'' dalam bahasa Indonesia adalah...?","body":"✔ Kuning 🟡\n• Biru 🔵\n• Merah 🔴"},{"type":"text","title":"Petunjuk","body":"Warna buah pisang dan sinar matahari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna ''YELLOW'' dalam bahasa Indonesia adalah...?"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-04', l.id, m.category_id, 'What color is this apple? 🍎', 'eng-2-3-001-latihan-04', 'What color is this apple?', '[{"type":"question","title":"What color is this apple? 🍎","body":"✔ Red 🔴\n• Blue 🔵\n• Yellow 🟡"},{"type":"text","title":"Petunjuk","body":"It is red like a heart."}]', '', '', m.age_min, m.age_max, 'beginner', '["What color is this apple? 🍎"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-05', l.id, m.category_id, 'What color is the banana? 🍌', 'eng-2-3-001-latihan-05', 'What color is the banana?', '[{"type":"question","title":"What color is the banana? 🍌","body":"✔ Yellow 🍌\n• Red 🍎\n• Blue 🌊"},{"type":"text","title":"Petunjuk","body":"Bananas are yellow."}]', '', '', m.age_min, m.age_max, 'beginner', '["What color is the banana? 🍌"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-06', l.id, m.category_id, 'What color is the sea ocean water? 🌊', 'eng-2-3-001-latihan-06', 'What color is the sea ocean water?', '[{"type":"question","title":"What color is the sea ocean water? 🌊","body":"✔ Blue 🌊\n• Yellow 🟡\n• Red 🔴"},{"type":"text","title":"Petunjuk","body":"The sea is blue."}]', '', '', m.age_min, m.age_max, 'beginner', '["What color is the sea ocean water? 🌊"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-07', l.id, m.category_id, 'Which one is RED? 🍓 vs 🍌', 'eng-2-3-001-latihan-07', 'Which fruit is red?', '[{"type":"question","title":"Which one is RED? 🍓 vs 🍌","body":"✔ Strawberry 🍓\n• Banana 🍌"},{"type":"text","title":"Petunjuk","body":"Strawberry is red."}]', '', '', m.age_min, m.age_max, 'beginner', '["Which one is RED? 🍓 vs 🍌"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-eng-2-3-001-latihan-08', l.id, m.category_id, 'Which one is YELLOW? ☀️ vs 🌊', 'eng-2-3-001-latihan-08', 'Which one is yellow?', '[{"type":"question","title":"Which one is YELLOW? ☀️ vs 🌊","body":"✔ Sun ☀️\n• Ocean 🌊"},{"type":"text","title":"Petunjuk","body":"The shining sun is yellow."}]', '', '', m.age_min, m.age_max, 'beginner', '["Which one is YELLOW? ☀️ vs 🌊"]', '["english-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-eng-2-3-001-3'
   WHERE m.id = 'eng-2-3-001';
