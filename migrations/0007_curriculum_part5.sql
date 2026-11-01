-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-06', l.id, m.category_id, 'Pernyataan: ''10 == 12'' (Sepuluh sama dengan dua belas). Apakah bernilai True atau False?', 'code-8-10-001-latihan-06', 'Apakah sepuluh sama dengan dua belas itu benar atau salah?', '[{"type":"question","title":"Pernyataan: ''10 == 12'' (Sepuluh sama dengan dua belas). Apakah bernilai True atau False?","body":"✔ False (Salah) ❌\n• True (Benar) ✅"},{"type":"text","title":"Petunjuk","body":"Sepuluh tidak sama dengan dua belas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pernyataan: ''10 == 12'' (Sepuluh sama dengan dua belas). Apakah bernilai True atau False?"]', '["boolean-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-07', l.id, m.category_id, 'Kode game: IF nyawa <= 0 MAKA...?', 'code-8-10-001-latihan-07', 'Bila nyawa pemain sudah nol atau kurang, apa yang terjadi dalam game?', '[{"type":"question","title":"Kode game: IF nyawa <= 0 MAKA...?","body":"✔ Game Over 💀\n• Menang Juara 1 🏆\n• Naik Level 🚀\n• Mendapat Koin Tambahan 🪙"},{"type":"text","title":"Petunjuk","body":"Game Over (Permainan Selesai)."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kode game: IF nyawa <= 0 MAKA...?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-08', l.id, m.category_id, 'Kata kunci ''ELSE'' dalam bahasa pemrograman artinya adalah...?', 'code-8-10-001-latihan-08', 'Kata kunci ELSE artinya apa?', '[{"type":"question","title":"Kata kunci ''ELSE'' dalam bahasa pemrograman artinya adalah...?","body":"✔ Jika Tidak / Selain Itu 🔄\n• Ulangi Lagi 🔁\n• Mulai Program ▶️\n• Hapus File 🗑️"},{"type":"text","title":"Petunjuk","body":"Jika kondisi pertama tidak terpenuhi (Jika tidak / Selain itu)."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata kunci ''ELSE'' dalam bahasa pemrograman artinya adalah...?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-09', l.id, m.category_id, 'Kondisi: JIKA koin >= 50 DAN level >= 5 MAKA buka kunci ''Topi Emas''. Bimo punya 60 koin dan level 6. Apakah topi terbuka?', 'code-8-10-001-latihan-09', 'Apakah Bimo berhasil membuka Topi Emas?', '[{"type":"question","title":"Kondisi: JIKA koin >= 50 DAN level >= 5 MAKA buka kunci ''Topi Emas''. Bimo punya 60 koin dan level 6. Apakah topi terbuka?","body":"✔ Ya, Topi Emas terbuka! 👑🎉\n• Tidak, masih terkunci 🔒"},{"type":"text","title":"Petunjuk","body":"Kedua syarat terpenuhi (60 >= 50 dan 6 >= 5)."}]', '', '', m.age_min, m.age_max, 'developing', '["Kondisi: JIKA koin >= 50 DAN level >= 5 MAKA buka kunci ''Topi Emas''. Bimo punya 60 koin dan level 6. Apakah topi terbuka?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-code-8-10-001-latihan-10', l.id, m.category_id, 'Mengapa logika If-Else sangat penting dalam pembuatan aplikasi pintar dan robot?', 'code-8-10-001-latihan-10', 'Mengapa logika percabangan penting dalam teknologi?', '[{"type":"question","title":"Mengapa logika If-Else sangat penting dalam pembuatan aplikasi pintar dan robot?","body":"✔ Supaya aplikasi bisa mengambil keputusan otomatis yang cerdas 🧠🤖\n• Hanya untuk menghias tampilan saja 🎨\n• Tidak ada manfaatnya 🤷"},{"type":"text","title":"Petunjuk","body":"Agar aplikasi bisa merespons tindakan pengguna secara otomatis dan tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengapa logika If-Else sangat penting dalam pembuatan aplikasi pintar dan robot?"]', '["conditional-logic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-code-8-10-001-3'
   WHERE m.id = 'code-8-10-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'math-11-12-001', 'mathematics', 'Persentase, Bilangan Desimal & Perbandingan Rasio 📊', 'Menghitung diskon belanja, persen nilai, desimal, dan perbandingan rasio dalam kehidupan sehari-hari!', 11, 12, 'advanced', 15, '["Mengubah pecahan menjadi persentase dan desimal (1/2 = 50% = 0,5)","Menghitung diskon harga barang dan persentase keuntungan"]', '["percentages","decimals","ratios"]', '["math-8-10-002"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-11-12-001-1', 'math-11-12-001', 'Persen Artinya Per-Seratus', '[{"type":"text","title":"Persen Artinya Per-Seratus","body":"Kata Persen berasal dari bahasa Latin ''Per Centum'' yang artinya per seratus! Jadi 50% adalah 50/100 = 1/2 = 0,5!"}]', 0, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-11-12-001-2', 'math-11-12-001', 'Konversi Persen', '[{"type":"text","title":"Konversi Persen","body":"Sentuh bentuk nilai ini!\n📊 50% = 0,5 — Lima puluh persen sama dengan nol koma lima!\n📊 25% = 0,25 — Dua puluh lima persen sama dengan seperempat!\n💯 100% = 1,0 — Seratus persen artinya satu bagian penuh!"}]', 1, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-11-12-001-3', 'math-11-12-001', '10 Soal Persentase & Desimal', '[{"type":"quiz","title":"10 Soal Persentase & Desimal","body":"10 soal latihan"}]', 2, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-math-11-12-001-4', 'math-11-12-001', 'Master Matematika Terapan!', '[{"type":"text","title":"Master Matematika Terapan!","body":"Luar biasa cerdas! Kamu sudah menguasai persentase, desimal, dan rasio dengan sangat matang dan siap menghadapi ujian!"}]', 3, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-01', l.id, m.category_id, 'Bentuk persentase dari pecahan 1/2 adalah...?', 'math-11-12-001-latihan-01', 'Berapa persen nilai dari pecahan satu per dua?', '[{"type":"question","title":"Bentuk persentase dari pecahan 1/2 adalah...?","body":"✔ 50% 📊\n• 25%\n• 75%\n• 20%"},{"type":"text","title":"Petunjuk","body":"1/2 dikalikan 100% = 50%."}]', '', '', m.age_min, m.age_max, 'developing', '["Bentuk persentase dari pecahan 1/2 adalah...?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-02', l.id, m.category_id, 'Bentuk desimal dari pecahan 1/4 adalah...?', 'math-11-12-001-latihan-02', 'Berapa nilai desimal dari satu per empat?', '[{"type":"question","title":"Bentuk desimal dari pecahan 1/4 adalah...?","body":"✔ 0,25\n• 0,5\n• 0,75\n• 0,14"},{"type":"text","title":"Petunjuk","body":"1 dibagi 4 sama dengan 0,25."}]', '', '', m.age_min, m.age_max, 'developing', '["Bentuk desimal dari pecahan 1/4 adalah...?"]', '["decimals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-03', l.id, m.category_id, 'Sebuah baju seharga Rp 100.000 mendapat diskon 20% 🏷️. Berapa potongan harga yang didapat pembeli?', 'math-11-12-001-latihan-03', 'Berapa potongan harga diskon dua puluh persen dari seratus ribu rupiah?', '[{"type":"question","title":"Sebuah baju seharga Rp 100.000 mendapat diskon 20% 🏷️. Berapa potongan harga yang didapat pembeli?","body":"✔ Rp 20.000\n• Rp 10.000\n• Rp 80.000\n• Rp 50.000"},{"type":"text","title":"Petunjuk","body":"20/100 × Rp 100.000 = Rp 20.000."}]', '', '', m.age_min, m.age_max, 'developing', '["Sebuah baju seharga Rp 100.000 mendapat diskon 20% 🏷️. Berapa potongan harga yang didapat pembeli?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-04', l.id, m.category_id, 'Berapa harga yang harus dibayar untuk baju di atas setelah dipotong diskon Rp 20.000?', 'math-11-12-001-latihan-04', 'Berapa harga yang harus dibayar setelah diskon?', '[{"type":"question","title":"Berapa harga yang harus dibayar untuk baju di atas setelah dipotong diskon Rp 20.000?","body":"✔ Rp 80.000 💵\n• Rp 90.000\n• Rp 70.000\n• Rp 60.000"},{"type":"text","title":"Petunjuk","body":"Rp 100.000 - Rp 20.000 = Rp 80.000."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapa harga yang harus dibayar untuk baju di atas setelah dipotong diskon Rp 20.000?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-05', l.id, m.category_id, 'Berapakah hasil dari 0,6 + 0,25?', 'math-11-12-001-latihan-05', 'Berapa hasil penjumlahan nol koma enam ditambah nol koma dua puluh lima?', '[{"type":"question","title":"Berapakah hasil dari 0,6 + 0,25?","body":"✔ 0,85\n• 0,31\n• 0,8\n• 0,95"},{"type":"text","title":"Petunjuk","body":"0,60 + 0,25 = 0,85."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 0,6 + 0,25?"]', '["decimals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-06', l.id, m.category_id, 'Bentuk pecahan biasa yang paling sederhana dari 75% adalah...?', 'math-11-12-001-latihan-06', 'Pecahan paling sederhana dari tujuh puluh lima persen adalah apa?', '[{"type":"question","title":"Bentuk pecahan biasa yang paling sederhana dari 75% adalah...?","body":"✔ 3/4\n• 7/10\n• 1/2\n• 4/5"},{"type":"text","title":"Petunjuk","body":"75/100 sama-sama dibagi 25 menjadi 3/4."}]', '', '', m.age_min, m.age_max, 'developing', '["Bentuk pecahan biasa yang paling sederhana dari 75% adalah...?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-07', l.id, m.category_id, 'Rasio jumlah siswa laki-laki dan perempuan di kelas adalah 2 : 3. Bila ada 10 siswa laki-laki, berapa siswa perempuan?', 'math-11-12-001-latihan-07', 'Jika rasio dua banding tiga dan laki-laki sepuluh orang, berapa perempuan?', '[{"type":"question","title":"Rasio jumlah siswa laki-laki dan perempuan di kelas adalah 2 : 3. Bila ada 10 siswa laki-laki, berapa siswa perempuan?","body":"✔ 15 Siswa Perempuan\n• 12 Siswa Perempuan\n• 20 Siswa Perempuan\n• 18 Siswa Perempuan"},{"type":"text","title":"Petunjuk","body":"10 dibagi 2 = 5. Maka perempuan adalah 3 × 5 = 15 anak."}]', '', '', m.age_min, m.age_max, 'advanced', '["Rasio jumlah siswa laki-laki dan perempuan di kelas adalah 2 : 3. Bila ada 10 siswa laki-laki, berapa siswa perempuan?"]', '["ratios"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-08', l.id, m.category_id, 'Berapakah 10% dari 500?', 'math-11-12-001-latihan-08', 'Berapakah sepuluh persen dari lima ratus?', '[{"type":"question","title":"Berapakah 10% dari 500?","body":"✔ 50\n• 5\n• 100\n• 25"},{"type":"text","title":"Petunjuk","body":"10/100 × 500 = 50."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah 10% dari 500?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-09', l.id, m.category_id, 'Berapakah hasil dari 1,5 × 4?', 'math-11-12-001-latihan-09', 'Berapa hasil satu koma lima dikali empat?', '[{"type":"question","title":"Berapakah hasil dari 1,5 × 4?","body":"✔ 6,0\n• 5,0\n• 4,5\n• 7,0"},{"type":"text","title":"Petunjuk","body":"1,5 + 1,5 + 1,5 + 1,5 = 6,0."}]', '', '', m.age_min, m.age_max, 'developing', '["Berapakah hasil dari 1,5 × 4?"]', '["decimals"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-math-11-12-001-latihan-10', l.id, m.category_id, 'Di sebuah ujian dengan 20 soal, Bimo menjawab 18 soal dengan benar. Berapa persentase nilai Bimo?', 'math-11-12-001-latihan-10', 'Jika benar delapan belas dari dua puluh soal, berapa persen nilainya?', '[{"type":"question","title":"Di sebuah ujian dengan 20 soal, Bimo menjawab 18 soal dengan benar. Berapa persentase nilai Bimo?","body":"✔ 90% 🌟\n• 80%\n• 85%\n• 95%"},{"type":"text","title":"Petunjuk","body":"(18 ÷ 20) × 100% = 90%."}]', '', '', m.age_min, m.age_max, 'advanced', '["Di sebuah ujian dengan 20 soal, Bimo menjawab 18 soal dengan benar. Berapa persentase nilai Bimo?"]', '["percentages"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-math-11-12-001-3'
   WHERE m.id = 'math-11-12-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'sci-11-12-001', 'science', 'Sistem Peredaran Darah & Organ Tubuh Manusia ❤️', 'Mempelajari kerja jantung yang memompa darah, pembuluh nadi, paru-paru, dan pertukaran oksigen!', 11, 12, 'advanced', 15, '["Memahami fungsi jantung, pembuluh arteri, dan pembuluh vena","Mengetahui peran sel darah merah membawa oksigen ke seluruh tubuh"]', '["human-biology","circulatory-system"]', '["sci-8-10-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-11-12-001-1', 'sci-11-12-001', 'Jantung: Pompa Ajaib Kehidupan', '[{"type":"text","title":"Jantung: Pompa Ajaib Kehidupan","body":"Jantung kita berdetak memompa darah yang kaya oksigen ke seluruh tubuh! Sel darah merah adalah kurir cilik pembawa oksigen dan sari makanan!"}]', 0, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-11-12-001-2', 'sci-11-12-001', 'Komponen Darah', '[{"type":"text","title":"Komponen Darah","body":"Sentuh organ dan sel berikut!\n❤️ Jantung ❤️ — Jantung memiliki 4 ruang: 2 serambi dan 2 bilik!\n🔴 Sel Darah Merah — Mengandung hemoglobin pengikat oksigen!\n🫁 Paru-Paru 🫁 — Tempat pertukaran gas oksigen dan karbon dioksida!"}]', 1, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-11-12-001-3', 'sci-11-12-001', '10 Soal Sistem Peredaran Darah', '[{"type":"quiz","title":"10 Soal Sistem Peredaran Darah","body":"10 soal latihan"}]', 2, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-11-12-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-sci-11-12-001-4', 'sci-11-12-001', 'Dokter Cilik Berbakat!', '[{"type":"text","title":"Dokter Cilik Berbakat!","body":"Hebat sekali! Pemahamanmu tentang sistem organ tubuh dan peredaran darah manusia sungguh luar biasa!"}]', 3, 4, 'published', created_by, updated_by
    FROM modules WHERE id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-01', l.id, m.category_id, 'Organ utama yang berfungsi memompa darah ke seluruh tubuh manusia adalah...? ❤️', 'sci-11-12-001-latihan-01', 'Organ tubuh apa yang bertugas memompa darah ke seluruh tubuh?', '[{"type":"question","title":"Organ utama yang berfungsi memompa darah ke seluruh tubuh manusia adalah...? ❤️","body":"✔ Jantung ❤️\n• Lambung 🥣\n• Ginjal 🫘\n• Hati 🫀"},{"type":"text","title":"Petunjuk","body":"Jantung berdetak di dalam dada kiri kita."}]', '', '', m.age_min, m.age_max, 'beginner', '["Organ utama yang berfungsi memompa darah ke seluruh tubuh manusia adalah...? ❤️"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-02', l.id, m.category_id, 'Gas penting yang dibawa oleh sel darah merah dari paru-paru ke seluruh tubuh adalah...?', 'sci-11-12-001-latihan-02', 'Gas apa yang diikat darah untuk diedarkan ke tubuh?', '[{"type":"question","title":"Gas penting yang dibawa oleh sel darah merah dari paru-paru ke seluruh tubuh adalah...?","body":"✔ Oksigen (O2) 💨\n• Karbon Dioksida (CO2)\n• Nitrogen\n• Helium"},{"type":"text","title":"Petunjuk","body":"Oksigen (O2) yang kita hirup saat bernapas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Gas penting yang dibawa oleh sel darah merah dari paru-paru ke seluruh tubuh adalah...?"]', '["circulatory-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-03', l.id, m.category_id, 'Pembuluh darah yang mengalirkan darah KELUAR dari jantung menuju seluruh tubuh disebut...?', 'sci-11-12-001-latihan-03', 'Pembuluh darah yang membawa darah keluar dari jantung disebut apa?', '[{"type":"question","title":"Pembuluh darah yang mengalirkan darah KELUAR dari jantung menuju seluruh tubuh disebut...?","body":"✔ Arteri (Pembuluh Nadi) 🩸\n• Vena (Pembuluh Balik)\n• Kapiler Halus\n• Trakea"},{"type":"text","title":"Petunjuk","body":"Pembuluh nadi atau arteri."}]', '', '', m.age_min, m.age_max, 'developing', '["Pembuluh darah yang mengalirkan darah KELUAR dari jantung menuju seluruh tubuh disebut...?"]', '["circulatory-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-04', l.id, m.category_id, 'Jantung manusia memiliki berapa ruang di dalamnya?', 'sci-11-12-001-latihan-04', 'Berapa jumlah ruang di dalam jantung manusia?', '[{"type":"question","title":"Jantung manusia memiliki berapa ruang di dalamnya?","body":"✔ 4 Ruang (2 Serambi, 2 Bilik)\n• 2 Ruang\n• 3 Ruang\n• 6 Ruang"},{"type":"text","title":"Petunjuk","body":"Dua serambi (atrium) dan dua bilik (ventrikel) = 4 ruang."}]', '', '', m.age_min, m.age_max, 'developing', '["Jantung manusia memiliki berapa ruang di dalamnya?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-05', l.id, m.category_id, 'Komponen darah yang bertugas membunuh kuman penyakit dan menjaga daya tahan tubuh adalah...?', 'sci-11-12-001-latihan-05', 'Sel darah apa yang bertugas melawan kuman penyakit?', '[{"type":"question","title":"Komponen darah yang bertugas membunuh kuman penyakit dan menjaga daya tahan tubuh adalah...?","body":"✔ Sel Darah Putih (Leukosit) 🛡️\n• Sel Darah Merah (Eritrosit)\n• Keping Darah (Trombosit)\n• Plasma Darah"},{"type":"text","title":"Petunjuk","body":"Sel darah putih atau leukosit."}]', '', '', m.age_min, m.age_max, 'developing', '["Komponen darah yang bertugas membunuh kuman penyakit dan menjaga daya tahan tubuh adalah...?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-06', l.id, m.category_id, 'Zat besi pada sel darah merah yang membuat darah berwarna merah dan berfungsi mengikat oksigen disebut...?', 'sci-11-12-001-latihan-06', 'Zat apa yang mengikat oksigen dan memberi warna merah pada darah?', '[{"type":"question","title":"Zat besi pada sel darah merah yang membuat darah berwarna merah dan berfungsi mengikat oksigen disebut...?","body":"✔ Hemoglobin\n• Klorofil\n• Melanin\n• Insulin"},{"type":"text","title":"Petunjuk","body":"Hemoglobin (Hb)."}]', '', '', m.age_min, m.age_max, 'advanced', '["Zat besi pada sel darah merah yang membuat darah berwarna merah dan berfungsi mengikat oksigen disebut...?"]', '["circulatory-system"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-07', l.id, m.category_id, 'Ketika kita berolahraga lari kencang, mengapa jantung berdetak lebih cepat?', 'sci-11-12-001-latihan-07', 'Mengapa jantung berdetak lebih cepat saat olahraga?', '[{"type":"question","title":"Ketika kita berolahraga lari kencang, mengapa jantung berdetak lebih cepat?","body":"✔ Untuk memasok lebih banyak oksigen ke otot yang bekerja keras 🏃\n• Karena jantung ketakutan\n• Supaya kita cepat lelah\n• Tidak ada pengaruhnya"},{"type":"text","title":"Petunjuk","body":"Otot membutuhkan lebih banyak pasokan oksigen dan energi."}]', '', '', m.age_min, m.age_max, 'developing', '["Ketika kita berolahraga lari kencang, mengapa jantung berdetak lebih cepat?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-08', l.id, m.category_id, 'Bagian darah yang membantu membekukan darah saat kita terluka sehingga darah berhenti mengalir adalah...?', 'sci-11-12-001-latihan-08', 'Bagian darah apa yang membekukan darah saat terluka?', '[{"type":"question","title":"Bagian darah yang membantu membekukan darah saat kita terluka sehingga darah berhenti mengalir adalah...?","body":"✔ Keping Darah (Trombosit) 🩹\n• Sel Darah Merah\n• Hormon\n• Air Liur"},{"type":"text","title":"Petunjuk","body":"Trombosit atau keping darah."}]', '', '', m.age_min, m.age_max, 'developing', '["Bagian darah yang membantu membekukan darah saat kita terluka sehingga darah berhenti mengalir adalah...?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-09', l.id, m.category_id, 'Penyakit akibat kekurangan sel darah merah atau hemoglobin sehingga tubuh terasa lemas dan pucat disebut...?', 'sci-11-12-001-latihan-09', 'Penyakit kekurangan sel darah merah disebut apa?', '[{"type":"question","title":"Penyakit akibat kekurangan sel darah merah atau hemoglobin sehingga tubuh terasa lemas dan pucat disebut...?","body":"✔ Anemia\n• Hipertensi\n• Diabetes\n• Influenza"},{"type":"text","title":"Petunjuk","body":"Anemia."}]', '', '', m.age_min, m.age_max, 'developing', '["Penyakit akibat kekurangan sel darah merah atau hemoglobin sehingga tubuh terasa lemas dan pucat disebut...?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-sci-11-12-001-latihan-10', l.id, m.category_id, 'Kebiasaan hidup sehat mana yang paling baik untuk menjaga kesehatan jantung kita?', 'sci-11-12-001-latihan-10', 'Kebiasaan apa yang paling baik untuk menjaga kesehatan jantung?', '[{"type":"question","title":"Kebiasaan hidup sehat mana yang paling baik untuk menjaga kesehatan jantung kita?","body":"✔ Rutin berolahraga dan makan sayur buah bergizi 🏃🥗\n• Tidur larut malam setiap hari 😴\n• Banyak makan makanan berlemak jahat 🍔\n• Malas bergerak dan duduk terus seharian 📺"},{"type":"text","title":"Petunjuk","body":"Rajin berolahraga dan makan makanan bergizi seimbang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kebiasaan hidup sehat mana yang paling baik untuk menjaga kesehatan jantung kita?"]', '["human-biology"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-sci-11-12-001-3'
   WHERE m.id = 'sci-11-12-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'social-2-3-001', 'social', 'Mengenal Anggota Keluarga', 'Belajar mengenal ayah, ibu, kakak, dan adik bersama Bimo yang hangat!', 2, 3, 'beginner', 7, '["Mengenali peran anggota keluarga inti","Menyebut nama anggota keluarga dengan benar"]', '["family-recognition","social-awareness"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-2-3-001-1', 'social-2-3-001', 'Keluargaku Sayang!', '[{"type":"text","title":"Keluargaku Sayang!","body":"Ayah 👨 kerja keras untuk keluarga. Ibu 👩 memasak dan merawat. Kakak 👦 mengajari kita. Adik 👶 bermain lucu."}]', 0, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-2-3-001-2', 'social-2-3-001', 'Sentuh Anggota Keluarga', '[{"type":"text","title":"Sentuh Anggota Keluarga","body":"Sentuh gambar untuk mengenal anggota keluarga Bimo!\n👨 Ayah — Ayah bekerja keras untuk keluarga kita!\n👩 Ibu — Ibu memasak dan merawat kita dengan penuh cinta!\n👦 Kakak — Kakak mengajak bermain dan belajar bersama!\n👶 Adik — Adik imut suka bermain dan tertawa!"}]', 1, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-2-3-001-3', 'social-2-3-001', 'Tebak Anggota Keluarga', '[{"type":"game","title":"Tebak Anggota Keluarga","body":"word-image"}]', 2, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-2-3-001-4', 'social-2-3-001', '10 Soal Keluargaku', '[{"type":"quiz","title":"10 Soal Keluargaku","body":"10 soal latihan"}]', 3, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-2-3-001-5', 'social-2-3-001', 'Hebat! Kamu Kenal Keluargamu!', '[{"type":"text","title":"Hebat! Kamu Kenal Keluargamu!","body":"Wah keren sekali! Kamu sudah tahu semua anggota keluargamu! Peluk Ayah dan Ibu ya!"}]', 4, 1, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-01', l.id, m.category_id, 'Siapa yang memasak makanan lezat di dapur? 🍳', 'social-2-3-001-latihan-01', 'Siapa yang memasak makanan lezat di dapur?', '[{"type":"question","title":"Siapa yang memasak makanan lezat di dapur? 🍳","body":"✔ Ibu 👩\n• Kakak 👦\n• Adik 👶"},{"type":"text","title":"Petunjuk","body":"Ibu suka memasak makanan enak untuk kita."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang memasak makanan lezat di dapur? 🍳"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-02', l.id, m.category_id, 'Siapa yang bekerja mencari uang untuk keluarga? 💼', 'social-2-3-001-latihan-02', 'Siapa yang bekerja mencari uang untuk keluarga?', '[{"type":"question","title":"Siapa yang bekerja mencari uang untuk keluarga? 💼","body":"✔ Ayah 👨\n• Ibu 👩\n• Adik 👶"},{"type":"text","title":"Petunjuk","body":"Ayah pergi ke kantor atau tempat kerja setiap pagi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang bekerja mencari uang untuk keluarga? 💼"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-03', l.id, m.category_id, 'Anggota keluarga yang paling kecil dan masih bayi adalah...?', 'social-2-3-001-latihan-03', 'Anggota keluarga yang paling kecil dan masih bayi adalah?', '[{"type":"question","title":"Anggota keluarga yang paling kecil dan masih bayi adalah...?","body":"✔ Adik 👶\n• Ayah 👨\n• Kakak 👦"},{"type":"text","title":"Petunjuk","body":"Dia suka menangis dan tertawa lucu."}]', '', '', m.age_min, m.age_max, 'beginner', '["Anggota keluarga yang paling kecil dan masih bayi adalah...?"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-04', l.id, m.category_id, 'Siapa yang sering mengajak bermain dan mengajari kita di rumah?', 'social-2-3-001-latihan-04', 'Siapa yang mengajak bermain dan mengajari kita di rumah?', '[{"type":"question","title":"Siapa yang sering mengajak bermain dan mengajari kita di rumah?","body":"✔ Kakak 👦\n• Ibu 👩\n• Adik 👶"},{"type":"text","title":"Petunjuk","body":"Dia lebih tua dari kita dan suka berbagi mainan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang sering mengajak bermain dan mengajari kita di rumah?"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-05', l.id, m.category_id, 'Ada berapa orang anggota keluarga inti? (Ayah, Ibu, Kakak, Adik)', 'social-2-3-001-latihan-05', 'Ada berapa orang anggota keluarga inti?', '[{"type":"question","title":"Ada berapa orang anggota keluarga inti? (Ayah, Ibu, Kakak, Adik)","body":"✔ 4 orang\n• 2 orang\n• 5 orang"},{"type":"text","title":"Petunjuk","body":"Hitung: Ayah, Ibu, Kakak, Adik."}]', '', '', m.age_min, m.age_max, 'beginner', '["Ada berapa orang anggota keluarga inti? (Ayah, Ibu, Kakak, Adik)"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-06', l.id, m.category_id, 'Apa yang kita ucapkan saat bertemu Ayah dan Ibu di pagi hari? 🌅', 'social-2-3-001-latihan-06', 'Apa yang kita ucapkan saat bertemu Ayah dan Ibu di pagi hari?', '[{"type":"question","title":"Apa yang kita ucapkan saat bertemu Ayah dan Ibu di pagi hari? 🌅","body":"✔ Selamat pagi! ☀️\n• Selamat malam! 🌙\n• Selamat tidur! 😴"},{"type":"text","title":"Petunjuk","body":"Ucapan selamat di pagi hari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang kita ucapkan saat bertemu Ayah dan Ibu di pagi hari? 🌅"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-07', l.id, m.category_id, 'Di mana tempat tinggal keluarga kita bersama?', 'social-2-3-001-latihan-07', 'Di mana tempat tinggal keluarga kita bersama?', '[{"type":"question","title":"Di mana tempat tinggal keluarga kita bersama?","body":"✔ Rumah 🏠\n• Hutan 🌳\n• Laut 🌊"},{"type":"text","title":"Petunjuk","body":"Tempat kita tidur, makan, dan bermain bersama."}]', '', '', m.age_min, m.age_max, 'beginner', '["Di mana tempat tinggal keluarga kita bersama?"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-08', l.id, m.category_id, 'Apa yang kita lakukan bersama keluarga saat makan? 🍽️', 'social-2-3-001-latihan-08', 'Apa yang kita lakukan bersama keluarga saat makan?', '[{"type":"question","title":"Apa yang kita lakukan bersama keluarga saat makan? 🍽️","body":"✔ Makan bersama 🍽️\n• Bermain bola ⚽\n• Tidur siang 😴"},{"type":"text","title":"Petunjuk","body":"Kita makan di meja makan bersama-sama."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang kita lakukan bersama keluarga saat makan? 🍽️"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-09', l.id, m.category_id, 'Manakah gambar keluarga bahagia?', 'social-2-3-001-latihan-09', 'Manakah gambar keluarga bahagia?', '[{"type":"question","title":"Manakah gambar keluarga bahagia?","body":"✔ Ayah-Ibu-Anak bersama 👨‍👩‍👧‍👦\n• Anak sendirian 😢\n• Rumah kosong 🏚️"},{"type":"text","title":"Petunjuk","body":"Keluarga bahagia selalu bersama dan saling menyayangi."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah gambar keluarga bahagia?"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-2-3-001-latihan-10', l.id, m.category_id, 'Apa yang Ibu lakukan saat kita sakit? 🤒', 'social-2-3-001-latihan-10', 'Apa yang Ibu lakukan saat kita sakit?', '[{"type":"question","title":"Apa yang Ibu lakukan saat kita sakit? 🤒","body":"✔ Merawat dan mengobati 💊\n• Pergi bermain 🎮\n• Tidur saja 😴"},{"type":"text","title":"Petunjuk","body":"Ibu selalu merawat kita dengan penuh kasih sayang."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang Ibu lakukan saat kita sakit? 🤒"]', '["family-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-2-3-001-4'
   WHERE m.id = 'social-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'social-4-5-001', 'social', 'Mengenal Profesi: Guru, Dokter, Polisi', 'Belajar mengenal pekerjaan orang-orang hebat di sekitar kita!', 4, 5, 'developing', 10, '["Mengenal profesi guru, dokter, dan polisi","Memahami peran profesi dalam kehidupan masyarakat"]', '["profession-recognition","social-awareness"]', '["social-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-4-5-001-1', 'social-4-5-001', 'Orang-Orang Hebat di Sekitar Kita', '[{"type":"text","title":"Orang-Orang Hebat di Sekitar Kita","body":"Guru 👩‍🏫 mengajar di sekolah. Dokter 👨‍⚕️ mengobati orang sakit. Polisi 👮 menjaga keamanan kita semua."}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-4-5-001-2', 'social-4-5-001', 'Profesi Hebat', '[{"type":"text","title":"Profesi Hebat","body":"Sentuh setiap profesi untuk tahu tugasnya!\n👩‍🏫 Guru — Guru mengajari kita membaca, menulis, dan berhitung di sekolah!\n👨‍⚕️ Dokter — Dokter memeriksa dan mengobati orang yang sakit agar sehat kembali!\n👮 Polisi — Polisi menjaga keamanan dan membantu orang yang membutuhkan!\n🧑‍🌾 Petani — Petani menanam padi dan sayuran agar kita punya makanan!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-4-5-001-3', 'social-4-5-001', 'Tebak Profesi', '[{"type":"game","title":"Tebak Profesi","body":"word-image"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-4-5-001-4', 'social-4-5-001', '10 Soal Profesi', '[{"type":"quiz","title":"10 Soal Profesi","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-4-5-001-5', 'social-4-5-001', 'Kamu Kenal Profesi Hebat!', '[{"type":"text","title":"Kamu Kenal Profesi Hebat!","body":"Bagus sekali! Kamu tahu banyak profesi keren. Nanti mau jadi apa? Dokter? Guru? Polisi? Semua hebat!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-01', l.id, m.category_id, 'Siapa yang mengajar kita membaca dan menulis di sekolah? ✏️', 'social-4-5-001-latihan-01', 'Siapa yang mengajar kita membaca dan menulis di sekolah?', '[{"type":"question","title":"Siapa yang mengajar kita membaca dan menulis di sekolah? ✏️","body":"✔ Guru 👩‍🏫\n• Dokter 👨‍⚕️\n• Polisi 👮"},{"type":"text","title":"Petunjuk","body":"Mereka bekerja di sekolah dan sangat sabar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang mengajar kita membaca dan menulis di sekolah? ✏️"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-02', l.id, m.category_id, 'Siapa yang kita temui saat kita sakit dan perlu obat? 🏥', 'social-4-5-001-latihan-02', 'Siapa yang kita temui saat kita sakit dan perlu obat?', '[{"type":"question","title":"Siapa yang kita temui saat kita sakit dan perlu obat? 🏥","body":"✔ Dokter 👨‍⚕️\n• Guru 👩‍🏫\n• Petani 🧑‍🌾"},{"type":"text","title":"Petunjuk","body":"Mereka memakai jas putih dan punya stetoskop."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang kita temui saat kita sakit dan perlu obat? 🏥"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-03', l.id, m.category_id, 'Siapa yang membantu mengatur lalu lintas di jalan raya? 🚦', 'social-4-5-001-latihan-03', 'Siapa yang membantu mengatur lalu lintas di jalan raya?', '[{"type":"question","title":"Siapa yang membantu mengatur lalu lintas di jalan raya? 🚦","body":"✔ Polisi 👮\n• Guru 👩‍🏫\n• Dokter 👨‍⚕️"},{"type":"text","title":"Petunjuk","body":"Mereka berseragam dan berjaga di jalan."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang membantu mengatur lalu lintas di jalan raya? 🚦"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-04', l.id, m.category_id, 'Di mana tempat bekerja seorang dokter? 🏥', 'social-4-5-001-latihan-04', 'Di mana tempat bekerja seorang dokter?', '[{"type":"question","title":"Di mana tempat bekerja seorang dokter? 🏥","body":"✔ Rumah Sakit / Klinik 🏥\n• Sekolah 🏫\n• Pasar 🛒"},{"type":"text","title":"Petunjuk","body":"Tempat orang sakit pergi untuk diobati."}]', '', '', m.age_min, m.age_max, 'beginner', '["Di mana tempat bekerja seorang dokter? 🏥"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-05', l.id, m.category_id, 'Petani bekerja untuk menghasilkan apa bagi kita? 🌾', 'social-4-5-001-latihan-05', 'Petani bekerja untuk menghasilkan apa bagi kita?', '[{"type":"question","title":"Petani bekerja untuk menghasilkan apa bagi kita? 🌾","body":"✔ Bahan makanan 🌾\n• Obat-obatan 💊\n• Buku pelajaran 📚"},{"type":"text","title":"Petunjuk","body":"Tanpa petani, kita tidak punya nasi di piring."}]', '', '', m.age_min, m.age_max, 'beginner', '["Petani bekerja untuk menghasilkan apa bagi kita? 🌾"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-06', l.id, m.category_id, 'Apa alat yang biasa dipakai dokter untuk memeriksa jantung kita?', 'social-4-5-001-latihan-06', 'Apa alat yang biasa dipakai dokter untuk memeriksa jantung kita?', '[{"type":"question","title":"Apa alat yang biasa dipakai dokter untuk memeriksa jantung kita?","body":"✔ Stetoskop 🩺\n• Penggaris 📏\n• Pensil ✏️"},{"type":"text","title":"Petunjuk","body":"Alat seperti selang dengan corong di telinganya."}]', '', '', m.age_min, m.age_max, 'developing', '["Apa alat yang biasa dipakai dokter untuk memeriksa jantung kita?"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-07', l.id, m.category_id, 'Profesi apa yang bertugas memadamkan api saat kebakaran? 🔥', 'social-4-5-001-latihan-07', 'Profesi apa yang bertugas memadamkan api saat kebakaran?', '[{"type":"question","title":"Profesi apa yang bertugas memadamkan api saat kebakaran? 🔥","body":"✔ Pemadam Kebakaran 🚒\n• Polisi 👮\n• Dokter 👨‍⚕️"},{"type":"text","title":"Petunjuk","body":"Mereka naik mobil merah besar dengan sirene."}]', '', '', m.age_min, m.age_max, 'beginner', '["Profesi apa yang bertugas memadamkan api saat kebakaran? 🔥"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-08', l.id, m.category_id, 'Apa yang kita ucapkan untuk menghormati guru kita? 🙏', 'social-4-5-001-latihan-08', 'Apa yang kita ucapkan untuk menghormati guru kita?', '[{"type":"question","title":"Apa yang kita ucapkan untuk menghormati guru kita? 🙏","body":"✔ Terima kasih, Bu Guru! 🙏\n• Pergi sana! 😠\n• Tidak mau! 😤"},{"type":"text","title":"Petunjuk","body":"Ungkapan rasa terima kasih."}]', '', '', m.age_min, m.age_max, 'beginner', '["Apa yang kita ucapkan untuk menghormati guru kita? 🙏"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-09', l.id, m.category_id, 'Siapa yang mengantarkan surat dan paket ke rumah kita? 📬', 'social-4-5-001-latihan-09', 'Siapa yang mengantarkan surat dan paket ke rumah kita?', '[{"type":"question","title":"Siapa yang mengantarkan surat dan paket ke rumah kita? 📬","body":"✔ Tukang Pos / Kurir 📬\n• Guru 👩‍🏫\n• Polisi 👮"},{"type":"text","title":"Petunjuk","body":"Mereka naik motor dengan tas besar."}]', '', '', m.age_min, m.age_max, 'beginner', '["Siapa yang mengantarkan surat dan paket ke rumah kita? 📬"]', '["profession-recognition"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-4-5-001-latihan-10', l.id, m.category_id, 'Mengapa semua profesi itu penting?', 'social-4-5-001-latihan-10', 'Mengapa semua profesi itu penting?', '[{"type":"question","title":"Mengapa semua profesi itu penting?","body":"✔ Karena saling membantu masyarakat 🤝\n• Karena mereka kaya 💰\n• Karena mereka berseragam 👔"},{"type":"text","title":"Petunjuk","body":"Setiap profesi saling membutuhkan."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengapa semua profesi itu penting?"]', '["social-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-4-5-001-4'
   WHERE m.id = 'social-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'social-6-7-001', 'social', 'Mengenal Keberagaman Budaya Indonesia', 'Menjelajahi kekayaan budaya, pakaian adat, dan rumah adat Nusantara yang indah!', 6, 7, 'developing', 12, '["Mengenal keberagaman budaya di Indonesia","Memahami pentingnya persatuan dalam perbedaan","Mengenal pakaian adat beberapa daerah"]', '["cultural-awareness","national-identity"]', '["social-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-6-7-001-1', 'social-6-7-001', 'Indonesia, Negeri Seribu Budaya', '[{"type":"text","title":"Indonesia, Negeri Seribu Budaya","body":"Batik dari Jawa, Reog dari Ponorogo, Rumah Gadang dari Sumatera Barat, Tari Saman dari Aceh. Semua berbeda tapi tetap SATU: Indonesia!"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-6-7-001-2', 'social-6-7-001', 'Jelajahi Budaya Nusantara', '[{"type":"text","title":"Jelajahi Budaya Nusantara","body":"Sentuh setiap budaya untuk mengenalnya!\n🎨 Batik Jawa — Batik adalah kain bermotif indah dari Jawa, diakui dunia sebagai warisan budaya!\n💃 Tari Saman — Tari Saman dari Aceh terkenal dengan gerakan tangan yang sangat cepat dan kompak!\n🏛️ Rumah Gadang — Rumah Gadang dari Minangkabau punya atap melengkung seperti tanduk kerbau!\n🎵 Angklung — Angklung adalah alat musik bambu dari Jawa Barat yang sudah terkenal di seluruh dunia!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-6-7-001-3', 'social-6-7-001', 'Pasangkan Budaya', '[{"type":"game","title":"Pasangkan Budaya","body":"connect-pairs"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-6-7-001-4', 'social-6-7-001', '10 Soal Budaya Indonesia', '[{"type":"quiz","title":"10 Soal Budaya Indonesia","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-social-6-7-001-5', 'social-6-7-001', 'Kamu Cinta Indonesia!', '[{"type":"text","title":"Kamu Cinta Indonesia!","body":"Luar biasa! Kamu tahu banyak tentang kekayaan budaya Indonesia. Kita bangga jadi orang Indonesia!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-01', l.id, m.category_id, 'Batik adalah kain bermotif indah yang berasal dari daerah mana di Indonesia?', 'social-6-7-001-latihan-01', 'Batik adalah kain bermotif indah yang berasal dari daerah mana?', '[{"type":"question","title":"Batik adalah kain bermotif indah yang berasal dari daerah mana di Indonesia?","body":"✔ Jawa 🗺️\n• Papua 🌿\n• Kalimantan 🌴"},{"type":"text","title":"Petunjuk","body":"Daerah yang terkenal dengan batik adalah Jawa, terutama Solo dan Yogyakarta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Batik adalah kain bermotif indah yang berasal dari daerah mana di Indonesia?"]', '["cultural-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-02', l.id, m.category_id, 'Tari Saman berasal dari provinsi mana?', 'social-6-7-001-latihan-02', 'Tari Saman berasal dari provinsi mana?', '[{"type":"question","title":"Tari Saman berasal dari provinsi mana?","body":"✔ Aceh 🌟\n• Bali 🌺\n• Papua 🦜"},{"type":"text","title":"Petunjuk","body":"Provinsi paling ujung barat pulau Sumatera."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tari Saman berasal dari provinsi mana?"]', '["cultural-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-03', l.id, m.category_id, 'Angklung adalah alat musik yang terbuat dari apa?', 'social-6-7-001-latihan-03', 'Angklung adalah alat musik yang terbuat dari apa?', '[{"type":"question","title":"Angklung adalah alat musik yang terbuat dari apa?","body":"✔ Bambu 🎋\n• Kayu Jati 🪵\n• Besi 🔩"},{"type":"text","title":"Petunjuk","body":"Bahannya tumbuh di hutan tropis Indonesia."}]', '', '', m.age_min, m.age_max, 'beginner', '["Angklung adalah alat musik yang terbuat dari apa?"]', '["cultural-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-04', l.id, m.category_id, 'Semboyan negara Indonesia yang berarti ''Berbeda-beda tetapi tetap satu'' adalah?', 'social-6-7-001-latihan-04', 'Semboyan negara Indonesia yang berarti berbeda-beda tetapi tetap satu adalah?', '[{"type":"question","title":"Semboyan negara Indonesia yang berarti ''Berbeda-beda tetapi tetap satu'' adalah?","body":"✔ Bhinneka Tunggal Ika 🇮🇩\n• Pancasila 🦅\n• Garuda Nusantara 🌟"},{"type":"text","title":"Petunjuk","body":"Kata-kata bahasa Jawa Kuno yang ada di lambang negara."}]', '', '', m.age_min, m.age_max, 'developing', '["Semboyan negara Indonesia yang berarti ''Berbeda-beda tetapi tetap satu'' adalah?"]', '["national-identity"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-05', l.id, m.category_id, 'Rumah adat Minangkabau di Sumatera Barat disebut apa?', 'social-6-7-001-latihan-05', 'Rumah adat Minangkabau di Sumatera Barat disebut apa?', '[{"type":"question","title":"Rumah adat Minangkabau di Sumatera Barat disebut apa?","body":"✔ Rumah Gadang 🏛️\n• Rumah Panggung 🏠\n• Rumah Adat Papua 🌿"},{"type":"text","title":"Petunjuk","body":"Atapnya melengkung seperti tanduk hewan."}]', '', '', m.age_min, m.age_max, 'developing', '["Rumah adat Minangkabau di Sumatera Barat disebut apa?"]', '["cultural-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-06', l.id, m.category_id, 'Indonesia memiliki berapa pulau (lebih kurang)?', 'social-6-7-001-latihan-06', 'Indonesia memiliki berapa pulau lebih kurang?', '[{"type":"question","title":"Indonesia memiliki berapa pulau (lebih kurang)?","body":"✔ Lebih dari 17.000 pulau 🏝️\n• 100 pulau\n• 5.000 pulau"},{"type":"text","title":"Petunjuk","body":"Indonesia adalah negara kepulauan terbesar di dunia."}]', '', '', m.age_min, m.age_max, 'developing', '["Indonesia memiliki berapa pulau (lebih kurang)?"]', '["national-identity"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-07', l.id, m.category_id, 'Apa nama tarian khas Bali yang terkenal hingga mancanegara?', 'social-6-7-001-latihan-07', 'Apa nama tarian khas Bali yang terkenal hingga mancanegara?', '[{"type":"question","title":"Apa nama tarian khas Bali yang terkenal hingga mancanegara?","body":"✔ Tari Kecak 🔥\n• Tari Saman 💃\n• Tari Jaipong 🎭"},{"type":"text","title":"Petunjuk","body":"Tariannya bercerita tentang kisah Ramayana."}]', '', '', m.age_min, m.age_max, 'developing', '["Apa nama tarian khas Bali yang terkenal hingga mancanegara?"]', '["cultural-awareness"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-08', l.id, m.category_id, 'Bahasa persatuan yang digunakan di seluruh Indonesia adalah?', 'social-6-7-001-latihan-08', 'Bahasa persatuan yang digunakan di seluruh Indonesia adalah?', '[{"type":"question","title":"Bahasa persatuan yang digunakan di seluruh Indonesia adalah?","body":"✔ Bahasa Indonesia 🇮🇩\n• Bahasa Jawa\n• Bahasa Inggris"},{"type":"text","title":"Petunjuk","body":"Bahasa yang kita pelajari di sekolah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bahasa persatuan yang digunakan di seluruh Indonesia adalah?"]', '["national-identity"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-09', l.id, m.category_id, 'Tanggal berapa Indonesia merayakan Hari Kemerdekaan?', 'social-6-7-001-latihan-09', 'Tanggal berapa Indonesia merayakan Hari Kemerdekaan?', '[{"type":"question","title":"Tanggal berapa Indonesia merayakan Hari Kemerdekaan?","body":"✔ 17 Agustus 🎉\n• 1 Januari 🎆\n• 21 April 🌸"},{"type":"text","title":"Petunjuk","body":"Bulan Agustus, tanggal yang ke-17."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tanggal berapa Indonesia merayakan Hari Kemerdekaan?"]', '["national-identity"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';
