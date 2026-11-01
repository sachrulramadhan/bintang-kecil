-- 10 materi per modul intl-* kategori cerita, disusun dari isi lesson di D1.
-- Dihasilkan oleh scripts/generate-intl-stories-materials.mjs. Jangan diubah manual.
-- INSERT OR IGNORE sehingga aman dijalankan berulang.
INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-08', l.id, m.category_id, 'Soal: Penerapan Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-08', 'Memilih langkah yang tepat saat mempelajari mencari sebab dan akibat.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mencari sebab dan akibat?","body":"✔ Hujan turun\n• Matahari bersinar\n• Angin berhenti\n• Tokoh dan kejadian penting"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mencari sebab dan akibat."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mencari sebab dan akibat?","body":"✔ Matahari bersinar\n• Hujan turun\n• Tokoh dan kejadian penting"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-04-materi-10', l.id, m.category_id, 'Refleksi: Mencari Sebab dan Akibat', 'intl-v1-stories-6-7-04-materi-10', 'Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mencari sebab dan akibat yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar mencari sebab dan akibat."]', '["story-cause-effect"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-04'
   WHERE m.id = 'intl-v1-stories-6-7-04';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-01', l.id, m.category_id, 'Ringkasan: Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-01', 'Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.', '[{"type":"text","title":"Yuk belajar: Menebak Kelanjutan Cerita","body":"Hai, teman! Hari ini kita belajar menebak kelanjutan cerita."},{"type":"text","title":"Penjelasan","body":"Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-02', l.id, m.category_id, 'Amati: Kejadian yang sudah diceritakan', 'intl-v1-stories-6-7-05-materi-02', 'Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.', '[{"type":"text","title":"🔮 Kejadian yang sudah diceritakan","body":"Kejadian yang sudah diceritakan\nKita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-03', l.id, m.category_id, 'Amati: Nama penerbit buku', 'intl-v1-stories-6-7-05-materi-03', 'Bandingkan dengan ide utama: menebak kelanjutan cerita.', '[{"type":"text","title":"💭 Nama penerbit buku","body":"Nama penerbit buku\nBandingkan dengan ide utama: menebak kelanjutan cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-04', l.id, m.category_id, 'Amati: Jumlah warna pada sampul', 'intl-v1-stories-6-7-05-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah warna pada sampul","body":"Jumlah warna pada sampul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-05', l.id, m.category_id, 'Misi: Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-05', 'Permainan word-image untuk menguatkan pemahaman menebak kelanjutan cerita.', '[{"type":"game","title":"Misi kecil: Menebak Kelanjutan Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Petunjuk apa yang paling membantu menebak kelanjutan cerita?', 'intl-v1-stories-6-7-05-materi-06', 'Perhatikan lalu jawab: Petunjuk apa yang paling membantu menebak kelanjutan cerita?', '[{"type":"question","title":"Perhatikan lalu jawab: Petunjuk apa yang paling membantu menebak kelanjutan cerita?","body":"✔ Kejadian yang sudah diceritakan\n• Nama penerbit buku\n• Jumlah warna pada sampul"},{"type":"text","title":"Petunjuk","body":"Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Petunjuk apa yang paling membantu menebak kelanjutan cerita?"]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-07', l.id, m.category_id, 'Soal: Ide utama Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-07', 'Mengenali gagasan pokok dari menebak kelanjutan cerita.', '[{"type":"question","title":"Apa ide utama dari Menebak Kelanjutan Cerita?","body":"✔ Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita.\n• Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.\n• Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kita dapat membuat tebakan masuk akal dengan memakai petunjuk dari cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-08', l.id, m.category_id, 'Soal: Penerapan Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-08', 'Memilih langkah yang tepat saat mempelajari menebak kelanjutan cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari menebak kelanjutan cerita?","body":"✔ Kejadian yang sudah diceritakan\n• Nama penerbit buku\n• Jumlah warna pada sampul\n• Tindakan tokoh dan akibatnya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan menebak kelanjutan cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh menebak kelanjutan cerita?","body":"✔ Nama penerbit buku\n• Kejadian yang sudah diceritakan\n• Tindakan tokoh dan akibatnya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-05-materi-10', l.id, m.category_id, 'Refleksi: Menebak Kelanjutan Cerita', 'intl-v1-stories-6-7-05-materi-10', 'Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh menebak kelanjutan cerita yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar menebak kelanjutan cerita."]', '["story-prediction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-05'
   WHERE m.id = 'intl-v1-stories-6-7-05';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-01', l.id, m.category_id, 'Ringkasan: Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-01', 'Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.', '[{"type":"text","title":"Yuk belajar: Menceritakan Kembali","body":"Hai, teman! Hari ini kita belajar menceritakan kembali."},{"type":"text","title":"Penjelasan","body":"Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'developing', '["Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-02', l.id, m.category_id, 'Amati: Tokoh dan kejadian penting', 'intl-v1-stories-6-7-06-materi-02', 'Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.', '[{"type":"text","title":"🗣️ Tokoh dan kejadian penting","body":"Tokoh dan kejadian penting\nSaat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'developing', '["Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-03', l.id, m.category_id, 'Amati: Semua warna gambar', 'intl-v1-stories-6-7-06-materi-03', 'Bandingkan dengan ide utama: menceritakan kembali.', '[{"type":"text","title":"💭 Semua warna gambar","body":"Semua warna gambar\nBandingkan dengan ide utama: menceritakan kembali."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-04', l.id, m.category_id, 'Amati: Nomor setiap halaman', 'intl-v1-stories-6-7-06-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Nomor setiap halaman","body":"Nomor setiap halaman\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-05', l.id, m.category_id, 'Misi: Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-05', 'Permainan word-image untuk menguatkan pemahaman menceritakan kembali.', '[{"type":"game","title":"Misi kecil: Menceritakan Kembali","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Apa yang sebaiknya disebut saat menceritakan kembali?', 'intl-v1-stories-6-7-06-materi-06', 'Perhatikan lalu jawab: Apa yang sebaiknya disebut saat menceritakan kembali?', '[{"type":"question","title":"Perhatikan lalu jawab: Apa yang sebaiknya disebut saat menceritakan kembali?","body":"✔ Tokoh dan kejadian penting\n• Semua warna gambar\n• Nomor setiap halaman"},{"type":"text","title":"Petunjuk","body":"Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Apa yang sebaiknya disebut saat menceritakan kembali?"]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-07', l.id, m.category_id, 'Soal: Ide utama Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-07', 'Mengenali gagasan pokok dari menceritakan kembali.', '[{"type":"question","title":"Apa ide utama dari Menceritakan Kembali?","body":"✔ Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti.\n• Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.\n• Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Saat menceritakan kembali, sebutkan tokoh dan kejadian penting dengan urutan yang mudah diikuti."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-08', l.id, m.category_id, 'Soal: Penerapan Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-08', 'Memilih langkah yang tepat saat mempelajari menceritakan kembali.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari menceritakan kembali?","body":"✔ Tokoh dan kejadian penting\n• Semua warna gambar\n• Nomor setiap halaman\n• Kalimat dan gambar di sekitarnya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan menceritakan kembali."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh menceritakan kembali?","body":"✔ Semua warna gambar\n• Tokoh dan kejadian penting\n• Kalimat dan gambar di sekitarnya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-06-materi-10', l.id, m.category_id, 'Refleksi: Menceritakan Kembali', 'intl-v1-stories-6-7-06-materi-10', 'Hebat! Sekarang kamu sudah belajar menceritakan kembali.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar menceritakan kembali."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh menceritakan kembali yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar menceritakan kembali."]', '["story-retell"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-06'
   WHERE m.id = 'intl-v1-stories-6-7-06';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-01', l.id, m.category_id, 'Ringkasan: Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-01', 'Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.', '[{"type":"text","title":"Yuk belajar: Memahami Pesan Cerita","body":"Hai, teman! Hari ini kita belajar memahami pesan cerita."},{"type":"text","title":"Penjelasan","body":"Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-02', l.id, m.category_id, 'Amati: Tindakan tokoh dan akibatnya', 'intl-v1-stories-6-7-07-materi-02', 'Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.', '[{"type":"text","title":"💛 Tindakan tokoh dan akibatnya","body":"Tindakan tokoh dan akibatnya\nPesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-03', l.id, m.category_id, 'Amati: Ukuran huruf judul', 'intl-v1-stories-6-7-07-materi-03', 'Bandingkan dengan ide utama: memahami pesan cerita.', '[{"type":"text","title":"💭 Ukuran huruf judul","body":"Ukuran huruf judul\nBandingkan dengan ide utama: memahami pesan cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-04', l.id, m.category_id, 'Amati: Jumlah ilustrasi', 'intl-v1-stories-6-7-07-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Jumlah ilustrasi","body":"Jumlah ilustrasi\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-05', l.id, m.category_id, 'Misi: Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-05', 'Permainan word-image untuk menguatkan pemahaman memahami pesan cerita.', '[{"type":"game","title":"Misi kecil: Memahami Pesan Cerita","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Apa yang dapat membantu kita menemukan pesan cerita?', 'intl-v1-stories-6-7-07-materi-06', 'Perhatikan lalu jawab: Apa yang dapat membantu kita menemukan pesan cerita?', '[{"type":"question","title":"Perhatikan lalu jawab: Apa yang dapat membantu kita menemukan pesan cerita?","body":"✔ Tindakan tokoh dan akibatnya\n• Ukuran huruf judul\n• Jumlah ilustrasi"},{"type":"text","title":"Petunjuk","body":"Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Apa yang dapat membantu kita menemukan pesan cerita?"]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-07', l.id, m.category_id, 'Soal: Ide utama Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-07', 'Mengenali gagasan pokok dari memahami pesan cerita.', '[{"type":"question","title":"Apa ide utama dari Memahami Pesan Cerita?","body":"✔ Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya.\n• Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.\n• Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Pesan cerita adalah pelajaran yang dapat kita pikirkan dari pilihan dan tindakan tokohnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-08', l.id, m.category_id, 'Soal: Penerapan Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-08', 'Memilih langkah yang tepat saat mempelajari memahami pesan cerita.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari memahami pesan cerita?","body":"✔ Tindakan tokoh dan akibatnya\n• Ukuran huruf judul\n• Jumlah ilustrasi\n• Ucapan dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan memahami pesan cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh memahami pesan cerita?","body":"✔ Ukuran huruf judul\n• Tindakan tokoh dan akibatnya\n• Ucapan dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-07-materi-10', l.id, m.category_id, 'Refleksi: Memahami Pesan Cerita', 'intl-v1-stories-6-7-07-materi-10', 'Hebat! Sekarang kamu sudah belajar memahami pesan cerita.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar memahami pesan cerita."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh memahami pesan cerita yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar memahami pesan cerita."]', '["story-message"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-07'
   WHERE m.id = 'intl-v1-stories-6-7-07';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-01', l.id, m.category_id, 'Ringkasan: Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-01', 'Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.', '[{"type":"text","title":"Yuk belajar: Mengenal Kosakata Baru","body":"Hai, teman! Hari ini kita belajar mengenal kosakata baru."},{"type":"text","title":"Penjelasan","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-02', l.id, m.category_id, 'Amati: Kalimat dan gambar di sekitarnya', 'intl-v1-stories-6-7-08-materi-02', 'Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.', '[{"type":"text","title":"🔤 Kalimat dan gambar di sekitarnya","body":"Kalimat dan gambar di sekitarnya\nKata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-03', l.id, m.category_id, 'Amati: Nomor halaman terakhir', 'intl-v1-stories-6-7-08-materi-03', 'Bandingkan dengan ide utama: mengenal kosakata baru.', '[{"type":"text","title":"💭 Nomor halaman terakhir","body":"Nomor halaman terakhir\nBandingkan dengan ide utama: mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-04', l.id, m.category_id, 'Amati: Warna punggung buku', 'intl-v1-stories-6-7-08-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Warna punggung buku","body":"Warna punggung buku\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-05', l.id, m.category_id, 'Misi: Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-05', 'Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru.', '[{"type":"game","title":"Misi kecil: Mengenal Kosakata Baru","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Saat menemukan kata baru, apa yang dapat kita periksa?', 'intl-v1-stories-6-7-08-materi-06', 'Perhatikan lalu jawab: Saat menemukan kata baru, apa yang dapat kita periksa?', '[{"type":"question","title":"Perhatikan lalu jawab: Saat menemukan kata baru, apa yang dapat kita periksa?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir\n• Warna punggung buku"},{"type":"text","title":"Petunjuk","body":"Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Saat menemukan kata baru, apa yang dapat kita periksa?"]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-07', l.id, m.category_id, 'Soal: Ide utama Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-07', 'Mengenali gagasan pokok dari mengenal kosakata baru.', '[{"type":"question","title":"Apa ide utama dari Mengenal Kosakata Baru?","body":"✔ Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya.\n• Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Tokoh adalah orang atau hewan dalam cerita."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Kata baru dapat dipahami dari kalimat, gambar, dan kejadian di sekitarnya."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-08', l.id, m.category_id, 'Soal: Penerapan Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-08', 'Memilih langkah yang tepat saat mempelajari mengenal kosakata baru.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari mengenal kosakata baru?","body":"✔ Kalimat dan gambar di sekitarnya\n• Nomor halaman terakhir\n• Warna punggung buku\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan mengenal kosakata baru."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh mengenal kosakata baru?","body":"✔ Nomor halaman terakhir\n• Kalimat dan gambar di sekitarnya\n• Kelinci terbang ke bulan"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-08-materi-10', l.id, m.category_id, 'Refleksi: Mengenal Kosakata Baru', 'intl-v1-stories-6-7-08-materi-10', 'Hebat! Sekarang kamu sudah belajar mengenal kosakata baru.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh mengenal kosakata baru yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar mengenal kosakata baru."]', '["story-vocabulary"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-08'
   WHERE m.id = 'intl-v1-stories-6-7-08';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-01', l.id, m.category_id, 'Ringkasan: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-01', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"Yuk belajar: Melihat dari Sudut Pandang Tokoh","body":"Hai, teman! Hari ini kita belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Penjelasan","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-02', l.id, m.category_id, 'Amati: Ucapan dan tindakannya', 'intl-v1-stories-6-7-09-materi-02', 'Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.', '[{"type":"text","title":"👀 Ucapan dan tindakannya","body":"Ucapan dan tindakannya\nTokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-03', l.id, m.category_id, 'Amati: Panjang nama tokoh', 'intl-v1-stories-6-7-09-materi-03', 'Bandingkan dengan ide utama: melihat dari sudut pandang tokoh.', '[{"type":"text","title":"💭 Panjang nama tokoh","body":"Panjang nama tokoh\nBandingkan dengan ide utama: melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-04', l.id, m.category_id, 'Amati: Bentuk buku', 'intl-v1-stories-6-7-09-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Bentuk buku","body":"Bentuk buku\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-05', l.id, m.category_id, 'Misi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-05', 'Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh.', '[{"type":"game","title":"Misi kecil: Melihat dari Sudut Pandang Tokoh","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', 'intl-v1-stories-6-7-09-materi-06', 'Perhatikan lalu jawab: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?', '[{"type":"question","title":"Perhatikan lalu jawab: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh\n• Bentuk buku"},{"type":"text","title":"Petunjuk","body":"Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Untuk memahami pikiran tokoh, apa yang perlu kita perhatikan?"]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-07', l.id, m.category_id, 'Soal: Ide utama Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-07', 'Mengenali gagasan pokok dari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Apa ide utama dari Melihat dari Sudut Pandang Tokoh?","body":"✔ Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda.\n• Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Cerita memiliki awal, tengah, dan akhir."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Tokoh yang berbeda dapat melihat kejadian dengan cara yang berbeda."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-08', l.id, m.category_id, 'Soal: Penerapan Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-08', 'Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari melihat dari sudut pandang tokoh?","body":"✔ Ucapan dan tindakannya\n• Panjang nama tokoh\n• Bentuk buku\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan melihat dari sudut pandang tokoh."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh melihat dari sudut pandang tokoh?","body":"✔ Panjang nama tokoh\n• Ucapan dan tindakannya\n• Melihat kata dan tindakannya"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-09-materi-10', l.id, m.category_id, 'Refleksi: Melihat dari Sudut Pandang Tokoh', 'intl-v1-stories-6-7-09-materi-10', 'Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh melihat dari sudut pandang tokoh yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar melihat dari sudut pandang tokoh."]', '["story-perspective"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-09'
   WHERE m.id = 'intl-v1-stories-6-7-09';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-01', l.id, m.category_id, 'Ringkasan: Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-01', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"Yuk belajar: Cerita Khayalan dan Fakta","body":"Hai, teman! Hari ini kita belajar cerita khayalan dan fakta."},{"type":"text","title":"Penjelasan","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-02', l.id, m.category_id, 'Amati: Kelinci terbang ke bulan', 'intl-v1-stories-6-7-10-materi-02', 'Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.', '[{"type":"text","title":"✨ Kelinci terbang ke bulan","body":"Kelinci terbang ke bulan\nCerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-03', l.id, m.category_id, 'Amati: Air mengalir ke tempat rendah', 'intl-v1-stories-6-7-10-materi-03', 'Bandingkan dengan ide utama: cerita khayalan dan fakta.', '[{"type":"text","title":"💭 Air mengalir ke tempat rendah","body":"Air mengalir ke tempat rendah\nBandingkan dengan ide utama: cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-04', l.id, m.category_id, 'Amati: Daun tumbuh pada tanaman', 'intl-v1-stories-6-7-10-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Daun tumbuh pada tanaman","body":"Daun tumbuh pada tanaman\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-05', l.id, m.category_id, 'Misi: Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-05', 'Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta.', '[{"type":"game","title":"Misi kecil: Cerita Khayalan dan Fakta","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-06', l.id, m.category_id, 'Latihan: Perhatikan lalu jawab: Mana yang merupakan kejadian khayalan?', 'intl-v1-stories-6-7-10-materi-06', 'Perhatikan lalu jawab: Mana yang merupakan kejadian khayalan?', '[{"type":"question","title":"Perhatikan lalu jawab: Mana yang merupakan kejadian khayalan?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah\n• Daun tumbuh pada tanaman"},{"type":"text","title":"Petunjuk","body":"Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata. Kenali konsep, lalu jelaskan pilihanmu dengan satu alasan."}]', '', '', m.age_min, m.age_max, 'developing', '["Perhatikan lalu jawab: Mana yang merupakan kejadian khayalan?"]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-07', l.id, m.category_id, 'Soal: Ide utama Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-07', 'Mengenali gagasan pokok dari cerita khayalan dan fakta.', '[{"type":"question","title":"Apa ide utama dari Cerita Khayalan dan Fakta?","body":"✔ Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata.\n• Tokoh adalah orang atau hewan dalam cerita.\n• Kejadian dalam cerita berlangsung berurutan."},{"type":"text","title":"Petunjuk","body":"Ingat kembali: Cerita khayalan dibuat dari imajinasi, sedangkan fakta dapat diperiksa melalui bukti nyata."}]', '', '', m.age_min, m.age_max, 'developing', '["Mengenali gagasan pokok dari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-08', l.id, m.category_id, 'Soal: Penerapan Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-08', 'Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta.', '[{"type":"question","title":"Langkah mana yang paling tepat saat mempelajari cerita khayalan dan fakta?","body":"✔ Kelinci terbang ke bulan\n• Air mengalir ke tempat rendah\n• Daun tumbuh pada tanaman\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Pilih yang berhubungan langsung dengan cerita khayalan dan fakta."}]', '', '', m.age_min, m.age_max, 'developing', '["Memilih langkah yang tepat saat mempelajari cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-09', l.id, m.category_id, 'Soal: Bukan contoh Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-09', 'Membedakan contoh yang sesuai dan yang tidak sesuai.', '[{"type":"question","title":"Mana yang BUKAN contoh cerita khayalan dan fakta?","body":"✔ Air mengalir ke tempat rendah\n• Kelinci terbang ke bulan\n• Awal cerita"},{"type":"text","title":"Petunjuk","body":"Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya."}]', '', '', m.age_min, m.age_max, 'developing', '["Membedakan contoh yang sesuai dan yang tidak sesuai."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-6-7-10-materi-10', l.id, m.category_id, 'Refleksi: Cerita Khayalan dan Fakta', 'intl-v1-stories-6-7-10-materi-10', 'Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta.', '[{"type":"text","title":"Yang sudah kamu pelajari","body":"Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."},{"type":"text","title":"Tugas kecil","body":"Sebutkan satu contoh cerita khayalan dan fakta yang kamu temui hari ini, lalu ceritakan kepada orang tua."}]', '', '', m.age_min, m.age_max, 'developing', '["Hebat! Sekarang kamu sudah belajar cerita khayalan dan fakta."]', '["story-fact-fiction"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-6-7-10'
   WHERE m.id = 'intl-v1-stories-6-7-10';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-01-materi-01', l.id, m.category_id, 'Ringkasan: Tokoh dan Perasaan', 'intl-v1-stories-8-10-01-materi-01', 'Tokoh adalah orang atau hewan dalam cerita.', '[{"type":"text","title":"Yuk belajar: Tokoh dan Perasaan","body":"Hai, teman! Hari ini kita belajar tokoh dan perasaan."},{"type":"text","title":"Penjelasan","body":"Tokoh adalah orang atau hewan dalam cerita."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh adalah orang atau hewan dalam cerita."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-01'
   WHERE m.id = 'intl-v1-stories-8-10-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-01-materi-02', l.id, m.category_id, 'Amati: Melihat kata dan tindakannya', 'intl-v1-stories-8-10-01-materi-02', 'Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka.', '[{"type":"text","title":"🙂 Melihat kata dan tindakannya","body":"Melihat kata dan tindakannya\nTokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."}]', '', '', m.age_min, m.age_max, 'developing', '["Tokoh adalah orang atau hewan dalam cerita. Perhatikan kata dan tindakan untuk mengenali perasaan mereka."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-01'
   WHERE m.id = 'intl-v1-stories-8-10-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-01-materi-03', l.id, m.category_id, 'Amati: Menghitung jumlah halaman', 'intl-v1-stories-8-10-01-materi-03', 'Bandingkan dengan ide utama: tokoh dan perasaan.', '[{"type":"text","title":"💭 Menghitung jumlah halaman","body":"Menghitung jumlah halaman\nBandingkan dengan ide utama: tokoh dan perasaan."}]', '', '', m.age_min, m.age_max, 'developing', '["Bandingkan dengan ide utama: tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-01'
   WHERE m.id = 'intl-v1-stories-8-10-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-01-materi-04', l.id, m.category_id, 'Amati: Memilih warna sampul', 'intl-v1-stories-8-10-01-materi-04', 'Amati baik-baik, lalu pikirkan jawaban yang sesuai.', '[{"type":"text","title":"🔎 Memilih warna sampul","body":"Memilih warna sampul\nAmati baik-baik, lalu pikirkan jawaban yang sesuai."}]', '', '', m.age_min, m.age_max, 'developing', '["Amati baik-baik, lalu pikirkan jawaban yang sesuai."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-01'
   WHERE m.id = 'intl-v1-stories-8-10-01';

INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)
  SELECT 'builtin-material-intl-v1-stories-8-10-01-materi-05', l.id, m.category_id, 'Misi: Tokoh dan Perasaan', 'intl-v1-stories-8-10-01-materi-05', 'Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan.', '[{"type":"game","title":"Misi kecil: Tokoh dan Perasaan","body":"word-image"},{"type":"text","title":"Cara bermain","body":"Amati contoh, lalu pilih pasangan yang tepat."}]', '', '', m.age_min, m.age_max, 'developing', '["Permainan word-image untuk menguatkan pemahaman tokoh dan perasaan."]', '["story-emotions"]', 'published', m.created_by, m.updated_by
    FROM modules m
    LEFT JOIN lessons l ON l.id = 'builtin-lesson-intl-v1-stories-8-10-01'
   WHERE m.id = 'intl-v1-stories-8-10-01';
