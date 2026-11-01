-- Seed kurikulum statis (src/data/modules) ke tabel CMS.
-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.
-- 34 modul, 146 lesson, 340 materi.
-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.
-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-06', l.id, m.category_id, '鸟 (Niǎo) dalam bahasa Mandarin adalah?', 'mandarin-6-7-001-latihan-06', 'Niǎo dalam bahasa Mandarin adalah?', '[{"type":"question","title":"鸟 (Niǎo) dalam bahasa Mandarin adalah?","body":"✔ Burung 🐦\n• Kupu-kupu 🦋\n• Ikan 🐟"},{"type":"text","title":"Petunjuk","body":"Hewan yang bisa terbang."}]', '', '', m.age_min, m.age_max, 'beginner', '["鸟 (Niǎo) dalam bahasa Mandarin adalah?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-07', l.id, m.category_id, 'Bagaimana cara mengatakan ''Selamat Pagi'' dalam bahasa Mandarin?', 'mandarin-6-7-001-latihan-07', 'Bagaimana cara mengatakan Selamat Pagi dalam bahasa Mandarin?', '[{"type":"question","title":"Bagaimana cara mengatakan ''Selamat Pagi'' dalam bahasa Mandarin?","body":"✔ 早上好 (Zǎoshang hǎo)\n• 你好 (Nǐ hǎo)\n• 再见 (Zàijiàn)"},{"type":"text","title":"Petunjuk","body":"早上好 adalah sapaan di pagi hari."}]', '', '', m.age_min, m.age_max, 'developing', '["Bagaimana cara mengatakan ''Selamat Pagi'' dalam bahasa Mandarin?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-08', l.id, m.category_id, '鱼 (Yú) dalam bahasa Mandarin adalah?', 'mandarin-6-7-001-latihan-08', 'Yú dalam bahasa Mandarin adalah?', '[{"type":"question","title":"鱼 (Yú) dalam bahasa Mandarin adalah?","body":"✔ Ikan 🐟\n• Katak 🐸\n• Anjing 🐶"},{"type":"text","title":"Petunjuk","body":"Hewan yang hidup di air dan suka berenang."}]', '', '', m.age_min, m.age_max, 'beginner', '["鱼 (Yú) dalam bahasa Mandarin adalah?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-09', l.id, m.category_id, '妹妹 (Mèimei) artinya?', 'mandarin-6-7-001-latihan-09', 'Mèimei artinya apa dalam bahasa Indonesia?', '[{"type":"question","title":"妹妹 (Mèimei) artinya?","body":"✔ Adik perempuan 👧\n• Kakak perempuan 👩\n• Ibu 👩"},{"type":"text","title":"Petunjuk","body":"Saudara perempuan yang lebih muda."}]', '', '', m.age_min, m.age_max, 'beginner', '["妹妹 (Mèimei) artinya?"]', '["mandarin-family"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-mandarin-6-7-001-latihan-10', l.id, m.category_id, 'Kalimat ''我爱你 (Wǒ ài nǐ)'' artinya?', 'mandarin-6-7-001-latihan-10', 'Wǒ ài nǐ artinya apa dalam bahasa Indonesia?', '[{"type":"question","title":"Kalimat ''我爱你 (Wǒ ài nǐ)'' artinya?","body":"✔ Aku sayang kamu ❤️\n• Terima kasih 🙏\n• Sampai jumpa 👋"},{"type":"text","title":"Petunjuk","body":"Ungkapan kasih sayang kepada orang tersayang."}]', '', '', m.age_min, m.age_max, 'developing', '["Kalimat ''我爱你 (Wǒ ài nǐ)'' artinya?"]', '["mandarin-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m LEFT JOIN lessons l ON l.id = 'builtin-lesson-mandarin-6-7-001-4'
   WHERE m.id = 'mandarin-6-7-001';
