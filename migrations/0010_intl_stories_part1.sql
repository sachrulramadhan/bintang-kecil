-- 10 materi per modul intl-* kategori cerita, disusun dari isi lesson di D1.
-- Dihasilkan oleh scripts/generate-intl-stories-materials.mjs. Jangan diubah manual.
-- INSERT OR IGNORE sehingga aman dijalankan berulang.
INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-01', l.id, m.category_id, 'Ringkasan: Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-01', 'Tokoh adalah orang atau hewan dalam cerita.', '[{"type":"text","title":"Yuk belajar: Tokoh dan Perasaan","body":"Hai, teman! Hari ini kita belajar tokoh dan perasaan."},{"type":"text","title":"Penjelasan","body":"Tokoh adalah orang atau hewan dalam cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Tokoh adalah orang atau hewan dalam cerita."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-02', l.id, m.category_id, 'Amati: Melihat kata dan tindakannya', 'intl-v1-stories-11-12-01-materi-02', 'Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka.', '[{"type":"text","title":"🙂 Melihat kata dan tindakannya","body":"Melihat kata dan tindakannya\nTokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."}]', '', '', m.age_min, m.age_max, 'advanced', '["Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-03', l.id, m.category_id, 'Amati: Menghitung jumlah halaman', 'intl-v1-stories-11-12-01-materi-03', 'Bandingkan dengan ide utama: tokoh dan perasaan.', '[{"type":"text","title":"💭 Menghitung jumlah halaman","body":"Menghitung jumlah halaman\nBandingkan dengan ide utama: tokoh dan perasaan."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-04', l.id, m.category_id, 'Amati: Memilih warna sampul', 'intl-v1-stories-11-12-01-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Memilih warna sampul","body":"Memilih warna sampul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-05', l.id, m.category_id, 'Misi: Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-05', 'Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan.', '[{"type":"game","title":"Misi kecil: Tokoh dan Perasaan","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Bagaimana cara mengetahui perasaan tokoh?', 'intl-v1-stories-11-12-01-materi-06', 'Terapkan pemahamanmu: Bagaimana cara mengetahui perasaan tokoh?', '[{"type":"question","title":"Terapkan pemahamanmu: Bagaimana cara mengetahui perasaan tokoh?","body":"✔ Melihat kata dan tindakannya\n• Menghitung jumlah halaman\n• Memilih warna sampul"},{"type":"text","title":"Petunjuk","body":"Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Bagaimana cara mengetahui perasaan tokoh?"]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-07', l.id, m.category_id, 'Soal: Ide utama Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-07', 'Mengenali gagasan pokok dari tokoh dan perasaan.', '[{"type":"question","title":"Apa ide utama dari Tokoh dan Perasaan?","body":"✔ Tokoh adalah orang atau hewan dalam cerita.\n• Cerita memiliki awal, tengah, dan akhir.\n• Sebab menjelaskan mengapa sesuatu terjadi."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Tokoh adalah orang atau hewan dalam cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-08', l.id, m.category_id, 'Soal: Penerapan Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-08', 'Memilih langkah yang tepat saat mempelajari tokoh dan perasaan.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari tokoh dan perasaan?","body":"✔ Melihat kata dan tindakannya\n• Menghitung jumlah halaman\n• Memilih warna sampul\n• Urutan peristiwa"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan tokoh dan perasaan."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh tokoh dan perasaan?","body":"✔ Menghitung jumlah halaman\n• Melihat kata dan tindakannya\n• Urutan peristiwa"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-01-materi-10', l.id, m.category_id, 'Refleksi: Tokoh dan Perasaan', 'intl-v1-stories-11-12-01-materi-10', 'Hebat! Sekarang kamu sudah belajar tokoh dan perasaan.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar tokoh dan perasaan."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh tokoh dan perasaan yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-01'
   WHERE m.id = 'intl-v1-stories-11-12-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-01', l.id, m.category_id, 'Ringkasan: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-01', 'Cerita memiliki awal, tengah, dan akhir.', '[{"type":"text","title":"Yuk belajar: Awal, Tengah, dan Akhir Cerita","body":"Hai, teman! Hari ini kita belajar awal, tengah, dan akhir cerita."},{"type":"text","title":"Penjelasan","body":"Cerita memiliki awal, tengah, dan akhir."}]', '', '', m.age_min, m.age_max, 'advanced', '["Cerita memiliki awal, tengah, dan akhir."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-02', l.id, m.category_id, 'Amati: Awal cerita', 'intl-v1-stories-11-12-02-materi-02', 'Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi.', '[{"type":"text","title":"📖 Awal cerita","body":"Awal cerita\nCerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi."}]', '', '', m.age_min, m.age_max, 'advanced', '["Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-03', l.id, m.category_id, 'Amati: Akhir cerita', 'intl-v1-stories-11-12-02-materi-03', 'Bandingkan dengan ide utama: awal, tengah, dan akhir cerita.', '[{"type":"text","title":"💭 Akhir cerita","body":"Akhir cerita\nBandingkan dengan ide utama: awal, tengah, dan akhir cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-04', l.id, m.category_id, 'Amati: Daftar isi', 'intl-v1-stories-11-12-02-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Daftar isi","body":"Daftar isi\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-05', l.id, m.category_id, 'Misi: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-05', 'Permainan word-image untuk menguatkan pemahaman awal, tengah, dan akhir cerita.', '[{"type":"game","title":"Misi kecil: Awal, Tengah, dan Akhir Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Bagian mana yang biasanya memperkenalkan tokoh?', 'intl-v1-stories-11-12-02-materi-06', 'Terapkan pemahamanmu: Bagian mana yang biasanya memperkenalkan tokoh?', '[{"type":"question","title":"Terapkan pemahamanmu: Bagian mana yang biasanya memperkenalkan tokoh?","body":"✔ Awal cerita\n• Akhir cerita\n• Daftar isi"},{"type":"text","title":"Petunjuk","body":"Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Bagian mana yang biasanya memperkenalkan tokoh?"]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-07', l.id, m.category_id, 'Soal: Ide utama Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-07', 'Mengenali gagasan pokok dari awal, tengah, dan akhir cerita.', '[{"type":"question","title":"Apa ide utama dari Awal, Tengah, dan Akhir Cerita?","body":"✔ Cerita memiliki awal, tengah, dan akhir.\n• Kejadian dalam cerita berlangsung berurutan.\n• Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Cerita memiliki awal, tengah, dan akhir."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-08', l.id, m.category_id, 'Soal: Penerapan Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-08', 'Memilih langkah yang tepat saat mempelajari awal, tengah, dan akhir cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari awal, tengah, dan akhir cerita?","body":"✔ Awal cerita\n• Akhir cerita\n• Daftar isi\n• Hujan turun"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan awal, tengah, dan akhir cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh awal, tengah, dan akhir cerita?","body":"✔ Akhir cerita\n• Awal cerita\n• Hujan turun"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-02-materi-10', l.id, m.category_id, 'Refleksi: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-11-12-02-materi-10', 'Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh awal, tengah, dan akhir cerita yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-02'
   WHERE m.id = 'intl-v1-stories-11-12-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-01', l.id, m.category_id, 'Ringkasan: Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-01', 'Kejadian dalam cerita berlangsung berurutan.', '[{"type":"text","title":"Yuk belajar: Mengurutkan Kejadian","body":"Hai, teman! Hari ini kita belajar mengurutkan kejadian."},{"type":"text","title":"Penjelasan","body":"Kejadian dalam cerita berlangsung berurutan."}]', '', '', m.age_min, m.age_max, 'advanced', '["Kejadian dalam cerita berlangsung berurutan."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-02', l.id, m.category_id, 'Amati: Urutan peristiwa', 'intl-v1-stories-11-12-03-materi-02', 'Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk.', '[{"type":"text","title":"➡️ Urutan peristiwa","body":"Urutan peristiwa\nKejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk."}]', '', '', m.age_min, m.age_max, 'advanced', '["Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-03', l.id, m.category_id, 'Amati: Warna gambar', 'intl-v1-stories-11-12-03-materi-03', 'Bandingkan dengan ide utama: mengurutkan kejadian.', '[{"type":"text","title":"💭 Warna gambar","body":"Warna gambar\nBandingkan dengan ide utama: mengurutkan kejadian."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-04', l.id, m.category_id, 'Amati: Jumlah huruf judul', 'intl-v1-stories-11-12-03-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah huruf judul","body":"Jumlah huruf judul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-05', l.id, m.category_id, 'Misi: Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-05', 'Permainan word-image untuk menguatkan pemahaman mengurutkan kejadian.', '[{"type":"game","title":"Misi kecil: Mengurutkan Kejadian","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Apa yang membantu kita mengetahui kejadian berikutnya?', 'intl-v1-stories-11-12-03-materi-06', 'Terapkan pemahamanmu: Apa yang membantu kita mengetahui kejadian berikutnya?', '[{"type":"question","title":"Terapkan pemahamanmu: Apa yang membantu kita mengetahui kejadian berikutnya?","body":"✔ Urutan peristiwa\n• Warna gambar\n• Jumlah huruf judul"},{"type":"text","title":"Petunjuk","body":"Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Apa yang membantu kita mengetahui kejadian berikutnya?"]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-07', l.id, m.category_id, 'Soal: Ide utama Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-07', 'Mengenali gagasan pokok dari mengurutkan kejadian.', '[{"type":"question","title":"Apa ide utama dari Mengurutkan Kejadian?","body":"✔ Kejadian dalam cerita berlangsung berurutan.\n• Sebab menjelaskan mengapa sesuatu terjadi.\n• Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kejadian dalam cerita berlangsung berurutan."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-08', l.id, m.category_id, 'Soal: Penerapan Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-08', 'Memilih langkah yang tepat saat mempelajari mengurutkan kejadian.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mengurutkan kejadian?","body":"✔ Urutan peristiwa\n• Warna gambar\n• Jumlah huruf judul\n• Kejadian yang sudah diceritakan"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mengurutkan kejadian."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mengurutkan kejadian?","body":"✔ Warna gambar\n• Urutan peristiwa\n• Kejadian yang sudah diceritakan"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-03-materi-10', l.id, m.category_id, 'Refleksi: Mengurutkan Kejadian', 'intl-v1-stories-11-12-03-materi-10', 'Hebat! Sekarang kamu sudah belajar mengurutkan kejadian.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mengurutkan kejadian."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mengurutkan kejadian yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-03'
   WHERE m.id = 'intl-v1-stories-11-12-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-01', l.id, m.category_id, 'Ringkasan: Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-01', 'Sebab menjelaskan mengapa sesuatu terjadi.', '[{"type":"text","title":"Yuk belajar: Mencari Sebab dan Akibat","body":"Hai, teman! Hari ini kita belajar mencari sebab dan akibat."},{"type":"text","title":"Penjelasan","body":"Sebab menjelaskan mengapa sesuatu terjadi."}]', '', '', m.age_min, m.age_max, 'advanced', '["Sebab menjelaskan mengapa sesuatu terjadi."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-02', l.id, m.category_id, 'Amati: Hujan turun', 'intl-v1-stories-11-12-04-materi-02', 'Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya.', '[{"type":"text","title":"🔗 Hujan turun","body":"Hujan turun\nSebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-03', l.id, m.category_id, 'Amati: Matahari bersinar', 'intl-v1-stories-11-12-04-materi-03', 'Bandingkan dengan ide utama: mencari sebab dan akibat.', '[{"type":"text","title":"💭 Matahari bersinar","body":"Matahari bersinar\nBandingkan dengan ide utama: mencari sebab dan akibat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-04', l.id, m.category_id, 'Amati: Angin berhenti', 'intl-v1-stories-11-12-04-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Angin berhenti","body":"Angin berhenti\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-05', l.id, m.category_id, 'Misi: Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-05', 'Permainan word-image untuk menguatkan pemahaman mencari sebab dan akibat.', '[{"type":"game","title":"Misi kecil: Mencari Sebab dan Akibat","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Jika hujan membuat jalan basah, apa sebab jalan basah?', 'intl-v1-stories-11-12-04-materi-06', 'Terapkan pemahamanmu: Jika hujan membuat jalan basah, apa sebab jalan basah?', '[{"type":"question","title":"Terapkan pemahamanmu: Jika hujan membuat jalan basah, apa sebab jalan basah?","body":"✔ Hujan turun\n• Matahari bersinar\n• Angin berhenti"},{"type":"text","title":"Petunjuk","body":"Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Jika hujan membuat jalan basah, apa sebab jalan basah?"]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-07', l.id, m.category_id, 'Soal: Ide utama Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-07', 'Mengenali gagasan pokok dari mencari sebab dan akibat.', '[{"type":"question","title":"Apa ide utama dari Mencari Sebab dan Akibat?","body":"✔ Sebab menjelaskan mengapa sesuatu terjadi.\n• Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.\n• Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Sebab menjelaskan mengapa sesuatu terjadi."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-08', l.id, m.category_id, 'Soal: Penerapan Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-08', 'Memilih langkah yang tepat saat mempelajari mencari sebab dan akibat.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mencari sebab dan akibat?","body":"✔ Hujan turun\n• Matahari bersinar\n• Angin berhenti\n• Tokoh dan kejadian penting"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mencari sebab dan akibat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mencari sebab dan akibat?","body":"✔ Matahari bersinar\n• Hujan turun\n• Tokoh dan kejadian penting"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-04-materi-10', l.id, m.category_id, 'Refleksi: Mencari Sebab dan Akibat', 'intl-v1-stories-11-12-04-materi-10', 'Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mencari sebab dan akibat yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-04'
   WHERE m.id = 'intl-v1-stories-11-12-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-01', l.id, m.category_id, 'Ringkasan: Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-01', 'Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.', '[{"type":"text","title":"Yuk belajar: Menebak Kelanjutan Cerita","body":"Hai, teman! Hari ini kita belajar menebak kelanjutan cerita."},{"type":"text","title":"Penjelasan","body":"Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-02', l.id, m.category_id, 'Amati: Kejadian yang sudah diceritakan', 'intl-v1-stories-11-12-05-materi-02', 'Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.', '[{"type":"text","title":"🔮 Kejadian yang sudah diceritakan","body":"Kejadian yang sudah diceritakan\nKita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-03', l.id, m.category_id, 'Amati: Nama penerbit buku', 'intl-v1-stories-11-12-05-materi-03', 'Bandingkan dengan ide utama: menebak kelanjutan cerita.', '[{"type":"text","title":"💭 Nama penerbit buku","body":"Nama penerbit buku\nBandingkan dengan ide utama: menebak kelanjutan cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-04', l.id, m.category_id, 'Amati: Jumlah warna pada sampul', 'intl-v1-stories-11-12-05-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah warna pada sampul","body":"Jumlah warna pada sampul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-05', l.id, m.category_id, 'Misi: Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-05', 'Permainan word-image untuk menguatkan pemahaman menebak kelanjutan cerita.', '[{"type":"game","title":"Misi kecil: Menebak Kelanjutan Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Petunjuk apa yang paling membantu menebak kelanjutan cerita?', 'intl-v1-stories-11-12-05-materi-06', 'Terapkan pemahamanmu: Petunjuk apa yang paling membantu menebak kelanjutan cerita?', '[{"type":"question","title":"Terapkan pemahamanmu: Petunjuk apa yang paling membantu menebak kelanjutan cerita?","body":"✔ Kejadian yang sudah diceritakan\n• Nama penerbit buku\n• Jumlah warna pada sampul"},{"type":"text","title":"Petunjuk","body":"Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Petunjuk apa yang paling membantu menebak kelanjutan cerita?"]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-07', l.id, m.category_id, 'Soal: Ide utama Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-07', 'Mengenali gagasan pokok dari menebak kelanjutan cerita.', '[{"type":"question","title":"Apa ide utama dari Menebak Kelanjutan Cerita?","body":"✔ Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.\n• Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.\n• Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-08', l.id, m.category_id, 'Soal: Penerapan Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-08', 'Memilih langkah yang tepat saat mempelajari menebak kelanjutan cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari menebak kelanjutan cerita?","body":"✔ Kejadian yang sudah diceritakan\n• Nama penerbit buku\n• Jumlah warna pada sampul\n• Tindakan tokoh dan akibatnya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan menebak kelanjutan cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh menebak kelanjutan cerita?","body":"✔ Nama penerbit buku\n• Kejadian yang sudah diceritakan\n• Tindakan tokoh dan akibatnya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-05-materi-10', l.id, m.category_id, 'Refleksi: Menebak Kelanjutan Cerita', 'intl-v1-stories-11-12-05-materi-10', 'Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh menebak kelanjutan cerita yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-05'
   WHERE m.id = 'intl-v1-stories-11-12-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-01', l.id, m.category_id, 'Ringkasan: Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-01', 'Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.', '[{"type":"text","title":"Yuk belajar: Menceritakan Kembali","body":"Hai, teman! Hari ini kita belajar menceritakan kembali."},{"type":"text","title":"Penjelasan","body":"Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'advanced', '["Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-02', l.id, m.category_id, 'Amati: Tokoh dan kejadian penting', 'intl-v1-stories-11-12-06-materi-02', 'Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.', '[{"type":"text","title":"🗣️ Tokoh dan kejadian penting","body":"Tokoh dan kejadian penting\nSaat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'advanced', '["Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-03', l.id, m.category_id, 'Amati: Semua warna gambar', 'intl-v1-stories-11-12-06-materi-03', 'Bandingkan dengan ide utama: menceritakan kembali.', '[{"type":"text","title":"💭 Semua warna gambar","body":"Semua warna gambar\nBandingkan dengan ide utama: menceritakan kembali."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-04', l.id, m.category_id, 'Amati: Nomor setiap halaman', 'intl-v1-stories-11-12-06-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Nomor setiap halaman","body":"Nomor setiap halaman\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-05', l.id, m.category_id, 'Misi: Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-05', 'Permainan word-image untuk menguatkan pemahaman menceritakan kembali.', '[{"type":"game","title":"Misi kecil: Menceritakan Kembali","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Apa yang sebaiknya disebut saat menceritakan kembali?', 'intl-v1-stories-11-12-06-materi-06', 'Terapkan pemahamanmu: Apa yang sebaiknya disebut saat menceritakan kembali?', '[{"type":"question","title":"Terapkan pemahamanmu: Apa yang sebaiknya disebut saat menceritakan kembali?","body":"✔ Tokoh dan kejadian penting\n• Semua warna gambar\n• Nomor setiap halaman"},{"type":"text","title":"Petunjuk","body":"Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Apa yang sebaiknya disebut saat menceritakan kembali?"]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-07', l.id, m.category_id, 'Soal: Ide utama Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-07', 'Mengenali gagasan pokok dari menceritakan kembali.', '[{"type":"question","title":"Apa ide utama dari Menceritakan Kembali?","body":"✔ Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.\n• Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.\n• Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-08', l.id, m.category_id, 'Soal: Penerapan Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-08', 'Memilih langkah yang tepat saat mempelajari menceritakan kembali.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari menceritakan kembali?","body":"✔ Tokoh dan kejadian penting\n• Semua warna gambar\n• Nomor setiap halaman\n• Kalimat dan gambar di sekitarnya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan menceritakan kembali."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh menceritakan kembali?","body":"✔ Semua warna gambar\n• Tokoh dan kejadian penting\n• Kalimat dan gambar di sekitarnya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-06-materi-10', l.id, m.category_id, 'Refleksi: Menceritakan Kembali', 'intl-v1-stories-11-12-06-materi-10', 'Hebat! Sekarang kamu sudah belajar menceritakan kembali.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar menceritakan kembali."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh menceritakan kembali yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'advanced', '["Hebat! Sekarang kamu sudah belajar menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-06'
   WHERE m.id = 'intl-v1-stories-11-12-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-01', l.id, m.category_id, 'Ringkasan: Memahami Pesan Cerita', 'intl-v1-stories-11-12-07-materi-01', 'Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.', '[{"type":"text","title":"Yuk belajar: Memahami Pesan Cerita","body":"Hai, teman! Hari ini kita belajar memahami pesan cerita."},{"type":"text","title":"Penjelasan","body":"Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-02', l.id, m.category_id, 'Amati: Tindakan tokoh dan akibatnya', 'intl-v1-stories-11-12-07-materi-02', 'Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.', '[{"type":"text","title":"💛 Tindakan tokoh dan akibatnya","body":"Tindakan tokoh dan akibatnya\nPesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-03', l.id, m.category_id, 'Amati: Ukuran huruf judul', 'intl-v1-stories-11-12-07-materi-03', 'Bandingkan dengan ide utama: memahami pesan cerita.', '[{"type":"text","title":"💭 Ukuran huruf judul","body":"Ukuran huruf judul\nBandingkan dengan ide utama: memahami pesan cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Bandingkan dengan ide utama: memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-04', l.id, m.category_id, 'Amati: Jumlah ilustrasi', 'intl-v1-stories-11-12-07-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah ilustrasi","body":"Jumlah ilustrasi\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'advanced', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-05', l.id, m.category_id, 'Misi: Memahami Pesan Cerita', 'intl-v1-stories-11-12-07-materi-05', 'Permainan word-image untuk menguatkan pemahaman memahami pesan cerita.', '[{"type":"game","title":"Misi kecil: Memahami Pesan Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'advanced', '["Permainan word-image untuk menguatkan pemahaman memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-06', l.id, m.category_id, 'Latihan: Terapkan pemahamanmu: Apa yang dapat membantu kita menemukan pesan cerita?', 'intl-v1-stories-11-12-07-materi-06', 'Terapkan pemahamanmu: Apa yang dapat membantu kita menemukan pesan cerita?', '[{"type":"question","title":"Terapkan pemahamanmu: Apa yang dapat membantu kita menemukan pesan cerita?","body":"✔ Tindakan tokoh dan akibatnya\n• Ukuran huruf judul\n• Jumlah ilustrasi"},{"type":"text","title":"Petunjuk","body":"Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya. Terapkan konsep, pertimbangkan pilihan, dan jelaskan alasanmu."}]', '', '', m.age_min, m.age_max, 'advanced', '["Terapkan pemahamanmu: Apa yang dapat membantu kita menemukan pesan cerita?"]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-07', l.id, m.category_id, 'Soal: Ide utama Memahami Pesan Cerita', 'intl-v1-stories-11-12-07-materi-07', 'Mengenali gagasan pokok dari memahami pesan cerita.', '[{"type":"question","title":"Apa ide utama dari Memahami Pesan Cerita?","body":"✔ Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.\n• Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.\n• Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'advanced', '["Mengenali gagasan pokok dari memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-11-12-07-materi-08', l.id, m.category_id, 'Soal: Penerapan Memahami Pesan Cerita', 'intl-v1-stories-11-12-07-materi-08', 'Memilih langkah yang tepat saat mempelajari memahami pesan cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari memahami pesan cerita?","body":"✔ Tindakan tokoh dan akibatnya\n• Ukuran huruf judul\n• Jumlah ilustrasi\n• Ucapan dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan memahami pesan cerita."}]', '', '', m.age_min, m.age_max, 'advanced', '["Memilih langkah yang tepat saat mempelajari memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-11-12-07'
   WHERE m.id = 'intl-v1-stories-11-12-07';
