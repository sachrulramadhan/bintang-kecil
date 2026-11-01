import type {
  AuthenticatedUser,
  D1Value,
  Env,
} from "./types";
import {
  APP_SESSION_TTL_SECONDS,
  appSessionCookie,
  assertSameOrigin,
  authenticate,
  authenticateApp,
  createId,
  emailField,
  enumField,
  expiredAppSessionCookie,
  expiredSessionCookie,
  hashPassword,
  HttpError,
  integerField,
  jsonArrayField,
  jsonObjectField,
  jsonResponse,
  normalizeLogin,
  optionalString,
  randomToken,
  readJson,
  requiredString,
  requirePermission,
  SESSION_TTL_SECONDS,
  sessionCookie,
  sha256,
  verifyPassword,
  writeAudit,
} from "./security";

interface ResourceDefinition {
  table: string;
  permission: string;
  searchColumns: string[];
  select: string;
  listSelect?: string;
  fields: Record<
    string,
    (body: Record<string, unknown>, user: AuthenticatedUser, creating: boolean) => D1Value
  >;
  required: string[];
  canDelete: boolean;
}

const DIFFICULTIES = ["beginner", "developing", "advanced"] as const;
const CONTENT_STATUSES = ["draft", "published", "archived"] as const;

const RESOURCES: Record<string, ResourceDefinition> = {
  categories: {
    table: "categories",
    permission: "categories",
    searchColumns: ["name", "description"],
    select:
      "id, name, description, icon, color, sort_order AS sortOrder, status, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      name: (body) => requiredString(body, "name", 120),
      description: (body) => optionalString(body, "description", 2000),
      icon: (body) => optionalString(body, "icon", 32) || "📚",
      color: (body) => {
        const color = optionalString(body, "color", 7) || "#4DA3FF";
        if (!/^#[\da-f]{6}$/i.test(color)) throw new HttpError(400, "Warna kategori harus berupa kode HEX.");
        return color;
      },
      sortOrder: (body) => integerField(body, "sortOrder", 0, 0, 10000),
      status: (body) => enumField(body, "status", ["active", "archived"] as const, "active"),
    },
    required: ["name"],
    canDelete: false,
  },
  modules: {
    table: "modules",
    permission: "modules",
    searchColumns: ["title", "description"],
    select:
      "id, category_id AS categoryId, title, description, age_min AS ageMin, age_max AS ageMax, difficulty, duration_minutes AS durationMinutes, objectives_json AS objectivesJson, skills_json AS skillsJson, prerequisites_json AS prerequisitesJson, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      categoryId: (body) => requiredString(body, "categoryId", 100),
      title: (body) => requiredString(body, "title", 180),
      description: (body) => optionalString(body, "description"),
      ageMin: (body) => integerField(body, "ageMin", 2, 2, 12),
      ageMax: (body) => integerField(body, "ageMax", 12, 2, 12),
      difficulty: (body) => enumField(body, "difficulty", DIFFICULTIES, "beginner"),
      durationMinutes: (body) => integerField(body, "durationMinutes", 10, 1, 480),
      objectivesJson: (body) => jsonArrayField(body, "objectives", []),
      skillsJson: (body) => jsonArrayField(body, "skills", []),
      prerequisitesJson: (body) => jsonArrayField(body, "prerequisites", []),
      status: (body) => enumField(body, "status", CONTENT_STATUSES, "draft"),
    },
    required: ["categoryId", "title"],
    canDelete: true,
  },
  lessons: {
    table: "lessons",
    permission: "lessons",
    searchColumns: ["title"],
    select:
      "id, module_id AS moduleId, title, content_json AS contentJson, sort_order AS sortOrder, duration_minutes AS durationMinutes, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    listSelect:
      "id, module_id AS moduleId, title, sort_order AS sortOrder, duration_minutes AS durationMinutes, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      moduleId: (body) => requiredString(body, "moduleId", 100),
      title: (body) => requiredString(body, "title", 180),
      contentJson: (body) => jsonArrayField(body, "content", []),
      sortOrder: (body) => integerField(body, "sortOrder", 0, 0, 10000),
      durationMinutes: (body) => integerField(body, "durationMinutes", 5, 1, 480),
      status: (body) => enumField(body, "status", CONTENT_STATUSES, "draft"),
    },
    required: ["moduleId", "title"],
    canDelete: true,
  },
  materials: {
    table: "materials",
    permission: "materials",
    searchColumns: ["title", "summary", "slug"],
    select:
      "id, lesson_id AS lessonId, category_id AS categoryId, title, slug, summary, content_json AS contentJson, thumbnail_url AS thumbnailUrl, cover_url AS coverUrl, age_min AS ageMin, age_max AS ageMax, difficulty, objectives_json AS objectivesJson, skills_json AS skillsJson, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      lessonId: (body) => optionalString(body, "lessonId", 100) || null,
      categoryId: (body) => requiredString(body, "categoryId", 100),
      title: (body) => requiredString(body, "title", 180),
      slug: (body) => {
        const slug = requiredString(body, "slug", 180).toLowerCase();
        if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(slug)) {
          throw new HttpError(400, "Slug hanya boleh berisi huruf kecil, angka, dan tanda hubung.");
        }
        return slug;
      },
      summary: (body) => optionalString(body, "summary", 1000),
      contentJson: (body) => jsonArrayField(body, "content", []),
      thumbnailUrl: (body) => validateMediaUrl(optionalString(body, "thumbnailUrl", 2000)),
      coverUrl: (body) => validateMediaUrl(optionalString(body, "coverUrl", 2000)),
      ageMin: (body) => integerField(body, "ageMin", 2, 2, 12),
      ageMax: (body) => integerField(body, "ageMax", 12, 2, 12),
      difficulty: (body) => enumField(body, "difficulty", DIFFICULTIES, "beginner"),
      objectivesJson: (body) => jsonArrayField(body, "objectives", []),
      skillsJson: (body) => jsonArrayField(body, "skills", []),
      status: (body) => enumField(body, "status", ["draft", "review", "published", "archived"] as const, "draft"),
    },
    required: ["categoryId", "title", "slug"],
    canDelete: true,
  },
  media: {
    table: "media",
    permission: "media",
    searchColumns: ["filename", "alt_text", "url"],
    select:
      "id, filename, media_type AS mediaType, url, size_bytes AS sizeBytes, alt_text AS altText, uploaded_by AS uploadedBy, created_at AS createdAt",
    fields: {
      filename: (body) => requiredString(body, "filename", 240),
      mediaType: (body) => enumField(body, "mediaType", ["image", "audio", "video", "document"] as const, "image"),
      url: (body) => validateExternalMediaUrl(requiredString(body, "url", 2000)),
      sizeBytes: (body) => integerField(body, "sizeBytes", 0, 0, 100_000_000),
      altText: (body) => optionalString(body, "altText", 500),
    },
    required: ["filename", "mediaType", "url"],
    canDelete: true,
  },
  games: {
    table: "games",
    permission: "games",
    searchColumns: ["title", "description", "game_type"],
    select:
      "id, title, description, category_id AS categoryId, template_id AS templateId, game_type AS gameType, age_min AS ageMin, age_max AS ageMax, difficulty, duration_minutes AS durationMinutes, skills_json AS skillsJson, configuration_json AS configurationJson, reward_stars AS rewardStars, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      title: (body) => requiredString(body, "title", 180),
      description: (body) => optionalString(body, "description", 2000),
      categoryId: (body) => requiredString(body, "categoryId", 100),
      templateId: (body) => optionalString(body, "templateId", 100) || null,
      gameType: (body) => requiredString(body, "gameType", 80),
      ageMin: (body) => integerField(body, "ageMin", 2, 2, 12),
      ageMax: (body) => integerField(body, "ageMax", 12, 2, 12),
      difficulty: (body) => enumField(body, "difficulty", DIFFICULTIES, "beginner"),
      durationMinutes: (body) => integerField(body, "durationMinutes", 5, 1, 120),
      skillsJson: (body) => jsonArrayField(body, "skills", []),
      configurationJson: (body) => jsonObjectField(body, "configuration", {}),
      rewardStars: (body) => integerField(body, "rewardStars", 1, 0, 20),
      status: (body) => enumField(body, "status", CONTENT_STATUSES, "draft"),
    },
    required: ["title", "categoryId", "gameType"],
    canDelete: true,
  },
  questions: {
    table: "questions",
    permission: "games",
    searchColumns: ["prompt", "hint", "explanation"],
    select:
      "id, category_id AS categoryId, game_id AS gameId, prompt, question_type AS questionType, options_json AS optionsJson, answer_json AS answerJson, hint, explanation, age_min AS ageMin, age_max AS ageMax, difficulty, status, created_by AS createdBy, updated_by AS updatedBy, created_at AS createdAt, updated_at AS updatedAt",
    fields: {
      categoryId: (body) => requiredString(body, "categoryId", 100),
      gameId: (body) => optionalString(body, "gameId", 100) || null,
      prompt: (body) => requiredString(body, "prompt", 2000),
      questionType: (body) =>
        enumField(
          body,
          "questionType",
          [
            "multiple_choice",
            "true_false",
            "matching",
            "fill_blank",
            "ordering",
            "image_selection",
            "audio",
            "letter_selection",
            "word_builder",
            "number_builder",
            "tracing",
          ] as const,
          "multiple_choice",
        ),
      optionsJson: (body) => jsonArrayField(body, "options", []),
      answerJson: (body) => jsonObjectField(body, "answer", {}),
      hint: (body) => optionalString(body, "hint", 1000),
      explanation: (body) => optionalString(body, "explanation", 2000),
      ageMin: (body) => integerField(body, "ageMin", 2, 2, 12),
      ageMax: (body) => integerField(body, "ageMax", 12, 2, 12),
      difficulty: (body) => enumField(body, "difficulty", DIFFICULTIES, "beginner"),
      status: (body) => enumField(body, "status", CONTENT_STATUSES, "draft"),
    },
    required: ["categoryId", "prompt", "questionType"],
    canDelete: true,
  },
};

function validateMediaUrl(value: string): string {
  return value ? validateExternalMediaUrl(value) : "";
}

function validateExternalMediaUrl(value: string): string {
  let parsed: URL;
  try {
    parsed = new URL(value);
  } catch {
    throw new HttpError(400, "Masukkan URL media yang valid.");
  }
  if (parsed.protocol !== "https:" && parsed.protocol !== "http:") {
    throw new HttpError(400, "URL media harus menggunakan HTTPS atau HTTP.");
  }
  return parsed.toString();
}

async function recordLoginFailure(env: Env, keys: string[]): Promise<void> {
  const statements = keys.map((key) =>
    env.CMS_DB.prepare("INSERT INTO login_attempts (id, login_key) VALUES (?, ?)")
      .bind(createId("attempt"), key),
  );
  await Promise.all(statements.map((statement) => statement.run()));
}

async function clearLoginFailures(env: Env, keys: string[]): Promise<void> {
  const placeholders = keys.map(() => "?").join(", ");
  await env.CMS_DB.prepare(`DELETE FROM login_attempts WHERE login_key IN (${placeholders})`)
    .bind(...keys)
    .run();
}

async function handleLogin(request: Request, env: Env): Promise<Response> {
  assertSameOrigin(request);
  const body = await readJson(request);
  const login = normalizeLogin(requiredString(body, "email", 254));
  const password = requiredString(body, "password", 256);
  const address = request.headers.get("CF-Connecting-IP") || "unknown";
  const keys = [`email:${login}`, `ip:${address}`];
  const placeholders = keys.map(() => "?").join(", ");
  const attempts = await env.CMS_DB.prepare(
    `SELECT COUNT(*) AS count FROM login_attempts
      WHERE login_key IN (${placeholders}) AND attempted_at > datetime('now', '-15 minutes')`,
  )
    .bind(...keys)
    .first<{ count: number }>();
  if ((attempts?.count || 0) >= 10) {
    throw new HttpError(429, "Terlalu banyak percobaan login. Coba lagi setelah 15 menit.");
  }

  const row = await env.CMS_DB.prepare(
    `SELECT id, password_hash AS passwordHash, status
       FROM users
      WHERE (email = ? COLLATE NOCASE OR username = ? COLLATE NOCASE)
        AND role_id <> 'parent'
      LIMIT 1`,
  )
    .bind(login, login)
    .first<{ id: string; passwordHash: string | null; status: string }>();
  const valid =
    Boolean(row?.passwordHash) &&
    row?.status === "active" &&
    (await verifyPassword(password, row?.passwordHash || ""));
  if (!row || !valid) {
    await recordLoginFailure(env, keys);
    throw new HttpError(401, "Email/username atau kata sandi tidak cocok.");
  }

  await clearLoginFailures(env, keys);
  const token = randomToken();
  const expiresAt = new Date(Date.now() + SESSION_TTL_SECONDS * 1000).toISOString();
  await env.CMS_DB.prepare(
    "INSERT INTO sessions (id, user_id, token_hash, expires_at) VALUES (?, ?, ?, ?)",
  )
    .bind(createId("session"), row.id, await sha256(token), expiresAt)
    .run();
  await env.CMS_DB.prepare("UPDATE users SET last_login = CURRENT_TIMESTAMP WHERE id = ?")
    .bind(row.id)
    .run();

  return jsonResponse(
    { ok: true },
    200,
    { "Set-Cookie": sessionCookie(token, SESSION_TTL_SECONDS) },
  );
}

function appUserPayload(user: {
  id: string;
  name: string;
  email: string;
  username: string;
}) {
  return {
    user: {
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
    },
  };
}

async function handleAppLogin(request: Request, env: Env): Promise<Response> {
  assertSameOrigin(request);
  const body = await readJson(request);
  const login = normalizeLogin(requiredString(body, "username", 254));
  const password = requiredString(body, "password", 256);
  const address = request.headers.get("CF-Connecting-IP") || "unknown";
  const keys = [`app:${login}`, `app-ip:${address}`];
  const placeholders = keys.map(() => "?").join(", ");
  const attempts = await env.CMS_DB.prepare(
    `SELECT COUNT(*) AS count FROM login_attempts
      WHERE login_key IN (${placeholders}) AND attempted_at > datetime('now', '-15 minutes')`,
  )
    .bind(...keys)
    .first<{ count: number }>();
  if ((attempts?.count || 0) >= 10) {
    throw new HttpError(429, "Terlalu banyak percobaan login. Coba lagi setelah 15 menit.");
  }

  const row = await env.CMS_DB.prepare(
    `SELECT id, name, email, username, password_hash AS passwordHash, status
       FROM users
      WHERE username = ? COLLATE NOCASE AND role_id = 'parent'
      LIMIT 1`,
  )
    .bind(login)
    .first<{
      id: string;
      name: string;
      email: string;
      username: string;
      passwordHash: string | null;
      status: string;
    }>();
  const valid =
    Boolean(row?.passwordHash) &&
    row?.status === "active" &&
    (await verifyPassword(password, row?.passwordHash || ""));
  if (!row || !valid) {
    await recordLoginFailure(env, keys);
    throw new HttpError(401, "Username atau kata sandi tidak cocok.");
  }

  await clearLoginFailures(env, keys);
  const token = randomToken();
  const expiresAt = new Date(Date.now() + APP_SESSION_TTL_SECONDS * 1000).toISOString();
  await env.CMS_DB.prepare(
    "INSERT INTO sessions (id, user_id, token_hash, expires_at) VALUES (?, ?, ?, ?)",
  )
    .bind(createId("session"), row.id, await sha256(token), expiresAt)
    .run();
  await env.CMS_DB.prepare("UPDATE users SET last_login = CURRENT_TIMESTAMP WHERE id = ?")
    .bind(row.id)
    .run();

  return jsonResponse(appUserPayload(row), 200, {
    "Set-Cookie": appSessionCookie(token, APP_SESSION_TTL_SECONDS),
  });
}

async function handleAppMe(request: Request, env: Env): Promise<Response> {
  const user = await authenticateApp(request, env);
  if (!user) throw new HttpError(401, "Sesi login sudah berakhir. Silakan masuk kembali.");
  return jsonResponse(appUserPayload(user));
}

async function handleAppLogout(request: Request, env: Env): Promise<Response> {
  assertSameOrigin(request);
  const cookie = request.headers.get("Cookie") || "";
  const token = cookie
    .split(";")
    .map((part) => part.trim())
    .find((part) => part.startsWith("bk_app_session="))
    ?.slice("bk_app_session=".length);
  if (token) {
    await env.CMS_DB.prepare("DELETE FROM sessions WHERE token_hash = ?")
      .bind(await sha256(decodeURIComponent(token)))
      .run();
  }
  return jsonResponse({ ok: true }, 200, { "Set-Cookie": expiredAppSessionCookie() });
}

const APP_CATEGORY_IDS = [
  "stories",
  "mathematics",
  "science",
  "social",
  "arabic",
  "mandarin",
  "indonesian",
  "english",
  "coding",
] as const;
const MODULE_STATUSES = ["locked", "open", "in-progress", "done"] as const;

async function requireAppUser(
  request: Request,
  env: Env,
): Promise<Omit<AuthenticatedUser, "permissions">> {
  const user = await authenticateApp(request, env);
  if (!user) throw new HttpError(401, "Silakan login untuk melanjutkan.");
  return user;
}

function parseJsonArray(value: unknown): unknown[] {
  if (Array.isArray(value)) return value;
  if (typeof value !== "string") return [];
  try {
    const parsed: unknown = JSON.parse(value);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

function parseJsonObject(value: unknown): Record<string, unknown> {
  if (value && typeof value === "object" && !Array.isArray(value)) {
    return value as Record<string, unknown>;
  }
  if (typeof value !== "string") return {};
  try {
    const parsed: unknown = JSON.parse(value);
    return parsed && typeof parsed === "object" && !Array.isArray(parsed)
      ? (parsed as Record<string, unknown>)
      : {};
  } catch {
    return {};
  }
}

function boundedInteger(value: unknown, fallback: number, minimum: number, maximum: number): number {
  const number = Number(value);
  if (!Number.isFinite(number)) return fallback;
  return Math.min(maximum, Math.max(minimum, Math.round(number)));
}

function stringArrayField(
  body: Record<string, unknown>,
  field: string,
  maxItems = 200,
  maxLength = 100,
): string[] {
  const value = body[field];
  if (value === undefined || value === null) return [];
  if (
    !Array.isArray(value) ||
    value.length > maxItems ||
    value.some((item) => typeof item !== "string" || item.length > maxLength)
  ) {
    throw new HttpError(400, `${field} tidak valid.`);
  }
  return value as string[];
}

function shortDateField(body: Record<string, unknown>, field: string, fallback = ""): string {
  const value = typeof body[field] === "string" ? String(body[field]).slice(0, 10) : fallback;
  if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) {
    throw new HttpError(400, `${field} harus berupa tanggal yang valid.`);
  }
  return value;
}

function timestampField(value: unknown): string {
  if (typeof value !== "string" || !value) return new Date().toISOString();
  return value.slice(0, 40);
}

async function assertOwnedChild(env: Env, parentId: string, childId: string): Promise<void> {
  const row = await env.CMS_DB.prepare(
    "SELECT id FROM children WHERE id = ? AND parent_id = ?",
  )
    .bind(childId, parentId)
    .first<{ id: string }>();
  if (!row) throw new HttpError(404, "Profil anak tidak ditemukan.");
}

async function handleAppData(request: Request, env: Env): Promise<Response> {
  const user = await requireAppUser(request, env);
  const children = await env.CMS_DB.prepare(
    `SELECT id, parent_id AS parentId, nickname, birth_date AS birthDate, age, avatar,
            level_override AS levelOverride, enabled_categories_json AS enabledCategoriesJson,
            languages_json AS languagesJson, daily_limit_min AS dailyLimitMin,
            difficulty_mode AS difficultyMode, manual_difficulty AS manualDifficulty,
            audio_json AS audioJson, stars, coins, donuts, badges_json AS badgesJson,
            owned_items_json AS ownedItemsJson, equipped_hat AS equippedHat,
            equipped_glasses AS equippedGlasses, world_state_json AS worldStateJson,
            streak, last_active_date AS lastActiveDate,
            today_seconds_played AS todaySecondsPlayed
       FROM children WHERE parent_id = ? ORDER BY created_at`,
  )
    .bind(user.id)
    .all<Record<string, unknown>>();

  const ids = children.results.map((child) => String(child.id));
  const progressByChild: Record<string, Record<string, unknown>> = {};
  const attemptsByChild: Record<string, Record<string, unknown>[]> = {};
  const masteryByChild: Record<string, Record<string, unknown>> = {};

  if (ids.length > 0) {
    const placeholders = ids.map(() => "?").join(", ");
    const [progressRows, attemptRows, masteryRows] = await Promise.all([
      env.CMS_DB.prepare(
        `SELECT child_id AS childId, module_id AS moduleId, status, stars,
                last_step AS lastStep, completed_at AS completedAt
           FROM child_module_progress WHERE child_id IN (${placeholders})`,
      )
        .bind(...ids)
        .all<Record<string, unknown>>(),
      env.CMS_DB.prepare(
        `SELECT id, child_id AS childId, module_id AS moduleId, game_id AS gameId,
                item_id AS itemId, skill_id AS skillId, category, correct, used_hint AS usedHint,
                duration_ms AS durationMs, difficulty, attempted_at AS attemptedAt
           FROM child_attempts WHERE child_id IN (${placeholders})
          ORDER BY attempted_at DESC LIMIT 3000`,
      )
        .bind(...ids)
        .all<Record<string, unknown>>(),
      env.CMS_DB.prepare(
        `SELECT child_id AS childId, skill_id AS skillId, category, attempts, correct,
                hints_used AS hintsUsed, last_practiced_at AS lastPracticedAt,
                mastery_score AS masteryScore, history_json AS historyJson
           FROM child_mastery WHERE child_id IN (${placeholders})`,
      )
        .bind(...ids)
        .all<Record<string, unknown>>(),
    ]);

    for (const row of progressRows.results) {
      const childId = String(row.childId);
      (progressByChild[childId] ||= {})[String(row.moduleId)] = {
        childId,
        moduleId: row.moduleId,
        status: row.status,
        stars: row.stars,
        lastStep: row.lastStep,
        ...(row.completedAt ? { completedAt: row.completedAt } : {}),
      };
    }
    for (const row of attemptRows.results) {
      const childId = String(row.childId);
      (attemptsByChild[childId] ||= []).push({
        id: row.id,
        childId,
        ...(row.moduleId ? { moduleId: row.moduleId } : {}),
        gameId: row.gameId,
        ...(row.itemId ? { itemId: row.itemId } : {}),
        skillId: row.skillId,
        category: row.category,
        correct: Number(row.correct) === 1,
        usedHint: Number(row.usedHint) === 1,
        durationMs: row.durationMs,
        difficulty: row.difficulty,
        at: row.attemptedAt,
      });
    }
    for (const row of masteryRows.results) {
      const childId = String(row.childId);
      (masteryByChild[childId] ||= {})[String(row.skillId)] = {
        childId,
        skillId: row.skillId,
        category: row.category,
        attempts: row.attempts,
        correct: row.correct,
        hintsUsed: row.hintsUsed,
        lastPracticedAt: row.lastPracticedAt,
        masteryScore: row.masteryScore,
        history: parseJsonArray(row.historyJson),
      };
    }
  }

  return jsonResponse({
    children: children.results.map((row) => {
      const id = String(row.id);
      return {
        id,
        parentId: row.parentId,
        nickname: row.nickname,
        birthDate: row.birthDate,
        age: row.age,
        avatar: row.avatar,
        ...(row.levelOverride ? { levelOverride: row.levelOverride } : {}),
        enabledCategories: parseJsonArray(row.enabledCategoriesJson),
        languages: parseJsonArray(row.languagesJson),
        dailyLimitMin: row.dailyLimitMin,
        difficultyMode: row.difficultyMode,
        ...(row.manualDifficulty ? { manualDifficulty: row.manualDifficulty } : {}),
        audio: parseJsonObject(row.audioJson),
        stars: row.stars,
        coins: row.coins,
        donuts: row.donuts,
        badges: parseJsonArray(row.badgesJson),
        ownedItems: parseJsonArray(row.ownedItemsJson),
        ...(row.equippedHat ? { equippedHat: row.equippedHat } : {}),
        ...(row.equippedGlasses ? { equippedGlasses: row.equippedGlasses } : {}),
        worldState: parseJsonObject(row.worldStateJson),
        streak: row.streak,
        lastActiveDate: row.lastActiveDate,
        todaySecondsPlayed: row.todaySecondsPlayed,
        progress: progressByChild[id] || {},
        attempts: attemptsByChild[id] || [],
        mastery: masteryByChild[id] || {},
      };
    }),
  });
}

async function handleAppChildProfile(
  request: Request,
  env: Env,
  user: Omit<AuthenticatedUser, "permissions">,
  childId: string,
): Promise<Response> {
  const body = await readJson(request);
  const nickname = requiredString(body, "nickname", 60);
  const birthDate = shortDateField(body, "birthDate");
  const age = integerField(body, "age", 5, 0, 18);
  const avatar = optionalString(body, "avatar", 16) || "🐰";
  const levelOverride = optionalString(body, "levelOverride", 8) || null;
  const categories = stringArrayField(body, "enabledCategories", 20, 40).filter((category) =>
    (APP_CATEGORY_IDS as readonly string[]).includes(category),
  );
  const languages = stringArrayField(body, "languages", 20, 20);
  const dailyLimitMin = integerField(body, "dailyLimitMin", 30, 0, 1440);
  const difficultyMode = enumField(body, "difficultyMode", ["auto", "manual"] as const, "auto");
  const manualDifficulty = optionalString(body, "manualDifficulty", 20) || null;
  if (
    manualDifficulty &&
    !(["beginner", "developing", "advanced"] as readonly string[]).includes(manualDifficulty)
  ) {
    throw new HttpError(400, "manualDifficulty tidak valid.");
  }

  const audio = parseJsonObject(body.audio);
  const audioJson = JSON.stringify({
    volume: boundedInteger(audio.volume, 80, 0, 100),
    narration: audio.narration !== false,
    music: audio.music !== false,
    sfx: audio.sfx !== false,
  });

  const worldState = parseJsonObject(body.worldState);
  const unlockedAreas = Array.isArray(worldState.unlockedAreas)
    ? worldState.unlockedAreas
        .filter((area): area is string => typeof area === "string")
        .slice(0, 50)
        .map((area) => area.slice(0, 40))
    : [];
  const decorations: Record<string, string[]> = {};
  for (const [key, value] of Object.entries(parseJsonObject(worldState.decorations))) {
    if (Object.keys(decorations).length >= 50) break;
    if (!Array.isArray(value)) continue;
    decorations[key.slice(0, 40)] = value
      .filter((item): item is string => typeof item === "string")
      .slice(0, 50)
      .map((item) => item.slice(0, 80));
  }
  const worldStateJson = JSON.stringify({ unlockedAreas, decorations });

  const stars = integerField(body, "stars", 0, 0, 10_000_000);
  const coins = integerField(body, "coins", 0, 0, 10_000_000);
  const donuts = integerField(body, "donuts", 0, 0, 1_000_000);
  const badges = stringArrayField(body, "badges", 200, 80);
  const ownedItems = stringArrayField(body, "ownedItems", 500, 100);
  const equippedHat = optionalString(body, "equippedHat", 100) || null;
  const equippedGlasses = optionalString(body, "equippedGlasses", 100) || null;
  const streak = integerField(body, "streak", 0, 0, 100_000);
  const lastActiveDate =
    typeof body.lastActiveDate === "string" && body.lastActiveDate
      ? shortDateField(body, "lastActiveDate")
      : new Date().toISOString().slice(0, 10);
  const todaySecondsPlayed = integerField(body, "todaySecondsPlayed", 0, 0, 172_800);

  const values: D1Value[] = [
    nickname,
    birthDate,
    age,
    avatar,
    levelOverride,
    JSON.stringify(categories),
    JSON.stringify(languages),
    dailyLimitMin,
    difficultyMode,
    manualDifficulty,
    audioJson,
    stars,
    coins,
    donuts,
    JSON.stringify(badges),
    JSON.stringify(ownedItems),
    equippedHat,
    equippedGlasses,
    worldStateJson,
    streak,
    lastActiveDate,
    todaySecondsPlayed,
  ];

  const existing = await env.CMS_DB.prepare("SELECT parent_id AS parentId FROM children WHERE id = ?")
    .bind(childId)
    .first<{ parentId: string }>();
  if (existing) {
    if (existing.parentId !== user.id) {
      throw new HttpError(403, "Profil anak bukan milik akun ini.");
    }
    await env.CMS_DB.prepare(
      `UPDATE children SET nickname = ?, birth_date = ?, age = ?, avatar = ?, level_override = ?,
              enabled_categories_json = ?, languages_json = ?, daily_limit_min = ?,
              difficulty_mode = ?, manual_difficulty = ?, audio_json = ?, stars = ?, coins = ?,
              donuts = ?, badges_json = ?, owned_items_json = ?, equipped_hat = ?,
              equipped_glasses = ?, world_state_json = ?, streak = ?, last_active_date = ?,
              today_seconds_played = ?, updated_at = CURRENT_TIMESTAMP
        WHERE id = ? AND parent_id = ?`,
    )
      .bind(...values, childId, user.id)
      .run();
    return jsonResponse({ ok: true });
  }

  await env.CMS_DB.prepare(
    `INSERT INTO children
       (id, parent_id, nickname, birth_date, age, avatar, level_override,
        enabled_categories_json, languages_json, daily_limit_min, difficulty_mode,
        manual_difficulty, audio_json, stars, coins, donuts, badges_json,
        owned_items_json, equipped_hat, equipped_glasses, world_state_json,
        streak, last_active_date, today_seconds_played)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
  )
    .bind(childId, user.id, ...values)
    .run();
  return jsonResponse({ ok: true }, 201);
}

async function handleAppChildProgress(
  request: Request,
  env: Env,
  user: Omit<AuthenticatedUser, "permissions">,
  childId: string,
): Promise<Response> {
  const body = await readJson(request);
  const progress = parseJsonObject(body.progress);
  await assertOwnedChild(env, user.id, childId);
  await env.CMS_DB.prepare("DELETE FROM child_module_progress WHERE child_id = ?")
    .bind(childId)
    .run();
  for (const [moduleId, raw] of Object.entries(progress).slice(0, 500)) {
    if (!/^[A-Za-z0-9._-]{1,120}$/.test(moduleId)) continue;
    const item = parseJsonObject(raw);
    const status = (MODULE_STATUSES as readonly string[]).includes(String(item.status))
      ? String(item.status)
      : "open";
    await env.CMS_DB.prepare(
      `INSERT OR REPLACE INTO child_module_progress
         (child_id, module_id, status, stars, last_step, completed_at)
       VALUES (?, ?, ?, ?, ?, ?)`,
    )
      .bind(
        childId,
        moduleId,
        status,
        boundedInteger(item.stars, 0, 0, 3),
        boundedInteger(item.lastStep, 0, 0, 1000),
        typeof item.completedAt === "string" && item.completedAt
          ? item.completedAt.slice(0, 40)
          : null,
      )
      .run();
  }
  return jsonResponse({ ok: true });
}

async function handleAppChildMastery(
  request: Request,
  env: Env,
  user: Omit<AuthenticatedUser, "permissions">,
  childId: string,
): Promise<Response> {
  const body = await readJson(request);
  const mastery = parseJsonObject(body.mastery);
  await assertOwnedChild(env, user.id, childId);
  await env.CMS_DB.prepare("DELETE FROM child_mastery WHERE child_id = ?").bind(childId).run();
  for (const [skillId, raw] of Object.entries(mastery).slice(0, 300)) {
    if (!/^[A-Za-z0-9._-]{1,120}$/.test(skillId)) continue;
    const item = parseJsonObject(raw);
    const history = (Array.isArray(item.history) ? item.history : [])
      .slice(0, 50)
      .map((entry) => {
        const record = parseJsonObject(entry);
        return {
          t: timestampField(record.t),
          correct: record.correct === true,
          difficulty: boundedInteger(record.difficulty, 1, 1, 10),
          usedHint: record.usedHint === true,
        };
      });
    await env.CMS_DB.prepare(
      `INSERT OR REPLACE INTO child_mastery
         (child_id, skill_id, category, attempts, correct, hints_used,
          last_practiced_at, mastery_score, history_json)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    )
      .bind(
        childId,
        skillId,
        typeof item.category === "string" ? item.category.slice(0, 40) : "stories",
        boundedInteger(item.attempts, 0, 0, 1_000_000),
        boundedInteger(item.correct, 0, 0, 1_000_000),
        boundedInteger(item.hintsUsed, 0, 0, 1_000_000),
        timestampField(item.lastPracticedAt),
        boundedInteger(item.masteryScore, 0, 0, 100),
        JSON.stringify(history),
      )
      .run();
  }
  return jsonResponse({ ok: true });
}

async function handleAppChildAttempts(
  request: Request,
  env: Env,
  user: Omit<AuthenticatedUser, "permissions">,
  childId: string,
): Promise<Response> {
  const body = await readJson(request);
  const attempts = Array.isArray(body.attempts) ? body.attempts.slice(0, 500) : [];
  await assertOwnedChild(env, user.id, childId);
  for (const raw of attempts) {
    const item = parseJsonObject(raw);
    if (typeof item.id !== "string" || !/^[A-Za-z0-9._-]{1,100}$/.test(item.id)) continue;
    const gameId = typeof item.gameId === "string" ? item.gameId.slice(0, 100) : "";
    const skillId = typeof item.skillId === "string" ? item.skillId.slice(0, 100) : "";
    const category = typeof item.category === "string" ? item.category.slice(0, 40) : "";
    if (!gameId || !skillId || !category) continue;
    await env.CMS_DB.prepare(
      `INSERT OR IGNORE INTO child_attempts
         (id, child_id, module_id, game_id, item_id, skill_id, category, correct,
          used_hint, duration_ms, difficulty, attempted_at)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    )
      .bind(
        item.id,
        childId,
        typeof item.moduleId === "string" && item.moduleId ? item.moduleId.slice(0, 120) : null,
        gameId,
        typeof item.itemId === "string" && item.itemId ? item.itemId.slice(0, 120) : null,
        skillId,
        category,
        item.correct === true ? 1 : 0,
        item.usedHint === true ? 1 : 0,
        boundedInteger(item.durationMs, 0, 0, 3_600_000),
        boundedInteger(item.difficulty, 1, 1, 10),
        timestampField(item.at),
      )
      .run();
  }
  return jsonResponse({ ok: true });
}

async function handleAppChild(request: Request, env: Env, childId: string): Promise<Response> {
  if (!/^[A-Za-z0-9_-]{1,80}$/.test(childId)) {
    throw new HttpError(400, "ID profil anak tidak valid.");
  }
  const user = await requireAppUser(request, env);
  const path = new URL(request.url).pathname;
  const part = path.endsWith("/progress")
    ? "progress"
    : path.endsWith("/mastery")
      ? "mastery"
      : path.endsWith("/attempts")
        ? "attempts"
        : "profile";

  if (part === "profile") {
    if (request.method === "PUT") {
      assertSameOrigin(request);
      return handleAppChildProfile(request, env, user, childId);
    }
    if (request.method === "DELETE") {
      assertSameOrigin(request);
      await assertOwnedChild(env, user.id, childId);
      await env.CMS_DB.prepare("DELETE FROM child_attempts WHERE child_id = ?")
        .bind(childId)
        .run();
      await env.CMS_DB.prepare("DELETE FROM child_mastery WHERE child_id = ?")
        .bind(childId)
        .run();
      await env.CMS_DB.prepare("DELETE FROM child_module_progress WHERE child_id = ?")
        .bind(childId)
        .run();
      await env.CMS_DB.prepare("DELETE FROM children WHERE id = ? AND parent_id = ?")
        .bind(childId, user.id)
        .run();
      return jsonResponse({ ok: true });
    }
    throw new HttpError(405, "Metode tidak didukung.");
  }

  if (request.method !== "PUT" && !(part === "attempts" && request.method === "POST")) {
    throw new HttpError(405, "Metode tidak didukung.");
  }
  assertSameOrigin(request);
  if (part === "progress") return handleAppChildProgress(request, env, user, childId);
  if (part === "mastery") return handleAppChildMastery(request, env, user, childId);
  return handleAppChildAttempts(request, env, user, childId);
}

async function handleSetup(request: Request, env: Env): Promise<Response> {
  assertSameOrigin(request);
  if (!env.CMS_SETUP_TOKEN || env.CMS_SETUP_TOKEN.length < 32) {
    throw new HttpError(
      503,
      "Setup Admin Master belum dikonfigurasi. Tambahkan secret CMS_SETUP_TOKEN melalui Wrangler.",
    );
  }
  const existing = await env.CMS_DB.prepare(
    `SELECT id FROM users WHERE role_id = 'admin_master' LIMIT 1`,
  ).first<{ id: string }>();
  if (existing) throw new HttpError(409, "Admin Master sudah dibuat.");

  const body = await readJson(request);
  const setupToken = requiredString(body, "setupToken", 256);
  if (setupToken.length < 32 || !(await constantHashCompare(setupToken, env.CMS_SETUP_TOKEN))) {
    throw new HttpError(403, "Kode setup tidak valid.");
  }
  const name = requiredString(body, "name", 160);
  const email = emailField(body, "email");
  const username = requiredString(body, "username", 40).toLowerCase();
  if (!/^[a-z0-9._-]{3,40}$/.test(username)) {
    throw new HttpError(400, "Username hanya boleh berisi huruf kecil, angka, titik, garis bawah, atau tanda hubung.");
  }
  const password = requiredString(body, "password", 256);
  const passwordHash = await hashPassword(password);
  const userId = createId("user");
  try {
    const created = await env.CMS_DB.prepare(
      `INSERT INTO users (id, name, email, username, password_hash, role_id, status)
       SELECT ?, ?, ?, ?, ?, 'admin_master', 'active'
        WHERE NOT EXISTS (SELECT 1 FROM users WHERE role_id = 'admin_master')`,
    )
      .bind(userId, name, email, username, passwordHash)
      .run();
    if (created.meta.changes !== 1) throw new HttpError(409, "Admin Master sudah dibuat.");
  } catch {
    throw new HttpError(409, "Email atau username tersebut sudah digunakan.");
  }
  await writeAudit(env.CMS_DB, userId, "admin.setup", "user", userId, null, { email });
  const token = randomToken();
  const expiresAt = new Date(Date.now() + SESSION_TTL_SECONDS * 1000).toISOString();
  await env.CMS_DB.prepare(
    "INSERT INTO sessions (id, user_id, token_hash, expires_at) VALUES (?, ?, ?, ?)",
  )
    .bind(createId("session"), userId, await sha256(token), expiresAt)
    .run();
  return jsonResponse(
    { ok: true },
    201,
    { "Set-Cookie": sessionCookie(token, SESSION_TTL_SECONDS) },
  );
}

async function constantHashCompare(left: string, right: string): Promise<boolean> {
  return constantTime(await sha256(left), await sha256(right));
}

function constantTime(left: string, right: string): boolean {
  let mismatch = left.length ^ right.length;
  for (let index = 0; index < Math.max(left.length, right.length); index += 1) {
    mismatch |= (left.charCodeAt(index) || 0) ^ (right.charCodeAt(index) || 0);
  }
  return mismatch === 0;
}

async function handleInvitationAccept(request: Request, env: Env): Promise<Response> {
  assertSameOrigin(request);
  const body = await readJson(request);
  const token = requiredString(body, "token", 256);
  const password = requiredString(body, "password", 256);
  const invitation = await env.CMS_DB.prepare(
    `SELECT i.id, i.user_id AS userId
       FROM invitations i
       JOIN users u ON u.id = i.user_id
      WHERE i.token_hash = ? AND i.accepted_at IS NULL
        AND i.expires_at > datetime('now') AND u.status = 'pending'`,
  )
    .bind(await sha256(token))
    .first<{ id: string; userId: string }>();
  if (!invitation) throw new HttpError(400, "Undangan tidak valid atau sudah kedaluwarsa.");
  const passwordHash = await hashPassword(password);
  await env.CMS_DB.prepare(
    `UPDATE users SET password_hash = ?, status = 'active', updated_at = CURRENT_TIMESTAMP
      WHERE id = ? AND status = 'pending'`,
  )
    .bind(passwordHash, invitation.userId)
    .run();
  await env.CMS_DB.prepare(
    "UPDATE invitations SET accepted_at = CURRENT_TIMESTAMP WHERE id = ? AND accepted_at IS NULL",
  )
    .bind(invitation.id)
    .run();
  await writeAudit(env.CMS_DB, invitation.userId, "invitation.accept", "user", invitation.userId, null, { status: "active" });
  return jsonResponse({ ok: true });
}

async function handleUsers(
  request: Request,
  env: Env,
  user: AuthenticatedUser,
  id?: string,
): Promise<Response> {
  if (request.method === "GET" && !id) {
    requirePermission(user, "users.read");
    const result = await env.CMS_DB.prepare(
      `SELECT u.id, u.name, u.email, u.username, u.role_id AS roleId,
              r.name AS roleName, u.status, u.last_login AS lastLogin,
              u.created_at AS createdAt, u.internal_reference AS internalReference,
              u.notes
         FROM users u JOIN roles r ON r.id = u.role_id
        ORDER BY u.created_at DESC LIMIT 500`,
    ).all<Record<string, unknown>>();
    return jsonResponse(result.results);
  }

  if (request.method === "POST" && !id) {
    requirePermission(user, "users.create");
    assertSameOrigin(request);
    const body = await readJson(request);
    const name = requiredString(body, "name", 160);
    const email = emailField(body, "email");
    const username = requiredString(body, "username", 40).toLowerCase();
    if (!/^[a-z0-9._-]{3,40}$/.test(username)) {
      throw new HttpError(400, "Format username tidak valid.");
    }
    const roleId = requiredString(body, "roleId", 100);
    if (roleId === "admin_master" && user.role_id !== "admin_master") {
      throw new HttpError(403, "Hanya Admin Master yang dapat membuat Admin Master.");
    }
    const role = await env.CMS_DB.prepare("SELECT id FROM roles WHERE id = ?")
      .bind(roleId)
      .first<{ id: string }>();
    if (!role) throw new HttpError(400, "Role yang dipilih tidak tersedia.");
    const newUserId = createId("user");
    if (roleId === "parent") {
      const password = requiredString(body, "password", 256);
      const passwordHash = await hashPassword(password);
      try {
        await env.CMS_DB.prepare(
          `INSERT INTO users
             (id, name, email, username, password_hash, role_id, status, notes)
           VALUES (?, ?, ?, ?, ?, 'parent', 'active', ?)`,
        )
          .bind(
            newUserId,
            name,
            email,
            username,
            passwordHash,
            optionalString(body, "notes", 2000),
          )
          .run();
      } catch {
        throw new HttpError(409, "Email atau username sudah digunakan.");
      }
      await writeAudit(env.CMS_DB, user.id, "user.create", "user", newUserId, null, {
        email,
        roleId,
      });
      return jsonResponse({ id: newUserId, status: "active" }, 201);
    }
    const invitationToken = randomToken();
    try {
      await env.CMS_DB.prepare(
        `INSERT INTO users
           (id, name, email, username, role_id, status, profile_photo, internal_reference, notes)
         VALUES (?, ?, ?, ?, ?, 'pending', ?, ?, ?)`,
      )
        .bind(
          newUserId,
          name,
          email,
          username,
          roleId,
          optionalString(body, "profilePhoto", 2000) || null,
          optionalString(body, "internalReference", 120) || null,
          optionalString(body, "notes", 2000),
        )
        .run();
    } catch {
      throw new HttpError(409, "Email atau username sudah digunakan.");
    }
    const invitationId = createId("invite");
    await env.CMS_DB.prepare(
      `INSERT INTO invitations (id, user_id, token_hash, expires_at)
       VALUES (?, ?, ?, datetime('now', '+48 hours'))`,
    )
      .bind(invitationId, newUserId, await sha256(invitationToken))
      .run();
    await writeAudit(env.CMS_DB, user.id, "user.invite", "user", newUserId, null, { email, roleId });
    return jsonResponse(
      {
        id: newUserId,
        status: "pending",
        invitationUrl: `${new URL(request.url).origin}/admin/activate?token=${invitationToken}`,
      },
      201,
    );
  }

  if (request.method === "PATCH" && id) {
    requirePermission(user, "users.update");
    assertSameOrigin(request);
    const existing = await env.CMS_DB.prepare(
      "SELECT id, role_id AS roleId, status FROM users WHERE id = ?",
    )
      .bind(id)
      .first<{ id: string; roleId: string; status: string }>();
    if (!existing) throw new HttpError(404, "Akun tidak ditemukan.");
    if (existing.roleId === "admin_master" && user.role_id !== "admin_master") {
      throw new HttpError(403, "Perubahan Admin Master hanya dapat dilakukan oleh Admin Master.");
    }
    const body = await readJson(request);
    const status = enumField(body, "status", ["active", "pending", "suspended"] as const, existing.status as "active" | "pending" | "suspended");
    let roleId = existing.roleId;
    if (body.roleId !== undefined) {
      roleId = requiredString(body, "roleId", 100);
      if (roleId === "admin_master" && user.role_id !== "admin_master") {
        throw new HttpError(403, "Hanya Admin Master yang dapat menetapkan role Admin Master.");
      }
      const role = await env.CMS_DB.prepare("SELECT id FROM roles WHERE id = ?")
        .bind(roleId)
        .first<{ id: string }>();
      if (!role) throw new HttpError(400, "Role yang dipilih tidak tersedia.");
    }
    if (id === user.id && status !== "active") {
      throw new HttpError(400, "Anda tidak dapat menonaktifkan akun yang sedang dipakai.");
    }
    await env.CMS_DB.prepare(
      "UPDATE users SET role_id = ?, status = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?",
    )
      .bind(roleId, status, id)
      .run();
    if (status !== "active") {
      await env.CMS_DB.prepare("DELETE FROM sessions WHERE user_id = ?").bind(id).run();
    }
    await writeAudit(env.CMS_DB, user.id, "user.update", "user", id, existing, { roleId, status });
    return jsonResponse({ id, roleId, status });
  }

  if (request.method === "DELETE" && id) {
    requirePermission(user, "users.delete");
    assertSameOrigin(request);
    if (id === user.id) throw new HttpError(400, "Anda tidak dapat menonaktifkan akun yang sedang dipakai.");
    const existing = await env.CMS_DB.prepare(
      "SELECT id, role_id AS roleId FROM users WHERE id = ?",
    )
      .bind(id)
      .first<{ id: string; roleId: string }>();
    if (!existing) throw new HttpError(404, "Akun tidak ditemukan.");
    if (existing.roleId === "admin_master") {
      const count = await env.CMS_DB.prepare(
        "SELECT COUNT(*) AS count FROM users WHERE role_id = 'admin_master' AND status = 'active'",
      ).first<{ count: number }>();
      if ((count?.count || 0) <= 1) {
        throw new HttpError(400, "Admin Master terakhir tidak dapat dinonaktifkan.");
      }
    }
    await env.CMS_DB.prepare(
      "UPDATE users SET status = 'suspended', updated_at = CURRENT_TIMESTAMP WHERE id = ?",
    )
      .bind(id)
      .run();
    await env.CMS_DB.prepare("DELETE FROM sessions WHERE user_id = ?").bind(id).run();
    await writeAudit(env.CMS_DB, user.id, "user.suspend", "user", id, existing, { status: "suspended" });
    return jsonResponse({ ok: true, status: "suspended" });
  }
  throw new HttpError(405, "Metode tidak didukung.");
}

async function handleRoles(
  request: Request,
  env: Env,
  user: AuthenticatedUser,
  roleId?: string,
): Promise<Response> {
  if (request.method === "GET") {
    requirePermission(user, "users.read");
    const [roles, permissions] = await Promise.all([
      env.CMS_DB.prepare(
        `SELECT r.id, r.name, r.description, r.system_role AS systemRole,
                COUNT(DISTINCT u.id) AS userCount,
                GROUP_CONCAT(rp.permission_id) AS permissionIds
           FROM roles r
           LEFT JOIN users u ON u.role_id = r.id
           LEFT JOIN role_permissions rp ON rp.role_id = r.id
          GROUP BY r.id ORDER BY r.name`,
      ).all<Record<string, unknown>>(),
      env.CMS_DB.prepare(
        "SELECT id, label, group_name AS groupName FROM permissions ORDER BY group_name, label",
      ).all<Record<string, unknown>>(),
    ]);
    return jsonResponse({
      roles: roles.results.map((role) => ({
        ...role,
        permissionIds:
          typeof role.permissionIds === "string" && role.permissionIds
            ? role.permissionIds.split(",")
            : [],
      })),
      permissions: permissions.results,
    });
  }
  if (request.method === "POST" && !roleId) {
    requirePermission(user, "roles.manage");
    assertSameOrigin(request);
    const body = await readJson(request);
    const name = requiredString(body, "name", 80);
    const description = optionalString(body, "description", 300);
    const id = `custom_${crypto.randomUUID()}`;
    try {
      await env.CMS_DB.prepare(
        "INSERT INTO roles (id, name, description, system_role) VALUES (?, ?, ?, 0)",
      )
        .bind(id, name, description)
        .run();
    } catch {
      throw new HttpError(409, "Nama role sudah digunakan.");
    }
    await writeAudit(env.CMS_DB, user.id, "role.create", "role", id, null, { name });
    return jsonResponse({ id, name, description, permissionIds: [] }, 201);
  }
  if (request.method === "PUT" && roleId) {
    requirePermission(user, "roles.manage");
    assertSameOrigin(request);
    if (roleId === "admin_master") {
      throw new HttpError(400, "Permission Admin Master tidak dapat dikurangi.");
    }
    const existing = await env.CMS_DB.prepare(
      "SELECT id, name, system_role AS systemRole FROM roles WHERE id = ?",
    )
      .bind(roleId)
      .first<{ id: string; name: string; systemRole: number }>();
    if (!existing) throw new HttpError(404, "Role tidak ditemukan.");
    const body = await readJson(request);
    const name = optionalString(body, "name", 80);
    const description = optionalString(body, "description", 300);
    const permissionIds = body.permissionIds;
    if (
      permissionIds !== undefined &&
      (!Array.isArray(permissionIds) ||
        permissionIds.length > 100 ||
        permissionIds.some((id) => typeof id !== "string"))
    ) {
      throw new HttpError(400, "Daftar permission tidak valid.");
    }
    if (permissionIds !== undefined) {
      const validPermissionIds = permissionIds as string[];
      const known = await env.CMS_DB.prepare(
        `SELECT COUNT(*) AS count FROM permissions
          WHERE id IN (${validPermissionIds.length ? validPermissionIds.map(() => "?").join(",") : "''"})`,
      )
        .bind(...validPermissionIds)
        .first<{ count: number }>();
      if ((known?.count || 0) !== validPermissionIds.length) {
        throw new HttpError(400, "Daftar permission berisi izin yang tidak dikenal.");
      }
    }
    await env.CMS_DB.prepare(
      "UPDATE roles SET name = ?, description = ? WHERE id = ?",
    )
      .bind(name || existing.name, description, roleId)
      .run();
    if (permissionIds !== undefined) {
      await env.CMS_DB.prepare("DELETE FROM role_permissions WHERE role_id = ?")
        .bind(roleId)
        .run();
      for (const permissionId of permissionIds as string[]) {
        await env.CMS_DB.prepare(
          "INSERT INTO role_permissions (role_id, permission_id) VALUES (?, ?)",
        )
          .bind(roleId, permissionId)
          .run();
      }
    }
    await writeAudit(env.CMS_DB, user.id, "role.update", "role", roleId, existing, { name, permissionIds });
    return jsonResponse({ ok: true });
  }
  if (request.method === "DELETE" && roleId) {
    requirePermission(user, "roles.manage");
    assertSameOrigin(request);
    const existing = await env.CMS_DB.prepare(
      "SELECT id, system_role AS systemRole FROM roles WHERE id = ?",
    )
      .bind(roleId)
      .first<{ id: string; systemRole: number }>();
    if (!existing) throw new HttpError(404, "Role tidak ditemukan.");
    if (existing.systemRole) throw new HttpError(400, "Role bawaan tidak dapat dihapus.");
    const users = await env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM users WHERE role_id = ?")
      .bind(roleId)
      .first<{ count: number }>();
    if ((users?.count || 0) > 0) throw new HttpError(409, "Role masih dipakai akun. Pindahkan akun terlebih dahulu.");
    await env.CMS_DB.prepare("DELETE FROM roles WHERE id = ?").bind(roleId).run();
    await writeAudit(env.CMS_DB, user.id, "role.delete", "role", roleId, existing, null);
    return jsonResponse({ ok: true });
  }
  throw new HttpError(405, "Metode tidak didukung.");
}

async function handleDashboard(
  env: Env,
  user: AuthenticatedUser,
): Promise<Response> {
  requirePermission(user, "dashboard.view");
  const [users, parents, categories, modules, lessons, materials, games, questions, needsReview, audit] =
    await Promise.all([
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM users").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM users WHERE role_id = 'parent' AND status = 'active'").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM categories WHERE status = 'active'").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM modules").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM lessons").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM materials").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM games").first<{ count: number }>(),
      env.CMS_DB.prepare("SELECT COUNT(*) AS count FROM questions").first<{ count: number }>(),
      env.CMS_DB.prepare(
        `SELECT status, COUNT(*) AS count FROM materials
          WHERE status IN ('draft', 'review') GROUP BY status`,
      ).all<{ status: string; count: number }>(),
      env.CMS_DB.prepare(
        `SELECT action, target_type AS targetType, created_at AS createdAt
           FROM audit_logs ORDER BY created_at DESC LIMIT 8`,
      ).all<Record<string, unknown>>(),
    ]);
  return jsonResponse({
    user: { id: user.id, name: user.name, email: user.email, role: user.role_name },
    counts: {
      users: users?.count || 0,
      parents: parents?.count || 0,
      categories: categories?.count || 0,
      modules: modules?.count || 0,
      lessons: lessons?.count || 0,
      materials: materials?.count || 0,
      games: games?.count || 0,
      questions: questions?.count || 0,
    },
    needsAttention: needsReview.results,
    activity: audit.results,
  });
}

async function ensureReferences(
  env: Env,
  table: "categories" | "modules" | "lessons" | "games" | "game_templates",
  id: string | null,
  label: string,
): Promise<void> {
  if (!id) return;
  const activeCategory = table === "categories" ? " AND status = 'active'" : "";
  const row = await env.CMS_DB.prepare(`SELECT id FROM ${table} WHERE id = ?${activeCategory}`)
    .bind(id)
    .first<{ id: string }>();
  if (!row) throw new HttpError(400, `${label} yang dipilih tidak tersedia.`);
}

async function handleResource(
  request: Request,
  env: Env,
  user: AuthenticatedUser,
  resourceName: string,
  id?: string,
): Promise<Response> {
  const definition = RESOURCES[resourceName];
  if (!definition) throw new HttpError(404, "Bagian CMS tidak ditemukan.");
  const permission = definition.permission;
  if (request.method === "GET") {
    requirePermission(user, `${permission}.read`);
    const params = new URL(request.url).searchParams;
    const search = (params.get("q") || "").trim().slice(0, 100);
    const status = (params.get("status") || "").trim();
    const conditions: string[] = [];
    const values: D1Value[] = [];
    if (id) {
      conditions.push("id = ?");
      values.push(id);
    }
    if (status) {
      conditions.push("status = ?");
      values.push(status);
    }
    if (search && definition.searchColumns.length) {
      conditions.push(`(${definition.searchColumns.map((column) => `${column} LIKE ?`).join(" OR ")})`);
      for (let index = 0; index < definition.searchColumns.length; index += 1) {
        values.push(`%${search}%`);
      }
    }
    const where = conditions.length ? `WHERE ${conditions.join(" AND ")}` : "";
    if (id) {
      const row = await env.CMS_DB.prepare(
        `SELECT ${definition.select} FROM ${definition.table} ${where} LIMIT 1`,
      )
        .bind(...values)
        .first<Record<string, unknown>>();
      if (!row) throw new HttpError(404, "Data tidak ditemukan.");
      return jsonResponse(row);
    }
    const result = await env.CMS_DB.prepare(
      `SELECT ${definition.listSelect ?? definition.select} FROM ${definition.table} ${where}
        ORDER BY created_at DESC`,
    )
      .bind(...values)
      .all<Record<string, unknown>>();
    return jsonResponse(result.results);
  }

  if (request.method === "POST" && !id) {
    requirePermission(user, `${permission}.create`);
    assertSameOrigin(request);
    const body = await readJson(request);
    for (const field of definition.required) {
      if (body[field] === undefined || body[field] === null || body[field] === "") {
        throw new HttpError(400, `${field} wajib diisi.`);
      }
    }
    const fields = Object.entries(definition.fields).map(([field, validate]) => ({
      field,
      value: validate(body, user, true),
    }));
    if (resourceName === "modules" || resourceName === "materials" || resourceName === "games" || resourceName === "questions") {
      const categoryId = typeof body.categoryId === "string" ? body.categoryId : null;
      await ensureReferences(env, "categories", categoryId, "Kategori");
    }
    if (resourceName === "lessons") {
      await ensureReferences(env, "modules", typeof body.moduleId === "string" ? body.moduleId : null, "Modul");
    }
    if (resourceName === "materials") {
      await ensureReferences(env, "lessons", typeof body.lessonId === "string" ? body.lessonId : null, "Lesson");
    }
    if (resourceName === "games") {
      await ensureReferences(env, "game_templates", typeof body.templateId === "string" ? body.templateId : null, "Template game");
    }
    if (resourceName === "questions") {
      await ensureReferences(env, "games", typeof body.gameId === "string" ? body.gameId : null, "Game");
    }
    const status = fields.find((field) => field.field === "status")?.value;
    if (status === "published") requirePermission(user, `${permission}.publish`);
    const recordId = createId(resourceName.slice(0, -1));
    const columnNames: string[] = ["id"];
    const values: D1Value[] = [recordId];
    for (const { field, value } of fields) {
      const column = camelToSnake(field);
      if (!/^[a-z_]+$/.test(column)) throw new HttpError(400, "Field tidak valid.");
      columnNames.push(column);
      values.push(value);
    }
    if (["modules", "lessons", "materials", "games", "questions"].includes(resourceName)) {
      columnNames.push("created_by", "updated_by");
      values.push(user.id, user.id);
    }
    const placeholders = columnNames.map(() => "?").join(", ");
    try {
      await env.CMS_DB.prepare(
        `INSERT INTO ${definition.table} (${columnNames.join(", ")}) VALUES (${placeholders})`,
      )
        .bind(...values)
        .run();
    } catch (error) {
      if (error instanceof Error && /unique/i.test(error.message)) {
        throw new HttpError(409, "Nilai unik sudah digunakan. Periksa nama atau slug.");
      }
      if (error instanceof Error && /foreign key/i.test(error.message)) {
        throw new HttpError(400, "Hubungan kategori, modul, lesson, atau game tidak valid.");
      }
      throw error;
    }
    await writeAudit(env.CMS_DB, user.id, `${resourceName}.create`, resourceName, recordId, null, body);
    return jsonResponse({ id: recordId }, 201);
  }

  if ((request.method === "PUT" || request.method === "PATCH") && id) {
    requirePermission(user, `${permission}.update`);
    assertSameOrigin(request);
    const before = await env.CMS_DB.prepare(
      `SELECT ${definition.select} FROM ${definition.table} WHERE id = ?`,
    )
      .bind(id)
      .first<Record<string, unknown>>();
    if (!before) throw new HttpError(404, "Data tidak ditemukan.");
    const body = await readJson(request);
    const fields: { column: string; value: D1Value }[] = [];
    for (const [field, validate] of Object.entries(definition.fields)) {
      if (!(field in body)) continue;
      fields.push({
        column: camelToSnake(field),
        value: validate(body, user, false),
      });
    }
    if (!fields.length) throw new HttpError(400, "Tidak ada perubahan untuk disimpan.");
    const status = fields.find((field) => field.column === "status")?.value;
    if (status === "published") requirePermission(user, `${permission}.publish`);
    if (["modules", "lessons", "materials", "games", "questions"].includes(resourceName)) {
      fields.push({ column: "updated_by", value: user.id });
    }
    fields.push({ column: "updated_at", value: new Date().toISOString() });
    const assignments = fields.map(({ column }) => `${column} = ?`).join(", ");
    try {
      await env.CMS_DB.prepare(
        `UPDATE ${definition.table} SET ${assignments} WHERE id = ?`,
      )
        .bind(...fields.map(({ value }) => value), id)
        .run();
    } catch (error) {
      if (error instanceof Error && /unique/i.test(error.message)) {
        throw new HttpError(409, "Nilai unik sudah digunakan. Periksa slug.");
      }
      throw error;
    }
    await writeAudit(env.CMS_DB, user.id, `${resourceName}.update`, resourceName, id, before, body);
    return jsonResponse({ id });
  }

  if (request.method === "DELETE" && id) {
    requirePermission(user, `${permission}.delete`);
    assertSameOrigin(request);
    if (!definition.canDelete || resourceName === "categories") {
      throw new HttpError(400, "Kategori menggunakan arsip, bukan hapus permanen.");
    }
    const before = await env.CMS_DB.prepare(
      `SELECT ${definition.select} FROM ${definition.table} WHERE id = ?`,
    )
      .bind(id)
      .first<Record<string, unknown>>();
    if (!before) throw new HttpError(404, "Data tidak ditemukan.");
    if ("status" in before && before.status === "published") {
      throw new HttpError(409, "Konten terbit tidak dapat dihapus. Arsipkan terlebih dahulu.");
    }
    await env.CMS_DB.prepare(`DELETE FROM ${definition.table} WHERE id = ?`).bind(id).run();
    await writeAudit(env.CMS_DB, user.id, `${resourceName}.delete`, resourceName, id, before, null);
    return jsonResponse({ ok: true });
  }
  throw new HttpError(405, "Metode tidak didukung.");
}

function camelToSnake(value: string): string {
  return value.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);
}

async function handleTemplates(
  env: Env,
  user: AuthenticatedUser | null,
): Promise<Response> {
  requirePermission(user, "games.read");
  const result = await env.CMS_DB.prepare(
    "SELECT id, name, game_type AS gameType, description, configuration_json AS configurationJson FROM game_templates ORDER BY name",
  ).all<Record<string, unknown>>();
  return jsonResponse(result.results);
}

async function handleApi(request: Request, env: Env): Promise<Response> {
  if (request.method === "OPTIONS") {
    return new Response(null, {
      status: 204,
      headers: {
        Allow: "GET, POST, PUT, PATCH, DELETE, OPTIONS",
        "Cache-Control": "no-store",
      },
    });
  }
  if (!env.CMS_DB) throw new HttpError(503, "Database CMS belum dikonfigurasi.");
  const path = new URL(request.url).pathname.replace(/\/+$/, "");

  if (path === "/api/auth/login" && request.method === "POST") {
    return handleAppLogin(request, env);
  }
  if (path === "/api/auth/me" && request.method === "GET") {
    return handleAppMe(request, env);
  }
  if (path === "/api/auth/logout" && request.method === "POST") {
    return handleAppLogout(request, env);
  }
  if (path === "/api/app/data" && request.method === "GET") {
    return handleAppData(request, env);
  }
  const appChildMatch = path.match(/^\/api\/app\/children\/([^/]+)(?:\/(progress|mastery|attempts))?$/);
  if (appChildMatch) {
    return handleAppChild(request, env, decodeURIComponent(appChildMatch[1]));
  }
  if (path === "/api/cms/setup/status" && request.method === "GET") {
    const admin = await env.CMS_DB.prepare(
      "SELECT id FROM users WHERE role_id = 'admin_master' LIMIT 1",
    ).first<{ id: string }>();
    return jsonResponse({
      configured: Boolean(admin),
      setupAvailable: Boolean(env.CMS_SETUP_TOKEN && env.CMS_SETUP_TOKEN.length >= 32) && !admin,
    });
  }
  if (path === "/api/cms/setup" && request.method === "POST") {
    return handleSetup(request, env);
  }
  if (path === "/api/cms/login" && request.method === "POST") {
    return handleLogin(request, env);
  }
  if (path === "/api/cms/invitations/accept" && request.method === "POST") {
    return handleInvitationAccept(request, env);
  }

  const user = await authenticate(request, env);
  if (path === "/api/cms/me" && request.method === "GET") {
    requirePermission(user, "dashboard.view");
    return jsonResponse({
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
      roleId: user.role_id,
      roleName: user.role_name,
      permissions: user.permissions,
    });
  }
  if (path === "/api/cms/logout" && request.method === "POST") {
    assertSameOrigin(request);
    const cookie = request.headers.get("Cookie") || "";
    const token = cookie
      .split(";")
      .map((part) => part.trim())
      .find((part) => part.startsWith("bk_cms_session="))
      ?.slice("bk_cms_session=".length);
    if (token) {
      await env.CMS_DB.prepare("DELETE FROM sessions WHERE token_hash = ?")
        .bind(await sha256(decodeURIComponent(token)))
        .run();
    }
    return jsonResponse({ ok: true }, 200, { "Set-Cookie": expiredSessionCookie() });
  }
  if (path === "/api/cms/dashboard" && request.method === "GET") {
    return handleDashboard(env, user!);
  }
  if (path === "/api/cms/roles") {
    return handleRoles(request, env, user!, undefined);
  }
  const roleMatch = path.match(/^\/api\/cms\/roles\/([^/]+)$/);
  if (roleMatch) return handleRoles(request, env, user!, decodeURIComponent(roleMatch[1]));
  if (path === "/api/cms/users") return handleUsers(request, env, user!, undefined);
  const userMatch = path.match(/^\/api\/cms\/users\/([^/]+)$/);
  if (userMatch) return handleUsers(request, env, user!, decodeURIComponent(userMatch[1]));
  if (path === "/api/cms/game-templates" && request.method === "GET") {
    return handleTemplates(env, user);
  }
  const resourceMatch = path.match(/^\/api\/cms\/(categories|modules|lessons|materials|media|games|questions)(?:\/([^/]+))?$/);
  if (resourceMatch) {
    return handleResource(
      request,
      env,
      user!,
      resourceMatch[1],
      resourceMatch[2] ? decodeURIComponent(resourceMatch[2]) : undefined,
    );
  }
  throw new HttpError(404, "Endpoint CMS tidak ditemukan.");
}

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);
    if (
      url.pathname.startsWith("/api/cms/") ||
      url.pathname.startsWith("/api/auth/") ||
      url.pathname.startsWith("/api/app/")
    ) {
      try {
        return await handleApi(request, env);
      } catch (error) {
        if (error instanceof HttpError) {
          return jsonResponse({ error: error.message }, error.status);
        }
        console.error("CMS API request failed.", error);
        return jsonResponse({ error: "Permintaan gagal diproses. Silakan coba lagi." }, 500);
      }
    }
    return env.ASSETS.fetch(request);
  },
};
