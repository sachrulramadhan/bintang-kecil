PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS roles (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL DEFAULT '',
  system_role INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS permissions (
  id TEXT PRIMARY KEY,
  label TEXT NOT NULL,
  group_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS role_permissions (
  role_id TEXT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
  permission_id TEXT NOT NULL REFERENCES permissions(id) ON DELETE CASCADE,
  PRIMARY KEY (role_id, permission_id)
);

CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE COLLATE NOCASE,
  username TEXT NOT NULL UNIQUE COLLATE NOCASE,
  password_hash TEXT,
  role_id TEXT NOT NULL REFERENCES roles(id),
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('active', 'pending', 'suspended')),
  profile_photo TEXT,
  internal_reference TEXT,
  notes TEXT NOT NULL DEFAULT '',
  last_login TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS invitations (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash TEXT NOT NULL UNIQUE,
  expires_at TEXT NOT NULL,
  accepted_at TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sessions (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token_hash TEXT NOT NULL UNIQUE,
  expires_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_sessions_expiry ON sessions(expires_at);
CREATE INDEX IF NOT EXISTS idx_sessions_user ON sessions(user_id);

CREATE TABLE IF NOT EXISTS login_attempts (
  id TEXT PRIMARY KEY,
  login_key TEXT NOT NULL,
  attempted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_login_attempts_window ON login_attempts(login_key, attempted_at);

CREATE TABLE IF NOT EXISTS categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  icon TEXT NOT NULL DEFAULT '📚',
  color TEXT NOT NULL DEFAULT '#4DA3FF',
  sort_order INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'archived')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS modules (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL REFERENCES categories(id),
  title TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  age_min INTEGER NOT NULL DEFAULT 2,
  age_max INTEGER NOT NULL DEFAULT 12,
  difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'developing', 'advanced')),
  duration_minutes INTEGER NOT NULL DEFAULT 10,
  objectives_json TEXT NOT NULL DEFAULT '[]',
  skills_json TEXT NOT NULL DEFAULT '[]',
  prerequisites_json TEXT NOT NULL DEFAULT '[]',
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_by TEXT NOT NULL REFERENCES users(id),
  updated_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_modules_category ON modules(category_id);
CREATE INDEX IF NOT EXISTS idx_modules_status ON modules(status);

CREATE TABLE IF NOT EXISTS lessons (
  id TEXT PRIMARY KEY,
  module_id TEXT NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content_json TEXT NOT NULL DEFAULT '[]',
  sort_order INTEGER NOT NULL DEFAULT 0,
  duration_minutes INTEGER NOT NULL DEFAULT 5,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_by TEXT NOT NULL REFERENCES users(id),
  updated_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_lessons_module ON lessons(module_id, sort_order);

CREATE TABLE IF NOT EXISTS materials (
  id TEXT PRIMARY KEY,
  lesson_id TEXT REFERENCES lessons(id) ON DELETE SET NULL,
  category_id TEXT NOT NULL REFERENCES categories(id),
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  summary TEXT NOT NULL DEFAULT '',
  content_json TEXT NOT NULL DEFAULT '[]',
  thumbnail_url TEXT NOT NULL DEFAULT '',
  cover_url TEXT NOT NULL DEFAULT '',
  age_min INTEGER NOT NULL DEFAULT 2,
  age_max INTEGER NOT NULL DEFAULT 12,
  difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'developing', 'advanced')),
  objectives_json TEXT NOT NULL DEFAULT '[]',
  skills_json TEXT NOT NULL DEFAULT '[]',
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'review', 'published', 'archived')),
  created_by TEXT NOT NULL REFERENCES users(id),
  updated_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_materials_category ON materials(category_id);
CREATE INDEX IF NOT EXISTS idx_materials_status ON materials(status);

CREATE TABLE IF NOT EXISTS media (
  id TEXT PRIMARY KEY,
  filename TEXT NOT NULL,
  media_type TEXT NOT NULL CHECK (media_type IN ('image', 'audio', 'video', 'document')),
  url TEXT NOT NULL,
  size_bytes INTEGER NOT NULL DEFAULT 0,
  alt_text TEXT NOT NULL DEFAULT '',
  uploaded_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS game_templates (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  game_type TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  configuration_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS games (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  category_id TEXT NOT NULL REFERENCES categories(id),
  template_id TEXT REFERENCES game_templates(id) ON DELETE SET NULL,
  game_type TEXT NOT NULL,
  age_min INTEGER NOT NULL DEFAULT 2,
  age_max INTEGER NOT NULL DEFAULT 12,
  difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'developing', 'advanced')),
  duration_minutes INTEGER NOT NULL DEFAULT 5,
  skills_json TEXT NOT NULL DEFAULT '[]',
  configuration_json TEXT NOT NULL DEFAULT '{}',
  reward_stars INTEGER NOT NULL DEFAULT 1,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_by TEXT NOT NULL REFERENCES users(id),
  updated_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_games_category ON games(category_id);
CREATE INDEX IF NOT EXISTS idx_games_status ON games(status);

CREATE TABLE IF NOT EXISTS questions (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL REFERENCES categories(id),
  game_id TEXT REFERENCES games(id) ON DELETE SET NULL,
  prompt TEXT NOT NULL,
  question_type TEXT NOT NULL CHECK (question_type IN ('multiple_choice', 'true_false', 'matching', 'fill_blank', 'ordering', 'image_selection', 'audio', 'letter_selection', 'word_builder', 'number_builder', 'tracing')),
  options_json TEXT NOT NULL DEFAULT '[]',
  answer_json TEXT NOT NULL DEFAULT '{}',
  hint TEXT NOT NULL DEFAULT '',
  explanation TEXT NOT NULL DEFAULT '',
  age_min INTEGER NOT NULL DEFAULT 2,
  age_max INTEGER NOT NULL DEFAULT 12,
  difficulty TEXT NOT NULL DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'developing', 'advanced')),
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_by TEXT NOT NULL REFERENCES users(id),
  updated_by TEXT NOT NULL REFERENCES users(id),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_questions_category ON questions(category_id);
CREATE INDEX IF NOT EXISTS idx_questions_game ON questions(game_id);

CREATE TABLE IF NOT EXISTS audit_logs (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id) ON DELETE SET NULL,
  action TEXT NOT NULL,
  target_type TEXT NOT NULL,
  target_id TEXT,
  before_json TEXT,
  after_json TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_logs(created_at DESC);

INSERT OR IGNORE INTO roles (id, name, description, system_role) VALUES
  ('admin_master', 'Admin Master', 'Akses penuh untuk mengelola CMS.', 1),
  ('content_creator', 'Content Creator', 'Membuat konten, game, dan media.', 1),
  ('reviewer', 'Reviewer', 'Meninjau dan memberi persetujuan konten.', 1),
  ('editor', 'Editor', 'Mengedit konten, kategori, dan modul.', 1),
  ('analyst', 'Analyst', 'Melihat dashboard dan analitik.', 1),
  ('parent', 'Orang Tua', 'Akun orang tua yang dikelola sistem pembelajaran.', 1);

INSERT OR IGNORE INTO permissions (id, label, group_name) VALUES
  ('dashboard.view', 'Melihat dashboard', 'Dashboard'),
  ('users.read', 'Melihat akun', 'Akun'),
  ('users.create', 'Membuat akun dan undangan', 'Akun'),
  ('users.update', 'Mengubah status akun', 'Akun'),
  ('users.delete', 'Menonaktifkan akun', 'Akun'),
  ('roles.manage', 'Mengatur role dan permission', 'Akun'),
  ('categories.read', 'Melihat kategori', 'Pembelajaran'),
  ('categories.create', 'Membuat kategori', 'Pembelajaran'),
  ('categories.update', 'Mengubah kategori', 'Pembelajaran'),
  ('categories.archive', 'Mengarsipkan kategori', 'Pembelajaran'),
  ('modules.read', 'Melihat modul', 'Pembelajaran'),
  ('modules.create', 'Membuat modul', 'Pembelajaran'),
  ('modules.update', 'Mengubah modul', 'Pembelajaran'),
  ('modules.delete', 'Menghapus modul draft', 'Pembelajaran'),
  ('lessons.read', 'Melihat lesson', 'Pembelajaran'),
  ('lessons.create', 'Membuat lesson', 'Pembelajaran'),
  ('lessons.update', 'Mengubah lesson', 'Pembelajaran'),
  ('lessons.delete', 'Menghapus lesson draft', 'Pembelajaran'),
  ('materials.read', 'Melihat materi', 'Pembelajaran'),
  ('materials.create', 'Membuat materi', 'Pembelajaran'),
  ('materials.update', 'Mengubah materi', 'Pembelajaran'),
  ('materials.delete', 'Menghapus materi draft', 'Pembelajaran'),
  ('materials.publish', 'Menerbitkan materi', 'Pembelajaran'),
  ('media.read', 'Melihat pustaka media', 'Media'),
  ('media.create', 'Menambahkan media', 'Media'),
  ('media.delete', 'Menghapus media', 'Media'),
  ('games.read', 'Melihat game dan bank soal', 'Game'),
  ('games.create', 'Membuat game dan soal', 'Game'),
  ('games.update', 'Mengubah game dan soal', 'Game'),
  ('games.delete', 'Menghapus game draft dan soal', 'Game'),
  ('games.publish', 'Menerbitkan game', 'Game'),
  ('analytics.view', 'Melihat analitik', 'Analitik');

INSERT OR IGNORE INTO role_permissions (role_id, permission_id)
SELECT 'admin_master', id FROM permissions;

INSERT OR IGNORE INTO role_permissions (role_id, permission_id) VALUES
  ('content_creator', 'dashboard.view'),
  ('content_creator', 'categories.read'),
  ('content_creator', 'modules.read'),
  ('content_creator', 'modules.create'),
  ('content_creator', 'modules.update'),
  ('content_creator', 'lessons.read'),
  ('content_creator', 'lessons.create'),
  ('content_creator', 'lessons.update'),
  ('content_creator', 'materials.read'),
  ('content_creator', 'materials.create'),
  ('content_creator', 'materials.update'),
  ('content_creator', 'media.read'),
  ('content_creator', 'media.create'),
  ('content_creator', 'games.read'),
  ('content_creator', 'games.create'),
  ('content_creator', 'games.update'),
  ('reviewer', 'dashboard.view'),
  ('reviewer', 'categories.read'),
  ('reviewer', 'modules.read'),
  ('reviewer', 'lessons.read'),
  ('reviewer', 'materials.read'),
  ('reviewer', 'materials.publish'),
  ('reviewer', 'games.read'),
  ('reviewer', 'games.publish'),
  ('editor', 'dashboard.view'),
  ('editor', 'categories.read'),
  ('editor', 'categories.update'),
  ('editor', 'modules.read'),
  ('editor', 'modules.create'),
  ('editor', 'modules.update'),
  ('editor', 'lessons.read'),
  ('editor', 'lessons.create'),
  ('editor', 'lessons.update'),
  ('editor', 'materials.read'),
  ('editor', 'materials.create'),
  ('editor', 'materials.update'),
  ('editor', 'games.read'),
  ('editor', 'games.update'),
  ('analyst', 'dashboard.view'),
  ('analyst', 'analytics.view');

INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status) VALUES
  ('stories', 'Cerita Anak', 'Dunia imajinasi, karakter, dan kecintaan membaca.', '📚', '#F59E0B', 1, 'active'),
  ('mathematics', 'Matematika', 'Angka dan logika ceria.', '🔢', '#6366F1', 2, 'active'),
  ('science', 'Sains', 'Penjelajahan alam dan semesta.', '🔬', '#10B981', 3, 'active'),
  ('social', 'IPS', 'Mengenal dunia dan budaya.', '🌎', '#06B6D4', 4, 'active'),
  ('arabic', 'Bahasa Arab', 'Belajar huruf dan kosakata.', '🕌', '#22C55E', 5, 'active'),
  ('mandarin', 'Bahasa Mandarin', 'Pinyin, Hanzi, dan budaya.', '🇨🇳', '#EF4444', 6, 'active'),
  ('indonesian', 'Bahasa Indonesia', 'Membaca dan merangkai kata.', '🇮🇩', '#F43F5E', 7, 'active'),
  ('english', 'Bahasa Inggris', 'Fun English for kids.', '🇬🇧', '#8B5CF6', 8, 'active'),
  ('coding', 'Coding', 'Logika, pola, dan proyek.', '💻', '#0EA5E9', 9, 'active');

INSERT OR IGNORE INTO game_templates (id, name, game_type, description, configuration_json) VALUES
  ('letter-match', 'Letter Match', 'connect-pairs', 'Pasangkan huruf dengan gambar atau bunyinya.', '{"pairs":[]}'),
  ('word-builder', 'Word Builder', 'word-builder', 'Susun huruf untuk membentuk kata.', '{"words":[]}'),
  ('word-completion', 'Word Completion', 'fill-word', 'Lengkapi kata dengan huruf yang hilang.', '{"words":[]}'),
  ('letter-tracing', 'Letter Tracing', 'tracing', 'Tebalkan huruf mengikuti panduan.', '{"letters":[]}'),
  ('letter-connection', 'Letter Connection', 'connect-pairs', 'Hubungkan huruf dengan pasangan yang benar.', '{"pairs":[]}'),
  ('letter-ordering', 'Letter Ordering', 'sort-letters', 'Urutkan huruf sesuai instruksi.', '{"items":[]}'),
  ('sound-matching', 'Sound Matching', 'guess-sound', 'Dengarkan bunyi dan pilih jawaban.', '{"items":[]}'),
  ('word-picture-match', 'Word Picture Match', 'word-image', 'Pasangkan kata dengan gambar.', '{"pairs":[]}'),
  ('sentence-builder', 'Sentence Builder', 'sentence-builder', 'Susun kata menjadi kalimat.', '{"sentences":[]}'),
  ('memory-match', 'Memory Match', 'memory-match', 'Temukan pasangan kartu.', '{"pairs":[]}'),
  ('coding-puzzle', 'Coding Puzzle', 'grid-coding', 'Susun instruksi untuk menyelesaikan teka-teki.', '{"boards":[]}');
