-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-social-6-7-001-latihan-10', l.id, m.category_id, 'Mengapa kita harus menghargai keberagaman budaya di Indonesia?', 'social-6-7-001-latihan-10', 'Mengapa kita harus menghargai keberagaman budaya di Indonesia?', '[{"type":"question","title":"Mengapa kita harus menghargai keberagaman budaya di Indonesia?","body":"✔ Agar Indonesia tetap bersatu dan kuat 🤝\n• Agar bisa mengejek budaya lain 😒\n• Karena tidak ada manfaatnya 🤷"},{"type":"text","title":"Petunjuk","body":"Perbedaan membuat kita lebih kaya dan kuat bersama."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengapa kita harus menghargai keberagaman budaya di Indonesia?"]', '["national-identity"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-social-6-7-001-4'
   WHERE m.id = 'social-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'arabic-2-3-001', 'arabic', 'Huruf Hijaiyah: Alif, Ba, Ta', 'Mengenal tiga huruf pertama Hijaiyah: Alif, Ba, Ta dengan gambar dan bunyi!', 2, 3, 'beginner', 8, '["Mengenal bentuk huruf Alif (ا), Ba (ب), Ta (ت)","Mendengar dan menirukan bunyi huruf Hijaiyah"]', '["arabic-letters","phonics-arabic"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-2-3-001-1', 'arabic-2-3-001', 'Alif, Ba, Ta - Huruf Pertama Kita!', '[{"type":"text","title":"Alif, Ba, Ta - Huruf Pertama Kita!","body":"ا = Alif (dibaca A) | ب = Ba (dibaca Ba) | ت = Ta (dibaca Ta)"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-2-3-001-2', 'arabic-2-3-001', 'Kenalan dengan Huruf Hijaiyah', '[{"type":"text","title":"Kenalan dengan Huruf Hijaiyah","body":"Sentuh setiap huruf untuk mendengar bunyinya!\nا Alif ا — Alif! Alif dibaca A, seperti Anggur!\nب Ba ب — Ba! Ba dibaca Ba, seperti Bintang!\nت Ta ت — Ta! Ta dibaca Ta, seperti Tomat!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-2-3-001-3', 'arabic-2-3-001', 'Tebak Huruf', '[{"type":"game","title":"Tebak Huruf","body":"word-image"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-2-3-001-4', 'arabic-2-3-001', '10 Soal Huruf Hijaiyah Awal', '[{"type":"quiz","title":"10 Soal Huruf Hijaiyah Awal","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-2-3-001-5', 'arabic-2-3-001', 'Alif Ba Ta Sudah Hafal!', '[{"type":"text","title":"Alif Ba Ta Sudah Hafal!","body":"Masyaallah! Kamu sudah mengenal Alif, Ba, dan Ta! Terus semangat belajar huruf Hijaiyah ya!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-01', l.id, m.category_id, 'Manakah huruf ALIF? (ا = huruf tegak seperti batang pohon)', 'arabic-2-3-001-latihan-01', 'Manakah huruf Alif?', '[{"type":"question","title":"Manakah huruf ALIF? (ا = huruf tegak seperti batang pohon)","body":"✔ ا (Alif)\n• ب (Ba)\n• ت (Ta)"},{"type":"text","title":"Petunjuk","body":"Alif bentuknya seperti garis lurus tegak."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah huruf ALIF? (ا = huruf tegak seperti batang pohon)"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-02', l.id, m.category_id, 'Manakah huruf BA? (ب = seperti perahu dengan 1 titik di bawah)', 'arabic-2-3-001-latihan-02', 'Manakah huruf Ba?', '[{"type":"question","title":"Manakah huruf BA? (ب = seperti perahu dengan 1 titik di bawah)","body":"✔ ب (Ba)\n• ا (Alif)\n• ت (Ta)"},{"type":"text","title":"Petunjuk","body":"Ba punya satu titik di bawahnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah huruf BA? (ب = seperti perahu dengan 1 titik di bawah)"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-03', l.id, m.category_id, 'Huruf TA (ت) punya berapa titik?', 'arabic-2-3-001-latihan-03', 'Huruf Ta punya berapa titik?', '[{"type":"question","title":"Huruf TA (ت) punya berapa titik?","body":"✔ 2 titik di atas ✌️\n• 1 titik di bawah\n• tidak ada titik"},{"type":"text","title":"Petunjuk","body":"Hitung titik-titiknya: ada dua titik di atas."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf TA (ت) punya berapa titik?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-04', l.id, m.category_id, 'Huruf pertama dalam Hijaiyah adalah?', 'arabic-2-3-001-latihan-04', 'Huruf pertama dalam Hijaiyah adalah?', '[{"type":"question","title":"Huruf pertama dalam Hijaiyah adalah?","body":"✔ Alif ا\n• Ba ب\n• Ta ت"},{"type":"text","title":"Petunjuk","body":"Huruf pertama bentuknya paling sederhana."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf pertama dalam Hijaiyah adalah?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-05', l.id, m.category_id, 'Bunyi huruf ب adalah?', 'arabic-2-3-001-latihan-05', 'Bunyi huruf Ba adalah?', '[{"type":"question","title":"Bunyi huruf ب adalah?","body":"✔ Ba (ب)\n• Ta (ت)\n• Alif (ا)"},{"type":"text","title":"Petunjuk","body":"Bunyinya seperti kata Bintang di awalnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bunyi huruf ب adalah?"]', '["phonics-arabic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-06', l.id, m.category_id, 'Huruf Alif (ا) berbunyi seperti vokal apa?', 'arabic-2-3-001-latihan-06', 'Huruf Alif berbunyi seperti vokal apa?', '[{"type":"question","title":"Huruf Alif (ا) berbunyi seperti vokal apa?","body":"✔ A 🔤\n• I 🔤\n• U 🔤"},{"type":"text","title":"Petunjuk","body":"Ini huruf vokal pertama dalam bahasa Indonesia."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf Alif (ا) berbunyi seperti vokal apa?"]', '["phonics-arabic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-07', l.id, m.category_id, 'Manakah urutan huruf Hijaiyah yang benar?', 'arabic-2-3-001-latihan-07', 'Manakah urutan huruf Hijaiyah yang benar?', '[{"type":"question","title":"Manakah urutan huruf Hijaiyah yang benar?","body":"✔ ا ب ت (Alif Ba Ta)\n• ب ا ت (Ba Alif Ta)\n• ت ب ا (Ta Ba Alif)"},{"type":"text","title":"Petunjuk","body":"Urutan: Alif, Ba, Ta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah urutan huruf Hijaiyah yang benar?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-08', l.id, m.category_id, 'Huruf Ta (ت) titiknya ada di mana?', 'arabic-2-3-001-latihan-08', 'Huruf Ta titiknya ada di mana?', '[{"type":"question","title":"Huruf Ta (ت) titiknya ada di mana?","body":"✔ Di atas ⬆️\n• Di bawah ⬇️\n• Di samping ➡️"},{"type":"text","title":"Petunjuk","body":"Titiknya ada di sisi atas huruf."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf Ta (ت) titiknya ada di mana?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-09', l.id, m.category_id, 'Berapa huruf dalam Hijaiyah seluruhnya?', 'arabic-2-3-001-latihan-09', 'Berapa huruf dalam Hijaiyah seluruhnya?', '[{"type":"question","title":"Berapa huruf dalam Hijaiyah seluruhnya?","body":"✔ 28-29 huruf 📖\n• 26 huruf\n• 10 huruf"},{"type":"text","title":"Petunjuk","body":"Hijaiyah punya 28 atau 29 huruf."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa huruf dalam Hijaiyah seluruhnya?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-2-3-001-latihan-10', l.id, m.category_id, 'Kita belajar huruf Hijaiyah supaya bisa membaca apa?', 'arabic-2-3-001-latihan-10', 'Kita belajar huruf Hijaiyah supaya bisa membaca apa?', '[{"type":"question","title":"Kita belajar huruf Hijaiyah supaya bisa membaca apa?","body":"✔ Al-Quran 📖\n• Kamus Inggris 📕\n• Buku Cerita 📚"},{"type":"text","title":"Petunjuk","body":"Kitab suci umat Islam."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kita belajar huruf Hijaiyah supaya bisa membaca apa?"]', '["phonics-arabic"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-2-3-001-4'
   WHERE m.id = 'arabic-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'arabic-4-5-001', 'arabic', 'Huruf Hijaiyah dengan Harakat Fathah', 'Belajar membaca huruf Hijaiyah dengan tanda baca fathah (a) bersama Bimo!', 4, 5, 'developing', 12, '["Mengenal 28 huruf Hijaiyah dasar","Membaca huruf berharakat fathah: Ba = بَ (Ba), Ta = تَ (Ta)"]', '["arabic-letters","arabic-harakat"]', '["arabic-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-4-5-001-1', 'arabic-4-5-001', 'Fathah: Tanda Baca Kecil yang Ajaib', '[{"type":"text","title":"Fathah: Tanda Baca Kecil yang Ajaib","body":"بَ = Ba | تَ = Ta | جَ = Ja | دَ = Da | رَ = Ra | سَ = Sa | عَ = ''A | كَ = Ka | مَ = Ma | نَ = Na"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-4-5-001-2', 'arabic-4-5-001', 'Huruf + Fathah', '[{"type":"text","title":"Huruf + Fathah","body":"Sentuh untuk mendengar bunyi huruf berharakat fathah!\nبَ بَ (Ba) — Ba! Huruf Ba dengan fathah dibaca: Ba!\nتَ تَ (Ta) — Ta! Huruf Ta dengan fathah dibaca: Ta!\nدَ دَ (Da) — Da! Huruf Dal dengan fathah dibaca: Da!\nكَ كَ (Ka) — Ka! Huruf Kaf dengan fathah dibaca: Ka!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-4-5-001-3', 'arabic-4-5-001', 'Tebak Bunyi Huruf', '[{"type":"game","title":"Tebak Bunyi Huruf","body":"word-image"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-4-5-001-4', 'arabic-4-5-001', '10 Soal Harakat Fathah', '[{"type":"quiz","title":"10 Soal Harakat Fathah","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-4-5-001-5', 'arabic-4-5-001', 'Pintar! Harakat Fathah Sudah Dikuasai!', '[{"type":"text","title":"Pintar! Harakat Fathah Sudah Dikuasai!","body":"Masyaallah tabaarakallah! Kamu sudah bisa membaca huruf berharakat fathah! Terus semangat!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-01', l.id, m.category_id, 'Huruf بَ dibaca...?', 'arabic-4-5-001-latihan-01', 'Huruf Ba dengan tanda fathah dibaca?', '[{"type":"question","title":"Huruf بَ dibaca...?","body":"✔ Ba\n• Bi\n• Bu"},{"type":"text","title":"Petunjuk","body":"Fathah memberi bunyi A setelah huruf."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf بَ dibaca...?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-02', l.id, m.category_id, 'Huruf تَ dibaca...?', 'arabic-4-5-001-latihan-02', 'Huruf Ta dengan tanda fathah dibaca?', '[{"type":"question","title":"Huruf تَ dibaca...?","body":"✔ Ta\n• Ti\n• Tu"},{"type":"text","title":"Petunjuk","body":"Sama seperti Ba, tapi hurufnya Ta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf تَ dibaca...?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-03', l.id, m.category_id, 'Fathah (َ) adalah tanda baca yang terletak di mana pada huruf?', 'arabic-4-5-001-latihan-03', 'Fathah adalah tanda baca yang terletak di mana pada huruf?', '[{"type":"question","title":"Fathah (َ) adalah tanda baca yang terletak di mana pada huruf?","body":"✔ Di atas huruf ⬆️\n• Di bawah huruf ⬇️\n• Di samping huruf ➡️"},{"type":"text","title":"Petunjuk","body":"Tanda kecil berbentuk garis pendek miring."}]', '', '', m.age_min, m.age_max, 'beginner', '["Fathah (َ) adalah tanda baca yang terletak di mana pada huruf?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-04', l.id, m.category_id, 'Manakah huruf Arab yang berbunyi ''Ka''?', 'arabic-4-5-001-latihan-04', 'Manakah huruf Arab yang berbunyi Ka?', '[{"type":"question","title":"Manakah huruf Arab yang berbunyi ''Ka''?","body":"✔ كَ\n• مَ\n• نَ"},{"type":"text","title":"Petunjuk","body":"Huruf Kaf dengan fathah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Manakah huruf Arab yang berbunyi ''Ka''?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-05', l.id, m.category_id, 'Huruf مَ dibaca...?', 'arabic-4-5-001-latihan-05', 'Huruf Mim dengan fathah dibaca?', '[{"type":"question","title":"Huruf مَ dibaca...?","body":"✔ Ma\n• Na\n• Ka"},{"type":"text","title":"Petunjuk","body":"Huruf Mim bunyinya M, tambah fathah jadi..."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf مَ dibaca...?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-06', l.id, m.category_id, 'Salam pembuka dalam Islam adalah?', 'arabic-4-5-001-latihan-06', 'Salam pembuka dalam Islam adalah?', '[{"type":"question","title":"Salam pembuka dalam Islam adalah?","body":"✔ Assalamualaikum 🕌\n• Ahlan wa sahlan\n• Barakallah"},{"type":"text","title":"Petunjuk","body":"Dimulai dengan kata Assalamu..."}]', '', '', m.age_min, m.age_max, 'beginner', '["Salam pembuka dalam Islam adalah?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-07', l.id, m.category_id, 'Huruf نَ dibaca...?', 'arabic-4-5-001-latihan-07', 'Huruf Nun dengan fathah dibaca?', '[{"type":"question","title":"Huruf نَ dibaca...?","body":"✔ Na\n• La\n• Ra"},{"type":"text","title":"Petunjuk","body":"Huruf Nun + fathah."}]', '', '', m.age_min, m.age_max, 'beginner', '["Huruf نَ dibaca...?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-08', l.id, m.category_id, 'Manakah bacaan yang benar untuk huruf سَ?', 'arabic-4-5-001-latihan-08', 'Manakah bacaan yang benar untuk huruf Sin dengan fathah?', '[{"type":"question","title":"Manakah bacaan yang benar untuk huruf سَ?","body":"✔ Sa\n• Sha\n• Za"},{"type":"text","title":"Petunjuk","body":"Huruf Sin + fathah."}]', '', '', m.age_min, m.age_max, 'developing', '["Manakah bacaan yang benar untuk huruf سَ?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-09', l.id, m.category_id, 'رَ dibaca...?', 'arabic-4-5-001-latihan-09', 'Huruf Ra dengan fathah dibaca?', '[{"type":"question","title":"رَ dibaca...?","body":"✔ Ra\n• Za\n• Wa"},{"type":"text","title":"Petunjuk","body":"Huruf Ra + fathah = Ra!"}]', '', '', m.age_min, m.age_max, 'beginner', '["رَ dibaca...?"]', '["arabic-harakat"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-4-5-001-latihan-10', l.id, m.category_id, 'Kata ''كِتَابٌ'' dalam bahasa Arab artinya?', 'arabic-4-5-001-latihan-10', 'Kata Kitabun dalam bahasa Arab artinya?', '[{"type":"question","title":"Kata ''كِتَابٌ'' dalam bahasa Arab artinya?","body":"✔ Buku / Kitab 📚\n• Pensil ✏️\n• Rumah 🏠"},{"type":"text","title":"Petunjuk","body":"Benda yang dipakai untuk membaca dan belajar."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata ''كِتَابٌ'' dalam bahasa Arab artinya?"]', '["arabic-letters"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-4-5-001-4'
   WHERE m.id = 'arabic-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'arabic-6-7-001', 'arabic', 'Kosakata Arab: Angka dan Warna', 'Belajar angka 1-10 dan nama warna dalam Bahasa Arab yang menyenangkan!', 6, 7, 'developing', 12, '["Menghafal angka 1-5 dalam bahasa Arab","Mengenal nama warna dasar dalam bahasa Arab"]', '["arabic-numbers","arabic-vocabulary"]', '["arabic-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-6-7-001-1', 'arabic-6-7-001', 'Angka dan Warna dalam Bahasa Arab', '[{"type":"text","title":"Angka dan Warna dalam Bahasa Arab","body":"واحد (Wahid=1) | اثنان (Itsnan=2) | ثلاثة (Tsalatsah=3) | أربعة (Arba''ah=4) | خمسة (Khamsah=5) | أحمر (Ahmar=Merah) | أزرق (Azraq=Biru) | أخضر (Akhdar=Hijau)"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-6-7-001-2', 'arabic-6-7-001', 'Angka dan Warna Arab', '[{"type":"text","title":"Angka dan Warna Arab","body":"Sentuh untuk mendengar angka dan warna dalam bahasa Arab!\n1️⃣ واحد - Satu — Wahid! Artinya satu dalam bahasa Arab!\n2️⃣ اثنان - Dua — Itsnan! Artinya dua dalam bahasa Arab!\n🔴 أحمر - Merah — Ahmar! Artinya warna merah dalam bahasa Arab!\n🔵 أزرق - Biru — Azraq! Artinya warna biru dalam bahasa Arab!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-6-7-001-3', 'arabic-6-7-001', 'Tebak Angka Arab', '[{"type":"game","title":"Tebak Angka Arab","body":"connect-pairs"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-6-7-001-4', 'arabic-6-7-001', '10 Soal Angka & Warna Arab', '[{"type":"quiz","title":"10 Soal Angka & Warna Arab","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-arabic-6-7-001-5', 'arabic-6-7-001', 'Keren! Kosakata Arab Dikuasai!', '[{"type":"text","title":"Keren! Kosakata Arab Dikuasai!","body":"Masyaallah! Kamu sudah hafal angka dan warna dalam bahasa Arab! Terus belajar ya!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-01', l.id, m.category_id, 'واحد (Wahid) dalam bahasa Arab artinya angka...?', 'arabic-6-7-001-latihan-01', 'Wahid dalam bahasa Arab artinya angka berapa?', '[{"type":"question","title":"واحد (Wahid) dalam bahasa Arab artinya angka...?","body":"✔ 1 (Satu)\n• 2 (Dua)\n• 3 (Tiga)"},{"type":"text","title":"Petunjuk","body":"Ini adalah angka paling pertama."}]', '', '', m.age_min, m.age_max, 'beginner', '["واحد (Wahid) dalam bahasa Arab artinya angka...?"]', '["arabic-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-02', l.id, m.category_id, 'Angka 2 (dua) dalam bahasa Arab adalah?', 'arabic-6-7-001-latihan-02', 'Angka dua dalam bahasa Arab adalah?', '[{"type":"question","title":"Angka 2 (dua) dalam bahasa Arab adalah?","body":"✔ اثنان (Itsnan)\n• واحد (Wahid)\n• ثلاثة (Tsalatsah)"},{"type":"text","title":"Petunjuk","body":"Bunyinya mirip kata Italia."}]', '', '', m.age_min, m.age_max, 'beginner', '["Angka 2 (dua) dalam bahasa Arab adalah?"]', '["arabic-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-03', l.id, m.category_id, 'أحمر (Ahmar) adalah nama warna apa dalam bahasa Arab?', 'arabic-6-7-001-latihan-03', 'Ahmar adalah nama warna apa dalam bahasa Arab?', '[{"type":"question","title":"أحمر (Ahmar) adalah nama warna apa dalam bahasa Arab?","body":"✔ Merah 🔴\n• Biru 🔵\n• Hijau 🟢"},{"type":"text","title":"Petunjuk","body":"Warna api dan stroberi."}]', '', '', m.age_min, m.age_max, 'beginner', '["أحمر (Ahmar) adalah nama warna apa dalam bahasa Arab?"]', '["arabic-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-04', l.id, m.category_id, 'أخضر (Akhdar) adalah nama warna apa?', 'arabic-6-7-001-latihan-04', 'Akhdar adalah nama warna apa dalam bahasa Arab?', '[{"type":"question","title":"أخضر (Akhdar) adalah nama warna apa?","body":"✔ Hijau 🟢\n• Kuning 🟡\n• Merah 🔴"},{"type":"text","title":"Petunjuk","body":"Warna daun dan rumput."}]', '', '', m.age_min, m.age_max, 'beginner', '["أخضر (Akhdar) adalah nama warna apa?"]', '["arabic-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-05', l.id, m.category_id, 'ثلاثة (Tsalatsah) artinya angka...?', 'arabic-6-7-001-latihan-05', 'Tsalatsah artinya angka berapa?', '[{"type":"question","title":"ثلاثة (Tsalatsah) artinya angka...?","body":"✔ 3 (Tiga)\n• 4 (Empat)\n• 5 (Lima)"},{"type":"text","title":"Petunjuk","body":"Ini angka setelah dua."}]', '', '', m.age_min, m.age_max, 'beginner', '["ثلاثة (Tsalatsah) artinya angka...?"]', '["arabic-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-06', l.id, m.category_id, 'Warna KUNING dalam bahasa Arab adalah?', 'arabic-6-7-001-latihan-06', 'Warna kuning dalam bahasa Arab adalah?', '[{"type":"question","title":"Warna KUNING dalam bahasa Arab adalah?","body":"✔ أصفر (Asfar)\n• أحمر (Ahmar)\n• أسود (Aswad)"},{"type":"text","title":"Petunjuk","body":"Warna matahari dan pisang."}]', '', '', m.age_min, m.age_max, 'developing', '["Warna KUNING dalam bahasa Arab adalah?"]', '["arabic-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-07', l.id, m.category_id, 'أربعة (Arba''ah) artinya angka...?', 'arabic-6-7-001-latihan-07', 'Arba''ah artinya angka berapa?', '[{"type":"question","title":"أربعة (Arba''ah) artinya angka...?","body":"✔ 4 (Empat)\n• 3 (Tiga)\n• 5 (Lima)"},{"type":"text","title":"Petunjuk","body":"Angka setelah tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["أربعة (Arba''ah) artinya angka...?"]', '["arabic-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-08', l.id, m.category_id, 'Kata ''شَمْس'' (Syams) dalam bahasa Arab artinya?', 'arabic-6-7-001-latihan-08', 'Kata Syams dalam bahasa Arab artinya?', '[{"type":"question","title":"Kata ''شَمْس'' (Syams) dalam bahasa Arab artinya?","body":"✔ Matahari ☀️\n• Bulan 🌙\n• Bintang ⭐"},{"type":"text","title":"Petunjuk","body":"Benda langit yang bersinar di siang hari."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata ''شَمْس'' (Syams) dalam bahasa Arab artinya?"]', '["arabic-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-09', l.id, m.category_id, 'خمسة (Khamsah) artinya angka...?', 'arabic-6-7-001-latihan-09', 'Khamsah artinya angka berapa?', '[{"type":"question","title":"خمسة (Khamsah) artinya angka...?","body":"✔ 5 (Lima)\n• 4 (Empat)\n• 6 (Enam)"},{"type":"text","title":"Petunjuk","body":"Jumlah jari di satu tangan."}]', '', '', m.age_min, m.age_max, 'beginner', '["خمسة (Khamsah) artinya angka...?"]', '["arabic-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-arabic-6-7-001-latihan-10', l.id, m.category_id, 'Kalimat ''بِسْمِ اللّٰهِ'' dibaca saat kita akan...?', 'arabic-6-7-001-latihan-10', 'Kalimat Bismillah dibaca saat kita akan?', '[{"type":"question","title":"Kalimat ''بِسْمِ اللّٰهِ'' dibaca saat kita akan...?","body":"✔ Memulai kegiatan baik 🙏\n• Mengakhiri sholat\n• Bangun tidur"},{"type":"text","title":"Petunjuk","body":"Sebelum memulai segala aktivitas baik."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kalimat ''بِسْمِ اللّٰهِ'' dibaca saat kita akan...?"]', '["arabic-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-arabic-6-7-001-4'
   WHERE m.id = 'arabic-6-7-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'mandarin-2-3-001', 'mandarin', 'Nǐ Hǎo! Halo dalam Bahasa Mandarin', 'Belajar menyapa dan berhitung 1-3 dalam bahasa Mandarin yang menyenangkan!', 2, 3, 'beginner', 8, '["Mengucapkan sapaan dasar: Nǐ hǎo, Zàijiàn","Menghitung 1-3 dalam bahasa Mandarin: Yī, Èr, Sān"]', '["mandarin-greetings","mandarin-numbers"]', '[]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-2-3-001-1', 'mandarin-2-3-001', 'Nǐ Hǎo! - Kata Pertama Mandarin Kita!', '[{"type":"text","title":"Nǐ Hǎo! - Kata Pertama Mandarin Kita!","body":"你好 (Nǐ hǎo) = Halo! | 再见 (Zàijiàn) = Sampai Jumpa! | 一 (Yī) = 1 | 二 (Èr) = 2 | 三 (Sān) = 3"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-2-3-001-2', 'mandarin-2-3-001', 'Sapaan dan Angka Mandarin', '[{"type":"text","title":"Sapaan dan Angka Mandarin","body":"Sentuh untuk mendengar sapaan bahasa Mandarin!\n👋 你好 Nǐ hǎo — Nǐ hǎo! Artinya Halo dalam bahasa Mandarin!\n👋 再见 Zàijiàn — Zàijiàn! Artinya Sampai Jumpa!\n1️⃣ 一 Yī = 1 — Yī! Artinya satu dalam bahasa Mandarin!\n2️⃣ 二 Èr = 2 — Èr! Artinya dua dalam bahasa Mandarin!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-2-3-001-3', 'mandarin-2-3-001', 'Tebak Sapaan Mandarin', '[{"type":"game","title":"Tebak Sapaan Mandarin","body":"word-image"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-2-3-001-4', 'mandarin-2-3-001', '10 Soal Sapaan Mandarin', '[{"type":"quiz","title":"10 Soal Sapaan Mandarin","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-2-3-001-5', 'mandarin-2-3-001', 'Hǎo! Hebat Sekali!', '[{"type":"text","title":"Hǎo! Hebat Sekali!","body":"Hǎo! Artinya bagus dalam bahasa Mandarin! Kamu sudah bisa menyapa dalam bahasa Mandarin! Nǐ hǎo!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-01', l.id, m.category_id, '''你好 (Nǐ hǎo)'' dalam bahasa Mandarin artinya?', 'mandarin-2-3-001-latihan-01', 'Nǐ hǎo dalam bahasa Mandarin artinya?', '[{"type":"question","title":"''你好 (Nǐ hǎo)'' dalam bahasa Mandarin artinya?","body":"✔ Halo! 👋\n• Selamat Tidur 😴\n• Terima Kasih 🙏"},{"type":"text","title":"Petunjuk","body":"Ini diucapkan saat bertemu teman."}]', '', '', m.age_min, m.age_max, 'beginner', '["''你好 (Nǐ hǎo)'' dalam bahasa Mandarin artinya?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-02', l.id, m.category_id, '''再见 (Zàijiàn)'' artinya?', 'mandarin-2-3-001-latihan-02', 'Zàijiàn artinya?', '[{"type":"question","title":"''再见 (Zàijiàn)'' artinya?","body":"✔ Sampai Jumpa 👋\n• Halo 👋\n• Terima Kasih 🙏"},{"type":"text","title":"Petunjuk","body":"Ini diucapkan saat berpisah."}]', '', '', m.age_min, m.age_max, 'beginner', '["''再见 (Zàijiàn)'' artinya?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-03', l.id, m.category_id, 'Angka 1 (satu) dalam bahasa Mandarin adalah?', 'mandarin-2-3-001-latihan-03', 'Angka satu dalam bahasa Mandarin adalah?', '[{"type":"question","title":"Angka 1 (satu) dalam bahasa Mandarin adalah?","body":"✔ 一 Yī\n• 二 Èr\n• 三 Sān"},{"type":"text","title":"Petunjuk","body":"Bunyinya seperti huruf Y."}]', '', '', m.age_min, m.age_max, 'beginner', '["Angka 1 (satu) dalam bahasa Mandarin adalah?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-04', l.id, m.category_id, '二 (Èr) dalam bahasa Mandarin artinya?', 'mandarin-2-3-001-latihan-04', 'Èr dalam bahasa Mandarin artinya?', '[{"type":"question","title":"二 (Èr) dalam bahasa Mandarin artinya?","body":"✔ Dua (2)\n• Satu (1)\n• Tiga (3)"},{"type":"text","title":"Petunjuk","body":"Ini adalah angka setelah satu."}]', '', '', m.age_min, m.age_max, 'beginner', '["二 (Èr) dalam bahasa Mandarin artinya?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-05', l.id, m.category_id, '三 (Sān) artinya angka berapa?', 'mandarin-2-3-001-latihan-05', 'Sān artinya angka berapa?', '[{"type":"question","title":"三 (Sān) artinya angka berapa?","body":"✔ Tiga (3)\n• Dua (2)\n• Empat (4)"},{"type":"text","title":"Petunjuk","body":"Angka setelah dua."}]', '', '', m.age_min, m.age_max, 'beginner', '["三 (Sān) artinya angka berapa?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-06', l.id, m.category_id, 'Bagaimana cara menyapa teman baru dalam bahasa Mandarin?', 'mandarin-2-3-001-latihan-06', 'Bagaimana cara menyapa teman baru dalam bahasa Mandarin?', '[{"type":"question","title":"Bagaimana cara menyapa teman baru dalam bahasa Mandarin?","body":"✔ 你好! (Nǐ hǎo!)\n• 再见! (Zàijiàn!)\n• 一 (Yī)!"},{"type":"text","title":"Petunjuk","body":"Kata sapaan yang sudah kita pelajari."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bagaimana cara menyapa teman baru dalam bahasa Mandarin?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-07', l.id, m.category_id, '''谢谢 (Xièxiè)'' dalam bahasa Mandarin artinya?', 'mandarin-2-3-001-latihan-07', 'Xièxiè dalam bahasa Mandarin artinya?', '[{"type":"question","title":"''谢谢 (Xièxiè)'' dalam bahasa Mandarin artinya?","body":"✔ Terima Kasih 🙏\n• Maaf 😔\n• Halo 👋"},{"type":"text","title":"Petunjuk","body":"Ucapan setelah dibantu atau diberi sesuatu."}]', '', '', m.age_min, m.age_max, 'beginner', '["''谢谢 (Xièxiè)'' dalam bahasa Mandarin artinya?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-08', l.id, m.category_id, 'Negara yang menggunakan bahasa Mandarin adalah?', 'mandarin-2-3-001-latihan-08', 'Negara yang menggunakan bahasa Mandarin adalah?', '[{"type":"question","title":"Negara yang menggunakan bahasa Mandarin adalah?","body":"✔ Tiongkok (China) 🇨🇳\n• Jepang 🇯🇵\n• Korea 🇰🇷"},{"type":"text","title":"Petunjuk","body":"Negara dengan tembok raksasa yang terkenal."}]', '', '', m.age_min, m.age_max, 'beginner', '["Negara yang menggunakan bahasa Mandarin adalah?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-09', l.id, m.category_id, 'Berapa banyak orang yang berbicara bahasa Mandarin di dunia?', 'mandarin-2-3-001-latihan-09', 'Berapa banyak orang yang berbicara bahasa Mandarin di dunia?', '[{"type":"question","title":"Berapa banyak orang yang berbicara bahasa Mandarin di dunia?","body":"✔ Lebih dari 1 miliar orang 🌍\n• 100 orang\n• 1.000 orang"},{"type":"text","title":"Petunjuk","body":"Bahasa Mandarin adalah bahasa paling banyak penuturnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Berapa banyak orang yang berbicara bahasa Mandarin di dunia?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-2-3-001-latihan-10', l.id, m.category_id, 'Saat kita makan bersama teman Mandarin, kita bisa mengucapkan?', 'mandarin-2-3-001-latihan-10', 'Saat makan bersama teman Mandarin, kita bisa mengucapkan?', '[{"type":"question","title":"Saat kita makan bersama teman Mandarin, kita bisa mengucapkan?","body":"✔ 吃饭 (Chī fàn) - Mari makan! 🍜\n• 再见 (Zàijiàn) - Sampai Jumpa! 👋\n• 你好 (Nǐ hǎo) - Halo! 😊"},{"type":"text","title":"Petunjuk","body":"''Makan mie'' dalam bahasa Mandarin."}]', '', '', m.age_min, m.age_max, 'beginner', '["Saat kita makan bersama teman Mandarin, kita bisa mengucapkan?"]', '["mandarin-greetings"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-2-3-001-4'
   WHERE m.id = 'mandarin-2-3-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'mandarin-4-5-001', 'mandarin', 'Angka 1-10 dan Warna dalam Mandarin', 'Belajar menghitung 1 sampai 10 dan nama warna dalam bahasa Mandarin!', 4, 5, 'developing', 12, '["Menghafal angka 1-10 dalam bahasa Mandarin","Menyebut warna dasar dalam bahasa Mandarin"]', '["mandarin-numbers","mandarin-colors"]', '["mandarin-2-3-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-4-5-001-1', 'mandarin-4-5-001', 'Hitung 1-10 dalam Mandarin!', '[{"type":"text","title":"Hitung 1-10 dalam Mandarin!","body":"1=一Yī | 2=二Èr | 3=三Sān | 4=四Sì | 5=五Wǔ | 6=六Liù | 7=七Qī | 8=八Bā | 9=九Jiǔ | 10=十Shí | Merah=红Hóng | Biru=蓝Lán | Hijau=绿Lǜ | Kuning=黄Huáng"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-4-5-001-2', 'mandarin-4-5-001', 'Angka dan Warna Mandarin', '[{"type":"text","title":"Angka dan Warna Mandarin","body":"Sentuh setiap kartu untuk mendengar angka dan warna Mandarin!\n4️⃣ 四 Sì = 4 — Sì! Artinya empat dalam bahasa Mandarin!\n5️⃣ 五 Wǔ = 5 — Wǔ! Artinya lima dalam bahasa Mandarin!\n🔴 红 Hóng = Merah — Hóng! Artinya warna merah dalam bahasa Mandarin!\n🔵 蓝 Lán = Biru — Lán! Artinya warna biru dalam bahasa Mandarin!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-4-5-001-3', 'mandarin-4-5-001', 'Tebak Angka Mandarin', '[{"type":"game","title":"Tebak Angka Mandarin","body":"word-image"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-4-5-001-4', 'mandarin-4-5-001', '10 Soal Angka & Warna Mandarin', '[{"type":"quiz","title":"10 Soal Angka & Warna Mandarin","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-4-5-001-5', 'mandarin-4-5-001', 'Tài Bàng Le! Kamu Hebat!', '[{"type":"text","title":"Tài Bàng Le! Kamu Hebat!","body":"太棒了 (Tài bàng le)! Artinya Kamu Hebat Sekali dalam bahasa Mandarin! Kamu sudah bisa menghitung 1-10 dan menyebut warna dalam Mandarin!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-01', l.id, m.category_id, '四 (Sì) dalam bahasa Mandarin artinya angka berapa?', 'mandarin-4-5-001-latihan-01', 'Sì dalam bahasa Mandarin artinya angka berapa?', '[{"type":"question","title":"四 (Sì) dalam bahasa Mandarin artinya angka berapa?","body":"✔ 4 (Empat)\n• 3 (Tiga)\n• 5 (Lima)"},{"type":"text","title":"Petunjuk","body":"Angka setelah tiga."}]', '', '', m.age_min, m.age_max, 'beginner', '["四 (Sì) dalam bahasa Mandarin artinya angka berapa?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-02', l.id, m.category_id, '五 (Wǔ) dalam bahasa Mandarin artinya?', 'mandarin-4-5-001-latihan-02', 'Wǔ dalam bahasa Mandarin artinya?', '[{"type":"question","title":"五 (Wǔ) dalam bahasa Mandarin artinya?","body":"✔ 5 (Lima)\n• 6 (Enam)\n• 4 (Empat)"},{"type":"text","title":"Petunjuk","body":"Jumlah jari di satu tangan."}]', '', '', m.age_min, m.age_max, 'beginner', '["五 (Wǔ) dalam bahasa Mandarin artinya?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-03', l.id, m.category_id, '红 (Hóng) adalah warna apa dalam bahasa Mandarin?', 'mandarin-4-5-001-latihan-03', 'Hóng adalah warna apa dalam bahasa Mandarin?', '[{"type":"question","title":"红 (Hóng) adalah warna apa dalam bahasa Mandarin?","body":"✔ Merah 🔴\n• Biru 🔵\n• Hijau 🟢"},{"type":"text","title":"Petunjuk","body":"Warna bendera Tiongkok juga berwarna ini."}]', '', '', m.age_min, m.age_max, 'beginner', '["红 (Hóng) adalah warna apa dalam bahasa Mandarin?"]', '["mandarin-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-04', l.id, m.category_id, 'Warna BIRU dalam bahasa Mandarin adalah?', 'mandarin-4-5-001-latihan-04', 'Warna biru dalam bahasa Mandarin adalah?', '[{"type":"question","title":"Warna BIRU dalam bahasa Mandarin adalah?","body":"✔ 蓝 (Lán)\n• 红 (Hóng)\n• 绿 (Lǜ)"},{"type":"text","title":"Petunjuk","body":"Warna langit dan laut."}]', '', '', m.age_min, m.age_max, 'beginner', '["Warna BIRU dalam bahasa Mandarin adalah?"]', '["mandarin-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-05', l.id, m.category_id, '十 (Shí) artinya angka berapa?', 'mandarin-4-5-001-latihan-05', 'Shí artinya angka berapa dalam bahasa Mandarin?', '[{"type":"question","title":"十 (Shí) artinya angka berapa?","body":"✔ 10 (Sepuluh)\n• 9 (Sembilan)\n• 8 (Delapan)"},{"type":"text","title":"Petunjuk","body":"Jumlah jari di dua tangan."}]', '', '', m.age_min, m.age_max, 'beginner', '["十 (Shí) artinya angka berapa?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-06', l.id, m.category_id, '绿 (Lǜ) adalah warna apa?', 'mandarin-4-5-001-latihan-06', 'Lǜ adalah warna apa dalam bahasa Mandarin?', '[{"type":"question","title":"绿 (Lǜ) adalah warna apa?","body":"✔ Hijau 🟢\n• Kuning 🟡\n• Merah 🔴"},{"type":"text","title":"Petunjuk","body":"Warna daun dan pohon."}]', '', '', m.age_min, m.age_max, 'beginner', '["绿 (Lǜ) adalah warna apa?"]', '["mandarin-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-07', l.id, m.category_id, '八 (Bā) dalam bahasa Mandarin artinya?', 'mandarin-4-5-001-latihan-07', 'Bā dalam bahasa Mandarin artinya?', '[{"type":"question","title":"八 (Bā) dalam bahasa Mandarin artinya?","body":"✔ 8 (Delapan)\n• 7 (Tujuh)\n• 9 (Sembilan)"},{"type":"text","title":"Petunjuk","body":"Angka ini dianggap keberuntungan di Tiongkok."}]', '', '', m.age_min, m.age_max, 'developing', '["八 (Bā) dalam bahasa Mandarin artinya?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-08', l.id, m.category_id, '黄 (Huáng) adalah warna apa dalam bahasa Mandarin?', 'mandarin-4-5-001-latihan-08', 'Huáng adalah warna apa dalam bahasa Mandarin?', '[{"type":"question","title":"黄 (Huáng) adalah warna apa dalam bahasa Mandarin?","body":"✔ Kuning 🟡\n• Oranye 🟠\n• Putih ⬜"},{"type":"text","title":"Petunjuk","body":"Warna matahari dan pisang."}]', '', '', m.age_min, m.age_max, 'beginner', '["黄 (Huáng) adalah warna apa dalam bahasa Mandarin?"]', '["mandarin-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-09', l.id, m.category_id, 'Urutan angka Mandarin yang benar adalah?', 'mandarin-4-5-001-latihan-09', 'Urutan angka Mandarin yang benar adalah?', '[{"type":"question","title":"Urutan angka Mandarin yang benar adalah?","body":"✔ Yī, Èr, Sān (一二三)\n• Sān, Èr, Yī (三二一)\n• Èr, Sān, Yī (二三一)"},{"type":"text","title":"Petunjuk","body":"Satu, Dua, Tiga dalam bahasa Mandarin."}]', '', '', m.age_min, m.age_max, 'developing', '["Urutan angka Mandarin yang benar adalah?"]', '["mandarin-numbers"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-4-5-001-latihan-10', l.id, m.category_id, 'Perayaan Tahun Baru Imlek identik dengan warna apa dalam budaya Tiongkok?', 'mandarin-4-5-001-latihan-10', 'Perayaan Tahun Baru Imlek identik dengan warna apa?', '[{"type":"question","title":"Perayaan Tahun Baru Imlek identik dengan warna apa dalam budaya Tiongkok?","body":"✔ Merah 红 (Hóng) 🧧\n• Biru 蓝 (Lán) 🔵\n• Hitam 黑 (Hēi) ⬛"},{"type":"text","title":"Petunjuk","body":"Amplop angpao berwarna ini."}]', '', '', m.age_min, m.age_max, 'beginner', '["Perayaan Tahun Baru Imlek identik dengan warna apa dalam budaya Tiongkok?"]', '["mandarin-colors"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-4-5-001-4'
   WHERE m.id = 'mandarin-4-5-001';

INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes, objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)
  SELECT 'mandarin-6-7-001', 'mandarin', 'Kosakata Keluarga dan Hewan dalam Mandarin', 'Belajar nama anggota keluarga dan hewan-hewan lucu dalam bahasa Mandarin!', 6, 7, 'developing', 12, '["Menyebut nama anggota keluarga dalam bahasa Mandarin","Mengenal nama hewan dalam bahasa Mandarin"]', '["mandarin-vocabulary","mandarin-family"]', '["mandarin-4-5-001"]', 'published', u.id, u.id
    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-6-7-001-1', 'mandarin-6-7-001', 'Keluarga dan Hewan dalam Mandarin', '[{"type":"text","title":"Keluarga dan Hewan dalam Mandarin","body":"爸爸 Bàba=Ayah | 妈妈 Māma=Ibu | 哥哥 Gēge=Kakak laki | 妹妹 Mèimei=Adik perempuan | 猫 Māo=Kucing | 狗 Gǒu=Anjing | 鸟 Niǎo=Burung | 鱼 Yú=Ikan"}]', 0, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-6-7-001-2', 'mandarin-6-7-001', 'Keluarga Mandarin', '[{"type":"text","title":"Keluarga Mandarin","body":"Sentuh untuk belajar kosakata keluarga dan hewan Mandarin!\n👨 爸爸 Bàba = Ayah — Bàba! Artinya Ayah dalam bahasa Mandarin!\n👩 妈妈 Māma = Ibu — Māma! Artinya Ibu dalam bahasa Mandarin!\n🐱 猫 Māo = Kucing — Māo! Artinya Kucing dalam bahasa Mandarin! Bunyi kucing juga Māo!\n🐶 狗 Gǒu = Anjing — Gǒu! Artinya Anjing dalam bahasa Mandarin!"}]', 1, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-6-7-001-3', 'mandarin-6-7-001', 'Pasangkan Kosakata', '[{"type":"game","title":"Pasangkan Kosakata","body":"connect-pairs"}]', 2, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-6-7-001-4', 'mandarin-6-7-001', '10 Soal Kosakata Mandarin', '[{"type":"quiz","title":"10 Soal Kosakata Mandarin","body":"10 soal latihan"}]', 3, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)
  SELECT 'builtin-lesson-mandarin-6-7-001-5', 'mandarin-6-7-001', 'Nǐ Hǎo Bàng! Kamu Keren Banget!', '[{"type":"text","title":"Nǐ Hǎo Bàng! Kamu Keren Banget!","body":"你好棒 (Nǐ hǎo bàng)! Kamu sudah menguasai kosakata keluarga dan hewan dalam bahasa Mandarin!"}]', 4, 2, 'published', created_by, updated_by
    FROM modules WHERE id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-01', l.id, m.category_id, '爸爸 (Bàba) dalam bahasa Mandarin artinya?', 'mandarin-6-7-001-latihan-01', 'Bàba dalam bahasa Mandarin artinya?', '[{"type":"question","title":"爸爸 (Bàba) dalam bahasa Mandarin artinya?","body":"✔ Ayah 👨\n• Ibu 👩\n• Kakak 👦"},{"type":"text","title":"Petunjuk","body":"Orang tua laki-laki."}]', '', '', m.age_min, m.age_max, 'beginner', '["爸爸 (Bàba) dalam bahasa Mandarin artinya?"]', '["mandarin-family"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-02', l.id, m.category_id, '妈妈 (Māma) artinya siapa?', 'mandarin-6-7-001-latihan-02', 'Māma dalam bahasa Mandarin artinya?', '[{"type":"question","title":"妈妈 (Māma) artinya siapa?","body":"✔ Ibu 👩\n• Ayah 👨\n• Adik 👶"},{"type":"text","title":"Petunjuk","body":"Orang tua perempuan."}]', '', '', m.age_min, m.age_max, 'beginner', '["妈妈 (Māma) artinya siapa?"]', '["mandarin-family"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-03', l.id, m.category_id, '猫 (Māo) dalam bahasa Mandarin adalah hewan apa?', 'mandarin-6-7-001-latihan-03', 'Māo dalam bahasa Mandarin adalah hewan apa?', '[{"type":"question","title":"猫 (Māo) dalam bahasa Mandarin adalah hewan apa?","body":"✔ Kucing 🐱\n• Anjing 🐶\n• Burung 🐦"},{"type":"text","title":"Petunjuk","body":"Bunyinya sama dengan nama hewannya dalam Mandarin: Māo!"}]', '', '', m.age_min, m.age_max, 'beginner', '["猫 (Māo) dalam bahasa Mandarin adalah hewan apa?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-04', l.id, m.category_id, '狗 (Gǒu) dalam bahasa Mandarin adalah?', 'mandarin-6-7-001-latihan-04', 'Gǒu dalam bahasa Mandarin adalah?', '[{"type":"question","title":"狗 (Gǒu) dalam bahasa Mandarin adalah?","body":"✔ Anjing 🐶\n• Kucing 🐱\n• Ikan 🐟"},{"type":"text","title":"Petunjuk","body":"Hewan peliharaan yang suka menggonggong."}]', '', '', m.age_min, m.age_max, 'beginner', '["狗 (Gǒu) dalam bahasa Mandarin adalah?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-05', l.id, m.category_id, '哥哥 (Gēge) artinya dalam bahasa Indonesia?', 'mandarin-6-7-001-latihan-05', 'Gēge artinya apa dalam bahasa Indonesia?', '[{"type":"question","title":"哥哥 (Gēge) artinya dalam bahasa Indonesia?","body":"✔ Kakak laki-laki 👦\n• Adik laki-laki 👶\n• Ayah 👨"},{"type":"text","title":"Petunjuk","body":"Saudara laki-laki yang lebih tua."}]', '', '', m.age_min, m.age_max, 'beginner', '["哥哥 (Gēge) artinya dalam bahasa Indonesia?"]', '["mandarin-family"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';
