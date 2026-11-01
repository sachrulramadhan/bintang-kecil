-- 10 materi per modul intl-* kategori cerita, disusun dari isi lesson di D1.
-- Dihasilkan oleh scripts/generate-intl-stories-materials.mjs. Jangan diubah manual.
-- INSERT OR IGNORE sehingga aman dijalankan berulang.
INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-03', l.id, m.category_id, 'Amati: Nomor halaman terakhir', 'intl-v1-stories-8-10-08-materi-03', 'Bandingkan dengan ide utama: mengenal kosakata baru.', '[{"type":"text","title":"💭 Nomor halaman terakhir","body":"Nomor halaman terakhir\nBandingkan dengan ide utama: mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-04', l.id, m.category_id, 'Amati: Warna punggung buku', 'intl-v1-stories-8-10-08-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Warna punggung buku","body":"Warna punggung buku\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-05', l.id, m.category_id, 'Misi: Mengenal Kosakata Baru', 'intl-v1-stories-8-10-08-materi-05', 'Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru.', '[{"type":"game","title":"Misi kecil: Mengenal Kosakata Baru","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-06', l.id, m.category_id, 'Latihan: Gunakan yang sudah kamu pelajari: Saat menemukan kata baru, apa yang dapat kita periksa?', 'intl-v1-stories-8-10-08-materi-06', 'Gunakan yang sudah kamu pelajari: Saat menemukan kata baru, apa yang dapat kita periksa?', '[{"type":"question","title":"Gunakan yang sudah kamu pelajari: Saat menemukan kata baru, apa yang dapat kita periksa?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir\n• Warna punggung buku"},{"type":"text","title":"Petunjuk","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya. Bandingkan contoh dan gunakan idemu pada kegiatan sehari-hari."}]', '', '', m.age_min, m.age_max, 'developing', '["Gunakan yang sudah kamu pelajari: Saat menemukan kata baru, apa yang dapat kita periksa?"]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-07', l.id, m.category_id, 'Soal: Ide utama Mengenal Kosakata Baru', 'intl-v1-stories-8-10-08-materi-07', 'Mengenali gagasan pokok dari mengenal kosakata baru.', '[{"type":"question","title":"Apa ide utama dari Mengenal Kosakata Baru?","body":"✔ Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.\n• Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Tokoh adalah orang atau hewan dalam cerita."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-08', l.id, m.category_id, 'Soal: Penerapan Mengenal Kosakata Baru', 'intl-v1-stories-8-10-08-materi-08', 'Memilih langkah yang tepat saat mempelajari mengenal kosakata baru.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mengenal kosakata baru?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir\n• Warna punggung buku\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mengenal Kosakata Baru', 'intl-v1-stories-8-10-08-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mengenal kosakata baru?","body":"✔ Nomor halaman terakhir\n• Kalimat dan gambar di sekitarnya\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-08-materi-10', l.id, m.category_id, 'Refleksi: Mengenal Kosakata Baru', 'intl-v1-stories-8-10-08-materi-10', 'Hebat! Sekarang kamu sudah belajar mengenal kosakata baru.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mengenal kosakata baru yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-08'
   WHERE m.id = 'intl-v1-stories-8-10-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-01', l.id, m.category_id, 'Ringkasan: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-01', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"Yuk belajar: Melihat dari Sudut Pandang Tokoh","body":"Hai, teman! Hari ini kita belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Penjelasan","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-02', l.id, m.category_id, 'Amati: Ucapan dan tindakannya', 'intl-v1-stories-8-10-09-materi-02', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"👀 Ucapan dan tindakannya","body":"Ucapan dan tindakannya\nTokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-03', l.id, m.category_id, 'Amati: Panjang nama tokoh', 'intl-v1-stories-8-10-09-materi-03', 'Bandingkan dengan ide utama: melihat dari sudut pandang tokoh.', '[{"type":"text","title":"💭 Panjang nama tokoh","body":"Panjang nama tokoh\nBandingkan dengan ide utama: melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-04', l.id, m.category_id, 'Amati: Bentuk buku', 'intl-v1-stories-8-10-09-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Bentuk buku","body":"Bentuk buku\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-05', l.id, m.category_id, 'Misi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-05', 'Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh.', '[{"type":"game","title":"Misi kecil: Melihat dari Sudut Pandang Tokoh","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-06', l.id, m.category_id, 'Latihan: Gunakan yang sudah kamu pelajari: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', 'intl-v1-stories-8-10-09-materi-06', 'Gunakan yang sudah kamu pelajari: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', '[{"type":"question","title":"Gunakan yang sudah kamu pelajari: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh\n• Bentuk buku"},{"type":"text","title":"Petunjuk","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda. Bandingkan contoh dan gunakan idemu pada kegiatan sehari-hari."}]', '', '', m.age_min, m.age_max, 'developing', '["Gunakan yang sudah kamu pelajari: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?"]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-07', l.id, m.category_id, 'Soal: Ide utama Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-07', 'Mengenali gagasan pokok dari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Apa ide utama dari Melihat dari Sudut Pandang Tokoh?","body":"✔ Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Cerita memiliki awal, tengah, dan akhir."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-08', l.id, m.category_id, 'Soal: Penerapan Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-08', 'Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari melihat dari sudut pandang tokoh?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh\n• Bentuk buku\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh melihat dari sudut pandang tokoh?","body":"✔ Panjang nama tokoh\n• Ucapan dan tindakannya\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-09-materi-10', l.id, m.category_id, 'Refleksi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-8-10-09-materi-10', 'Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh melihat dari sudut pandang tokoh yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-09'
   WHERE m.id = 'intl-v1-stories-8-10-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-01', l.id, m.category_id, 'Ringkasan: Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-01', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"Yuk belajar: Cerita Khayalan dan Fakta","body":"Hai, teman! Hari ini kita belajar cerita khayalan dan fakta."},{"type":"text","title":"Penjelasan","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-02', l.id, m.category_id, 'Amati: Kelinci terbang ke bulan', 'intl-v1-stories-8-10-10-materi-02', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"✨ Kelinci terbang ke bulan","body":"Kelinci terbang ke bulan\nCerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-03', l.id, m.category_id, 'Amati: Air mengalir ke tempat rendah', 'intl-v1-stories-8-10-10-materi-03', 'Bandingkan dengan ide utama: cerita khayalan dan fakta.', '[{"type":"text","title":"💭 Air mengalir ke tempat rendah","body":"Air mengalir ke tempat rendah\nBandingkan dengan ide utama: cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-04', l.id, m.category_id, 'Amati: Daun tumbuh pada tanaman', 'intl-v1-stories-8-10-10-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Daun tumbuh pada tanaman","body":"Daun tumbuh pada tanaman\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-05', l.id, m.category_id, 'Misi: Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-05', 'Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta.', '[{"type":"game","title":"Misi kecil: Cerita Khayalan dan Fakta","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-06', l.id, m.category_id, 'Latihan: Gunakan yang sudah kamu pelajari: Mana yang merupakan kejadian khayalan?', 'intl-v1-stories-8-10-10-materi-06', 'Gunakan yang sudah kamu pelajari: Mana yang merupakan kejadian khayalan?', '[{"type":"question","title":"Gunakan yang sudah kamu pelajari: Mana yang merupakan kejadian khayalan?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah\n• Daun tumbuh pada tanaman"},{"type":"text","title":"Petunjuk","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata. Bandingkan contoh dan gunakan idemu pada kegiatan sehari-hari."}]', '', '', m.age_min, m.age_max, 'developing', '["Gunakan yang sudah kamu pelajari: Mana yang merupakan kejadian khayalan?"]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-07', l.id, m.category_id, 'Soal: Ide utama Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-07', 'Mengenali gagasan pokok dari cerita khayalan dan fakta.', '[{"type":"question","title":"Apa ide utama dari Cerita Khayalan dan Fakta?","body":"✔ Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Tokoh adalah orang atau hewan dalam cerita.\n• Kejadian dalam cerita berlangsung berurutan."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-08', l.id, m.category_id, 'Soal: Penerapan Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-08', 'Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari cerita khayalan dan fakta?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah\n• Daun tumbuh pada tanaman\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh cerita khayalan dan fakta?","body":"✔ Air mengalir ke tempat rendah\n• Kelinci terbang ke bulan\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-10-materi-10', l.id, m.category_id, 'Refleksi: Cerita Khayalan dan Fakta', 'intl-v1-stories-8-10-10-materi-10', 'Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh cerita khayalan dan fakta yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-10'
   WHERE m.id = 'intl-v1-stories-8-10-10';
