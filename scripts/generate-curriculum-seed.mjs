/**
 * Membuat migration SQL yang mengisi tabel lessons dan materials dari
 * kurikulum statis di src/data/modules.
 *
 * Setiap modul statis menghasilkan:
 *  - satu lesson per aktivitas (id: builtin-lesson-<moduleId>-<urutan>)
 *  - 10 materi dari 10 soal latihan (id: builtin-material-<moduleId>-latihan-<01..10>)
 *
 * Pemakaian: node scripts/generate-curriculum-seed.mjs
 * Keluaran ditulis ke `migrations/0003_curriculum_part*.sql`. File dipecah agar tiap
 * migration tetap jauh di bawah batas 100 KB per perintah D1.
 */
import { build } from "esbuild";
import { mkdtemp, readdir, unlink, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import path from "node:path";
import { pathToFileURL } from "node:url";

const ROOT = path.resolve(import.meta.dirname, "..");
const MIGRATIONS_DIR = path.join(ROOT, "migrations");
const CHUNK_BYTES = 70_000;
const QUESTIONS_PER_MODULE = 10;

const CATEGORIES = [
  ["stories", "Cerita Anak", "📖"],
  ["mathematics", "Matematika", "🔢"],
  ["science", "Sains", "🔬"],
  ["social", "IPS", "🌏"],
  ["arabic", "Bahasa Arab", "🕌"],
  ["mandarin", "Bahasa Mandarin", "🀄"],
  ["indonesian", "Bahasa Indonesia", "🇮🇩"],
  ["english", "Bahasa Inggris", "🔤"],
  ["coding", "Coding", "💻"],
];

const sqlText = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;
const sqlJson = (value) => sqlText(JSON.stringify(value));
const clip = (value, max) => {
  const text = String(value ?? "").replace(/\s+/g, " ").trim();
  return text.length > max ? `${text.slice(0, max - 1)}…` : text;
};

function parseAgeRange(ageRange) {
  const match = /^(\d+)\s*-\s*(\d+)$/.exec(String(ageRange ?? ""));
  if (!match) throw new Error(`ageRange tidak dikenali: ${ageRange}`);
  return [Number(match[1]), Number(match[2])];
}

function materialDifficulty(questionDifficulty) {
  if (questionDifficulty >= 3) return "advanced";
  if (questionDifficulty === 2) return "developing";
  return "beginner";
}

const activityBlocks = (activity) => {
  const items = activity.exploreItems || [];
  if (activity.type === "game") {
    return [{ type: "game", title: activity.title, body: activity.gameType || "" }];
  }
  if (activity.type === "practice") {
    return [
      {
        type: "quiz",
        title: activity.title,
        body: `${activity.questions?.length ?? 0} soal latihan`,
      },
    ];
  }
  if (activity.type === "explore" && items.length) {
    return [
      {
        type: "text",
        title: activity.title,
        body: [
          activity.bimoNarration,
          ...items.map((item) => `${item.icon} ${item.label} — ${item.soundText}`),
        ]
          .filter(Boolean)
          .join("\n"),
      },
    ];
  }
  return [
    {
      type: "text",
      title: activity.title,
      body: activity.details || activity.bimoNarration || "",
    },
  ];
};

const questionBlocks = (question) => [
  {
    type: "question",
    title: clip(question.text, 180),
    body: (question.options || [])
      .map((option) => `${option.isCorrect ? "✔" : "•"} ${option.text}`)
      .join("\n"),
  },
  { type: "text", title: "Petunjuk", body: question.hint || "" },
];

async function loadModules() {
  const directory = await mkdtemp(path.join(tmpdir(), "bintang-seed-"));
  const bundle = path.join(directory, "modules.mjs");
  await build({
    entryPoints: [path.join(ROOT, "src/data/modules/index.ts")],
    bundle: true,
    format: "esm",
    platform: "node",
    outfile: bundle,
    logLevel: "silent",
  });
  const { ALL_MODULES } = await import(pathToFileURL(bundle).href);
  return ALL_MODULES;
}

function buildStatements(modules) {
  const statements = [];

  for (const [index, [id, name, icon]] of CATEGORIES.entries()) {
    statements.push(
      `INSERT OR IGNORE INTO categories (id, name, description, icon, color, sort_order, status)\n` +
        `  VALUES (${sqlText(id)}, ${sqlText(name)}, '', ${sqlText(icon)}, '#4DA3FF', ${index}, 'active');`,
    );
  }

  for (const module of modules) {
    const [ageMin, ageMax] = parseAgeRange(module.ageRange);
    const activities = module.activities || [];
    const practice = activities.find((activity) => activity.type === "practice");
    const questions = practice?.questions || [];
    if (questions.length !== QUESTIONS_PER_MODULE) {
      throw new Error(
        `Modul ${module.id} punya ${questions.length} soal latihan, seharusnya ${QUESTIONS_PER_MODULE}.`,
      );
    }

    statements.push(
      [
        `INSERT OR IGNORE INTO modules (id, category_id, title, description, age_min, age_max, difficulty, duration_minutes,` +
          ` objectives_json, skills_json, prerequisites_json, status, created_by, updated_by)`,
        `  SELECT ${sqlText(module.id)}, ${sqlText(module.category)}, ${sqlText(module.title)}, ${sqlText(module.description)},` +
          ` ${ageMin}, ${ageMax}, ${sqlText(module.difficulty || "beginner")}, ${Number(module.estimatedDuration) || 10},` +
          ` ${sqlJson(module.learningObjectives || [])}, ${sqlJson(module.skills || [])},` +
          ` ${sqlJson(module.prerequisites || [])}, 'published', u.id, u.id`,
        `    FROM (SELECT id FROM users WHERE role_id = 'admin_master' AND status = 'active' ORDER BY created_at LIMIT 1) AS u;`,
      ].join("\n"),
    );

    const lessonDuration = Math.max(1, Math.round((Number(module.estimatedDuration) || 10) / Math.max(1, activities.length)));
    activities.forEach((activity, activityIndex) => {
      statements.push(
        [
          `INSERT OR IGNORE INTO lessons (id, module_id, title, content_json, sort_order, duration_minutes, status, created_by, updated_by)`,
          `  SELECT ${sqlText(`builtin-lesson-${module.id}-${activityIndex + 1}`)}, ${sqlText(module.id)},` +
            ` ${sqlText(clip(activity.title, 180))}, ${sqlJson(activityBlocks(activity))}, ${activityIndex},` +
            ` ${lessonDuration}, 'published', created_by, updated_by`,
          `    FROM modules WHERE id = ${sqlText(module.id)};`,
        ].join("\n"),
      );
    });

    const practiceLessonId = `builtin-lesson-${module.id}-${activities.indexOf(practice) + 1}`;
    questions.forEach((question, questionIndex) => {
      const number = String(questionIndex + 1).padStart(2, "0");
      statements.push(
        [
          `INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json, thumbnail_url,` +
            ` cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status, created_by, updated_by)`,
          `  SELECT ${sqlText(`builtin-material-${module.id}-latihan-${number}`)}, l.id, m.category_id,` +
            ` ${sqlText(clip(question.text, 180))}, ${sqlText(`${module.id}-latihan-${number}`)},` +
            ` ${sqlText(clip(question.audioText || question.hint, 1000))}, ${sqlJson(questionBlocks(question))}, '', '',` +
            ` m.age_min, m.age_max, ${sqlText(materialDifficulty(question.difficulty))},` +
            ` ${sqlJson([clip(question.text, 300)])}, ${sqlJson([question.skillId])}, 'published', m.created_by, m.updated_by`,
          `    FROM modules m LEFT JOIN lessons l ON l.id = ${sqlText(practiceLessonId)}`,
          `   WHERE m.id = ${sqlText(module.id)};`,
        ].join("\n"),
      );
    });
  }

  return statements;
}

const modules = await loadModules();
const statements = buildStatements(modules);
const header = [
  "-- Seed kurikulum statis (src/data/modules) ke tabel CMS.",
  "-- Dihasilkan oleh scripts/generate-curriculum-seed.mjs. Jangan diubah manual.",
  `-- ${modules.length} modul, ${modules.reduce((total, item) => total + (item.activities?.length || 0), 0)} lesson,` +
    ` ${modules.length * QUESTIONS_PER_MODULE} materi.`,
  "-- Semua pernyataan memakai INSERT OR IGNORE sehingga aman dijalankan berulang.",
  "-- Migrasi hanya mengisi data jika kategori dan akun Admin Master sudah ada.",
  "",
].join("\n");

// Hapus berkas hasil generate sebelumnya agar tidak ada sisa bagian yang usang.
for (const entry of await readdir(MIGRATIONS_DIR)) {
  if (/^\d{4}_curriculum.*\.sql$/.test(entry)) {
    await unlink(path.join(MIGRATIONS_DIR, entry));
  }
}

const chunks = [];
let current = [];
let currentBytes = Buffer.byteLength(header);
for (const statement of statements) {
  const statementBytes = Buffer.byteLength(statement) + 2;
  if (current.length && currentBytes + statementBytes > CHUNK_BYTES) {
    chunks.push(current);
    current = [];
    currentBytes = Buffer.byteLength(header);
  }
  current.push(statement);
  currentBytes += statementBytes;
}
if (current.length) chunks.push(current);

for (const [index, chunk] of chunks.entries()) {
  const fileName = `${String(index + 3).padStart(4, "0")}_curriculum_part${index + 1}.sql`;
  await writeFile(path.join(MIGRATIONS_DIR, fileName), `${header}\n${chunk.join("\n\n")}\n`, "utf8");
}

console.log(
  `Seed ditulis ke ${chunks.length} migration: ${modules.length} modul, ${statements.length} pernyataan.`,
);
