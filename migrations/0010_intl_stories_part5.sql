-- 10 materi per modul intl-* kategori cerita, disusun dari isi lesson di D1.
-- Dihasilkan oleh scripts/generate-intl-stories-materials.mjs. Jangan diubah manual.
-- INSERT OR IGNORE sehingga aman dijalankan berulang.
INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-07-materi-10', l.id, m.category_id, 'Panduan orang tua: Memahami Pesan Cerita', 'intl-v1-stories-4-5-07-materi-10', 'Cara mendampingi anak belajar memahami pesan cerita di rumah.', '[{"type":"text","title":"Inti materi","body":"Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."},{"type":"text","title":"Saran pendampingan","body":"Bacakan ringkasan bersama anak, lalu minta anak menjelaskan memahami pesan cerita dengan kata-katanya sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cara mendampingi anak belajar memahami pesan cerita di rumah."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-07'
   WHERE m.id = 'intl-v1-stories-4-5-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-01', l.id, m.category_id, 'Ringkasan: Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-01', 'Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.', '[{"type":"text","title":"Yuk belajar: Mengenal Kosakata Baru","body":"Hai, teman! Hari ini kita belajar mengenal kosakata baru."},{"type":"text","title":"Penjelasan","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-02', l.id, m.category_id, 'Amati: Kalimat dan gambar di sekitarnya', 'intl-v1-stories-4-5-08-materi-02', 'Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.', '[{"type":"text","title":"🔤 Kalimat dan gambar di sekitarnya","body":"Kalimat dan gambar di sekitarnya\nKata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-03', l.id, m.category_id, 'Amati: Nomor halaman terakhir', 'intl-v1-stories-4-5-08-materi-03', 'Bandingkan dengan ide utama: mengenal kosakata baru.', '[{"type":"text","title":"💭 Nomor halaman terakhir","body":"Nomor halaman terakhir\nBandingkan dengan ide utama: mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bandingkan dengan ide utama: mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-04', l.id, m.category_id, 'Misi: Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-04', 'Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru.', '[{"type":"game","title":"Misi kecil: Mengenal Kosakata Baru","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-05', l.id, m.category_id, 'Latihan: Pilih jawaban yang tepat: Saat menemukan kata baru, apa yang dapat kita periksa?', 'intl-v1-stories-4-5-08-materi-05', 'Pilih jawaban yang tepat: Saat menemukan kata baru, apa yang dapat kita periksa?', '[{"type":"question","title":"Pilih jawaban yang tepat: Saat menemukan kata baru, apa yang dapat kita periksa?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir"},{"type":"text","title":"Petunjuk","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya. Amati contoh, sebutkan idenya, lalu coba sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pilih jawaban yang tepat: Saat menemukan kata baru, apa yang dapat kita periksa?"]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-06', l.id, m.category_id, 'Soal: Ide utama Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-06', 'Mengenali gagasan pokok dari mengenal kosakata baru.', '[{"type":"question","title":"Apa ide utama dari Mengenal Kosakata Baru?","body":"✔ Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.\n• Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Tokoh adalah orang atau hewan dalam cerita."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mengenali gagasan pokok dari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-07', l.id, m.category_id, 'Soal: Penerapan Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-07', 'Memilih langkah yang tepat saat mempelajari mengenal kosakata baru.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mengenal kosakata baru?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'beginner', '["Memilih langkah yang tepat saat mempelajari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-08', l.id, m.category_id, 'Soal: Bukan contoh Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-08', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mengenal kosakata baru?","body":"✔ Nomor halaman terakhir\n• Kalimat dan gambar di sekitarnya\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-09', l.id, m.category_id, 'Refleksi: Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-09', 'Hebat! Sekarang kamu sudah belajar mengenal kosakata baru.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mengenal kosakata baru yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-08-materi-10', l.id, m.category_id, 'Panduan orang tua: Mengenal Kosakata Baru', 'intl-v1-stories-4-5-08-materi-10', 'Cara mendampingi anak belajar mengenal kosakata baru di rumah.', '[{"type":"text","title":"Inti materi","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."},{"type":"text","title":"Saran pendampingan","body":"Bacakan ringkasan bersama anak, lalu minta anak menjelaskan mengenal kosakata baru dengan kata-katanya sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cara mendampingi anak belajar mengenal kosakata baru di rumah."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-08'
   WHERE m.id = 'intl-v1-stories-4-5-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-01', l.id, m.category_id, 'Ringkasan: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-01', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"Yuk belajar: Melihat dari Sudut Pandang Tokoh","body":"Hai, teman! Hari ini kita belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Penjelasan","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-02', l.id, m.category_id, 'Amati: Ucapan dan tindakannya', 'intl-v1-stories-4-5-09-materi-02', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"👀 Ucapan dan tindakannya","body":"Ucapan dan tindakannya\nTokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'beginner', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-03', l.id, m.category_id, 'Amati: Panjang nama tokoh', 'intl-v1-stories-4-5-09-materi-03', 'Bandingkan dengan ide utama: melihat dari sudut pandang tokoh.', '[{"type":"text","title":"💭 Panjang nama tokoh","body":"Panjang nama tokoh\nBandingkan dengan ide utama: melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bandingkan dengan ide utama: melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-04', l.id, m.category_id, 'Misi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-04', 'Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh.', '[{"type":"game","title":"Misi kecil: Melihat dari Sudut Pandang Tokoh","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-05', l.id, m.category_id, 'Latihan: Pilih jawaban yang tepat: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', 'intl-v1-stories-4-5-09-materi-05', 'Pilih jawaban yang tepat: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', '[{"type":"question","title":"Pilih jawaban yang tepat: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh"},{"type":"text","title":"Petunjuk","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda. Amati contoh, sebutkan idenya, lalu coba sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pilih jawaban yang tepat: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?"]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-06', l.id, m.category_id, 'Soal: Ide utama Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-06', 'Mengenali gagasan pokok dari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Apa ide utama dari Melihat dari Sudut Pandang Tokoh?","body":"✔ Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Cerita memiliki awal, tengah, dan akhir."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mengenali gagasan pokok dari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-07', l.id, m.category_id, 'Soal: Penerapan Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-07', 'Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari melihat dari sudut pandang tokoh?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'beginner', '["Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-08', l.id, m.category_id, 'Soal: Bukan contoh Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-08', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh melihat dari sudut pandang tokoh?","body":"✔ Panjang nama tokoh\n• Ucapan dan tindakannya\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-09', l.id, m.category_id, 'Refleksi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-09', 'Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh melihat dari sudut pandang tokoh yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-09-materi-10', l.id, m.category_id, 'Panduan orang tua: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-4-5-09-materi-10', 'Cara mendampingi anak belajar melihat dari sudut pandang tokoh di rumah.', '[{"type":"text","title":"Inti materi","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."},{"type":"text","title":"Saran pendampingan","body":"Bacakan ringkasan bersama anak, lalu minta anak menjelaskan melihat dari sudut pandang tokoh dengan kata-katanya sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cara mendampingi anak belajar melihat dari sudut pandang tokoh di rumah."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-09'
   WHERE m.id = 'intl-v1-stories-4-5-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-01', l.id, m.category_id, 'Ringkasan: Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-01', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"Yuk belajar: Cerita Khayalan dan Fakta","body":"Hai, teman! Hari ini kita belajar cerita khayalan dan fakta."},{"type":"text","title":"Penjelasan","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-02', l.id, m.category_id, 'Amati: Kelinci terbang ke bulan', 'intl-v1-stories-4-5-10-materi-02', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"✨ Kelinci terbang ke bulan","body":"Kelinci terbang ke bulan\nCerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-03', l.id, m.category_id, 'Amati: Air mengalir ke tempat rendah', 'intl-v1-stories-4-5-10-materi-03', 'Bandingkan dengan ide utama: cerita khayalan dan fakta.', '[{"type":"text","title":"💭 Air mengalir ke tempat rendah","body":"Air mengalir ke tempat rendah\nBandingkan dengan ide utama: cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Bandingkan dengan ide utama: cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-04', l.id, m.category_id, 'Misi: Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-04', 'Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta.', '[{"type":"game","title":"Misi kecil: Cerita Khayalan dan Fakta","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'beginner', '["Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-05', l.id, m.category_id, 'Latihan: Pilih jawaban yang tepat: Mana yang merupakan kejadian khayalan?', 'intl-v1-stories-4-5-10-materi-05', 'Pilih jawaban yang tepat: Mana yang merupakan kejadian khayalan?', '[{"type":"question","title":"Pilih jawaban yang tepat: Mana yang merupakan kejadian khayalan?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah"},{"type":"text","title":"Petunjuk","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata. Amati contoh, sebutkan idenya, lalu coba sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Pilih jawaban yang tepat: Mana yang merupakan kejadian khayalan?"]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-06', l.id, m.category_id, 'Soal: Ide utama Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-06', 'Mengenali gagasan pokok dari cerita khayalan dan fakta.', '[{"type":"question","title":"Apa ide utama dari Cerita Khayalan dan Fakta?","body":"✔ Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Tokoh adalah orang atau hewan dalam cerita.\n• Kejadian dalam cerita berlangsung berurutan."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'beginner', '["Mengenali gagasan pokok dari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-07', l.id, m.category_id, 'Soal: Penerapan Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-07', 'Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari cerita khayalan dan fakta?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'beginner', '["Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-08', l.id, m.category_id, 'Soal: Bukan contoh Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-08', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh cerita khayalan dan fakta?","body":"✔ Air mengalir ke tempat rendah\n• Kelinci terbang ke bulan\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'beginner', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-09', l.id, m.category_id, 'Refleksi: Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-09', 'Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh cerita khayalan dan fakta yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'beginner', '["Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-4-5-10-materi-10', l.id, m.category_id, 'Panduan orang tua: Cerita Khayalan dan Fakta', 'intl-v1-stories-4-5-10-materi-10', 'Cara mendampingi anak belajar cerita khayalan dan fakta di rumah.', '[{"type":"text","title":"Inti materi","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."},{"type":"text","title":"Saran pendampingan","body":"Bacakan ringkasan bersama anak, lalu minta anak menjelaskan cerita khayalan dan fakta dengan kata-katanya sendiri."}]', '', '', m.age_min, m.age_max, 'beginner', '["Cara mendampingi anak belajar cerita khayalan dan fakta di rumah."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-4-5-10'
   WHERE m.id = 'intl-v1-stories-4-5-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-01', l.id, m.category_id, 'Ringkasan: Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-01', 'Tokoh adalah orang atau hewan dalam cerita.', '[{"type":"text","title":"Yuk belajar: Tokoh dan Perasaan","body":"Hai, teman! Hari ini kita belajar tokoh dan perasaan."},{"type":"text","title":"Penjelasan","body":"Tokoh adalah orang atau hewan dalam cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh adalah orang atau hewan dalam cerita."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-02', l.id, m.category_id, 'Amati: Melihat kata dan tindakannya', 'intl-v1-stories-6-7-01-materi-02', 'Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka.', '[{"type":"text","title":"🙂 Melihat kata dan tindakannya","body":"Melihat kata dan tindakannya\nTokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-03', l.id, m.category_id, 'Amati: Menghitung jumlah halaman', 'intl-v1-stories-6-7-01-materi-03', 'Bandingkan dengan ide utama: tokoh dan perasaan.', '[{"type":"text","title":"💭 Menghitung jumlah halaman","body":"Menghitung jumlah halaman\nBandingkan dengan ide utama: tokoh dan perasaan."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-04', l.id, m.category_id, 'Amati: Memilih warna sampul', 'intl-v1-stories-6-7-01-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Memilih warna sampul","body":"Memilih warna sampul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-05', l.id, m.category_id, 'Misi: Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-05', 'Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan.', '[{"type":"game","title":"Misi kecil: Tokoh dan Perasaan","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Bagaimana cara mengetahui perasaan tokoh?', 'intl-v1-stories-6-7-01-materi-06', 'Perhatikan lalu jawab: Bagaimana cara mengetahui perasaan tokoh?', '[{"type":"question","title":"Perhatikan lalu jawab: Bagaimana cara mengetahui perasaan tokoh?","body":"✔ Melihat kata dan tindakannya\n• Menghitung jumlah halaman\n• Memilih warna sampul"},{"type":"text","title":"Petunjuk","body":"Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Bagaimana cara mengetahui perasaan tokoh?"]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-07', l.id, m.category_id, 'Soal: Ide utama Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-07', 'Mengenali gagasan pokok dari tokoh dan perasaan.', '[{"type":"question","title":"Apa ide utama dari Tokoh dan Perasaan?","body":"✔ Tokoh adalah orang atau hewan dalam cerita.\n• Cerita memiliki awal, tengah, dan akhir.\n• Sebab menjelaskan mengapa sesuatu terjadi."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Tokoh adalah orang atau hewan dalam cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-08', l.id, m.category_id, 'Soal: Penerapan Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-08', 'Memilih langkah yang tepat saat mempelajari tokoh dan perasaan.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari tokoh dan perasaan?","body":"✔ Melihat kata dan tindakannya\n• Menghitung jumlah halaman\n• Memilih warna sampul\n• Urutan peristiwa"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan tokoh dan perasaan."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh tokoh dan perasaan?","body":"✔ Menghitung jumlah halaman\n• Melihat kata dan tindakannya\n• Urutan peristiwa"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-01-materi-10', l.id, m.category_id, 'Refleksi: Tokoh dan Perasaan', 'intl-v1-stories-6-7-01-materi-10', 'Hebat! Sekarang kamu sudah belajar tokoh dan perasaan.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar tokoh dan perasaan."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh tokoh dan perasaan yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-01'
   WHERE m.id = 'intl-v1-stories-6-7-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-01', l.id, m.category_id, 'Ringkasan: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-01', 'Cerita memiliki awal, tengah, dan akhir.', '[{"type":"text","title":"Yuk belajar: Awal, Tengah, dan Akhir Cerita","body":"Hai, teman! Hari ini kita belajar awal, tengah, dan akhir cerita."},{"type":"text","title":"Penjelasan","body":"Cerita memiliki awal, tengah, dan akhir."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita memiliki awal, tengah, dan akhir."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-02', l.id, m.category_id, 'Amati: Awal cerita', 'intl-v1-stories-6-7-02-materi-02', 'Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi.', '[{"type":"text","title":"📖 Awal cerita","body":"Awal cerita\nCerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-03', l.id, m.category_id, 'Amati: Akhir cerita', 'intl-v1-stories-6-7-02-materi-03', 'Bandingkan dengan ide utama: awal, tengah, dan akhir cerita.', '[{"type":"text","title":"💭 Akhir cerita","body":"Akhir cerita\nBandingkan dengan ide utama: awal, tengah, dan akhir cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-04', l.id, m.category_id, 'Amati: Daftar isi', 'intl-v1-stories-6-7-02-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Daftar isi","body":"Daftar isi\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-05', l.id, m.category_id, 'Misi: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-05', 'Permainan word-image untuk menguatkan pemahaman awal, tengah, dan akhir cerita.', '[{"type":"game","title":"Misi kecil: Awal, Tengah, dan Akhir Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Bagian mana yang biasanya memperkenalkan tokoh?', 'intl-v1-stories-6-7-02-materi-06', 'Perhatikan lalu jawab: Bagian mana yang biasanya memperkenalkan tokoh?', '[{"type":"question","title":"Perhatikan lalu jawab: Bagian mana yang biasanya memperkenalkan tokoh?","body":"✔ Awal cerita\n• Akhir cerita\n• Daftar isi"},{"type":"text","title":"Petunjuk","body":"Cerita memiliki awal, tengah, dan akhir. Urutan membantu kita memahami apa yang terjadi. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Bagian mana yang biasanya memperkenalkan tokoh?"]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-07', l.id, m.category_id, 'Soal: Ide utama Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-07', 'Mengenali gagasan pokok dari awal, tengah, dan akhir cerita.', '[{"type":"question","title":"Apa ide utama dari Awal, Tengah, dan Akhir Cerita?","body":"✔ Cerita memiliki awal, tengah, dan akhir.\n• Kejadian dalam cerita berlangsung berurutan.\n• Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Cerita memiliki awal, tengah, dan akhir."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-08', l.id, m.category_id, 'Soal: Penerapan Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-08', 'Memilih langkah yang tepat saat mempelajari awal, tengah, dan akhir cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari awal, tengah, dan akhir cerita?","body":"✔ Awal cerita\n• Akhir cerita\n• Daftar isi\n• Hujan turun"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan awal, tengah, dan akhir cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh awal, tengah, dan akhir cerita?","body":"✔ Akhir cerita\n• Awal cerita\n• Hujan turun"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-02-materi-10', l.id, m.category_id, 'Refleksi: Awal, Tengah, dan Akhir Cerita', 'intl-v1-stories-6-7-02-materi-10', 'Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh awal, tengah, dan akhir cerita yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar awal, tengah, dan akhir cerita."]', '["story-sequence"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-02'
   WHERE m.id = 'intl-v1-stories-6-7-02';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-01', l.id, m.category_id, 'Ringkasan: Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-01', 'Kejadian dalam cerita berlangsung berurutan.', '[{"type":"text","title":"Yuk belajar: Mengurutkan Kejadian","body":"Hai, teman! Hari ini kita belajar mengurutkan kejadian."},{"type":"text","title":"Penjelasan","body":"Kejadian dalam cerita berlangsung berurutan."}]', '', '', m.age_min, m.age_max, 'developing', '["Kejadian dalam cerita berlangsung berurutan."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-02', l.id, m.category_id, 'Amati: Urutan peristiwa', 'intl-v1-stories-6-7-03-materi-02', 'Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk.', '[{"type":"text","title":"➡️ Urutan peristiwa","body":"Urutan peristiwa\nKejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk."}]', '', '', m.age_min, m.age_max, 'developing', '["Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-03', l.id, m.category_id, 'Amati: Warna gambar', 'intl-v1-stories-6-7-03-materi-03', 'Bandingkan dengan ide utama: mengurutkan kejadian.', '[{"type":"text","title":"💭 Warna gambar","body":"Warna gambar\nBandingkan dengan ide utama: mengurutkan kejadian."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-04', l.id, m.category_id, 'Amati: Jumlah huruf judul', 'intl-v1-stories-6-7-03-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah huruf judul","body":"Jumlah huruf judul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-05', l.id, m.category_id, 'Misi: Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-05', 'Permainan word-image untuk menguatkan pemahaman mengurutkan kejadian.', '[{"type":"game","title":"Misi kecil: Mengurutkan Kejadian","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Apa yang membantu kita mengetahui kejadian berikutnya?', 'intl-v1-stories-6-7-03-materi-06', 'Perhatikan lalu jawab: Apa yang membantu kita mengetahui kejadian berikutnya?', '[{"type":"question","title":"Perhatikan lalu jawab: Apa yang membantu kita mengetahui kejadian berikutnya?","body":"✔ Urutan peristiwa\n• Warna gambar\n• Jumlah huruf judul"},{"type":"text","title":"Petunjuk","body":"Kejadian dalam cerita berlangsung berurutan. Kata seperti lalu dan setelah itu memberi petunjuk. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Apa yang membantu kita mengetahui kejadian berikutnya?"]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-07', l.id, m.category_id, 'Soal: Ide utama Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-07', 'Mengenali gagasan pokok dari mengurutkan kejadian.', '[{"type":"question","title":"Apa ide utama dari Mengurutkan Kejadian?","body":"✔ Kejadian dalam cerita berlangsung berurutan.\n• Sebab menjelaskan mengapa sesuatu terjadi.\n• Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kejadian dalam cerita berlangsung berurutan."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-08', l.id, m.category_id, 'Soal: Penerapan Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-08', 'Memilih langkah yang tepat saat mempelajari mengurutkan kejadian.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mengurutkan kejadian?","body":"✔ Urutan peristiwa\n• Warna gambar\n• Jumlah huruf judul\n• Kejadian yang sudah diceritakan"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mengurutkan kejadian."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mengurutkan kejadian?","body":"✔ Warna gambar\n• Urutan peristiwa\n• Kejadian yang sudah diceritakan"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-03-materi-10', l.id, m.category_id, 'Refleksi: Mengurutkan Kejadian', 'intl-v1-stories-6-7-03-materi-10', 'Hebat! Sekarang kamu sudah belajar mengurutkan kejadian.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mengurutkan kejadian."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mengurutkan kejadian yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar mengurutkan kejadian."]', '["story-order"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-03'
   WHERE m.id = 'intl-v1-stories-6-7-03';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-01', l.id, m.category_id, 'Ringkasan: Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-01', 'Sebab menjelaskan mengapa sesuatu terjadi.', '[{"type":"text","title":"Yuk belajar: Mencari Sebab dan Akibat","body":"Hai, teman! Hari ini kita belajar mencari sebab dan akibat."},{"type":"text","title":"Penjelasan","body":"Sebab menjelaskan mengapa sesuatu terjadi."}]', '', '', m.age_min, m.age_max, 'developing', '["Sebab menjelaskan mengapa sesuatu terjadi."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-02', l.id, m.category_id, 'Amati: Hujan turun', 'intl-v1-stories-6-7-04-materi-02', 'Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya.', '[{"type":"text","title":"🔗 Hujan turun","body":"Hujan turun\nSebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-03', l.id, m.category_id, 'Amati: Matahari bersinar', 'intl-v1-stories-6-7-04-materi-03', 'Bandingkan dengan ide utama: mencari sebab dan akibat.', '[{"type":"text","title":"💭 Matahari bersinar","body":"Matahari bersinar\nBandingkan dengan ide utama: mencari sebab dan akibat."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-04', l.id, m.category_id, 'Amati: Angin berhenti', 'intl-v1-stories-6-7-04-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Angin berhenti","body":"Angin berhenti\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-05', l.id, m.category_id, 'Misi: Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-05', 'Permainan word-image untuk menguatkan pemahaman mencari sebab dan akibat.', '[{"type":"game","title":"Misi kecil: Mencari Sebab dan Akibat","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Jika hujan membuat jalan basah, apa sebab jalan basah?', 'intl-v1-stories-6-7-04-materi-06', 'Perhatikan lalu jawab: Jika hujan membuat jalan basah, apa sebab jalan basah?', '[{"type":"question","title":"Perhatikan lalu jawab: Jika hujan membuat jalan basah, apa sebab jalan basah?","body":"✔ Hujan turun\n• Matahari bersinar\n• Angin berhenti"},{"type":"text","title":"Petunjuk","body":"Sebab menjelaskan mengapa sesuatu terjadi. Akibat adalah hal yang terjadi sesudahnya. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Jika hujan membuat jalan basah, apa sebab jalan basah?"]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-07', l.id, m.category_id, 'Soal: Ide utama Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-07', 'Mengenali gagasan pokok dari mencari sebab dan akibat.', '[{"type":"question","title":"Apa ide utama dari Mencari Sebab dan Akibat?","body":"✔ Sebab menjelaskan mengapa sesuatu terjadi.\n• Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.\n• Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Sebab menjelaskan mengapa sesuatu terjadi."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';
