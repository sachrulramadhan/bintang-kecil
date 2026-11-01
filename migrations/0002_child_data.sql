PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS children (
  id TEXT PRIMARY KEY,
  parent_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  nickname TEXT NOT NULL,
  birth_date TEXT NOT NULL,
  age INTEGER NOT NULL DEFAULT 5,
  avatar TEXT NOT NULL DEFAULT '🐰',
  level_override TEXT,
  enabled_categories_json TEXT NOT NULL DEFAULT '[]',
  languages_json TEXT NOT NULL DEFAULT '[]',
  daily_limit_min INTEGER NOT NULL DEFAULT 30,
  difficulty_mode TEXT NOT NULL DEFAULT 'auto',
  manual_difficulty TEXT,
  audio_json TEXT NOT NULL DEFAULT '{}',
  stars INTEGER NOT NULL DEFAULT 0,
  coins INTEGER NOT NULL DEFAULT 0,
  donuts INTEGER NOT NULL DEFAULT 0,
  badges_json TEXT NOT NULL DEFAULT '[]',
  owned_items_json TEXT NOT NULL DEFAULT '[]',
  equipped_hat TEXT,
  equipped_glasses TEXT,
  world_state_json TEXT NOT NULL DEFAULT '{}',
  streak INTEGER NOT NULL DEFAULT 0,
  last_active_date TEXT NOT NULL,
  today_seconds_played INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_children_parent ON children(parent_id);

CREATE TABLE IF NOT EXISTS child_module_progress (
  child_id TEXT NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  module_id TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'open',
  stars INTEGER NOT NULL DEFAULT 0,
  last_step INTEGER NOT NULL DEFAULT 0,
  completed_at TEXT,
  PRIMARY KEY (child_id, module_id)
);

CREATE TABLE IF NOT EXISTS child_attempts (
  id TEXT PRIMARY KEY,
  child_id TEXT NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  module_id TEXT,
  game_id TEXT NOT NULL,
  item_id TEXT,
  skill_id TEXT NOT NULL,
  category TEXT NOT NULL,
  correct INTEGER NOT NULL DEFAULT 0,
  used_hint INTEGER NOT NULL DEFAULT 0,
  duration_ms INTEGER NOT NULL DEFAULT 0,
  difficulty INTEGER NOT NULL DEFAULT 1,
  attempted_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_child_attempts_child ON child_attempts(child_id, attempted_at DESC);

CREATE TABLE IF NOT EXISTS child_mastery (
  child_id TEXT NOT NULL REFERENCES children(id) ON DELETE CASCADE,
  skill_id TEXT NOT NULL,
  category TEXT NOT NULL,
  attempts INTEGER NOT NULL DEFAULT 0,
  correct INTEGER NOT NULL DEFAULT 0,
  hints_used INTEGER NOT NULL DEFAULT 0,
  last_practiced_at TEXT NOT NULL,
  mastery_score INTEGER NOT NULL DEFAULT 0,
  history_json TEXT NOT NULL DEFAULT '[]',
  PRIMARY KEY (child_id, skill_id)
);
