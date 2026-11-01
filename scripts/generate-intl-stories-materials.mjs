/**
 * Membuat migration SQL berisi 10 materi untuk setiap modul `intl-*` kategori cerita.
 *
 * Modul `intl-*` tidak berasal dari kurikulum statis (src/data/modules), jadi isinya
 * dibaca dari D1: satu lesson per modul dengan blok learn/explore/game/practice/review.
 * Setiap modul diubah menjadi tepat 10 materi:
 *   ringkasan, kartu amati (satu per contoh), misi game, soal latihan asli dari lesson,
 *   soal turunan (ide utama, penerapan, bukan contoh), refleksi, dan panduan orang tua
 *   bila jumlah contoh di lesson kurang dari tiga.
 *
 * Pemakaian: node scripts/generate-intl-stories-materials.mjs
 * Keluaran ditulis ke `migrations/0010_intl_stories_part*.sql`.
 */
import { execFileSync } from "node:child_process";
import { readdir, unlink, writeFile } from "node:fs/promises";
import path from "node:path";

const ROOT = path.resolve(import.meta.dirname, "..");
const MIGRATIONS_DIR = path.join(ROOT, "migrations");
const DATABASE = "bintang-kecil-cms";
const CATEGORY = "stories";
const MATERIALS_PER_MODULE = 10;
const CHUNK_BYTES = 70_000;
const WRANGLER_BIN = path.join(ROOT, "node_modules", "wrangler", "bin", "wrangler.js");

const sqlText = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;
const sqlJson = (value) => sqlText(JSON.stringify(value));
const clip = (value, max) => {
  const text = String(value ?? "").replace(/\s+/g, " ").trim();
  return text.length > max ? `${text.slice(0, max - 1)}…` : text;
};
const firstSentence = (value) => {
  const text = String(value ?? "").replace(/\s+/g, " ").trim();
  const match = /^(.+?[.!?])(\s|$)/.exec(text);
  return clip(match ? match[1] : text, 220);
};

function queryRemote(sql) {
  const output = execFileSync(
    process.execPath,
    [WRANGLER_BIN, "d1", "execute", DATABASE, "--remote", "--json", "--command", sql],
    { encoding: "utf8", maxBuffer: 128 * 1024 * 1024, cwd: ROOT },
  );
  const start = output.indexOf("[");
  const end = output.lastIndexOf("]");
  if (start < 0 || end < 0) {
    throw new Error(`Keluaran wrangler tidak dikenali:\n${output.slice(0, 400)}`);
  }
  return JSON.parse(output.slice(start, end + 1))[0].results;
}

const fetchSql =
  `SELECT m.id, m.title, m.category_id, m.difficulty, m.age_min, m.age_max, m.skills_json,` +
  ` l.id AS lesson_id, l.content_json` +
  `  FROM modules m` +
  `  LEFT JOIN lessons l ON l.id = (SELECT id FROM lessons WHERE module_id = m.id ORDER BY sort_order LIMIT 1)` +
  ` WHERE m.id LIKE 'intl-%' AND m.category_id = ${sqlText(CATEGORY)}` +
  ` ORDER BY m.id`;

const rows = queryRemote(fetchSql);
if (rows.length === 0) throw new Error("Tidak ada modul intl-* di kategori cerita.");

const modules = rows.map((row) => {
  const blocks = JSON.parse(row.content_json || "[]");
  const learn = blocks.find((block) => block.type === "learn") || {};
  const explore = blocks.find((block) => block.type === "explore") || {};
  const game = blocks.find((block) => block.type === "game") || {};
  const practice = blocks.find((block) => block.type === "practice") || {};
  const review = blocks.find((block) => block.type === "review") || {};
  const items = (explore.exploreItems || []).filter((item) => item?.label);
  const question = (practice.questions || [])[0];
  if (items.length === 0) throw new Error(`Modul ${row.id} tidak punya kartu amati.`);
  if (!question) throw new Error(`Modul ${row.id} tidak punya soal latihan di lesson-nya.`);
  return {
    ...row,
    skills: JSON.parse(row.skills_json || "[]"),
    definition: firstSentence(learn.details) || firstSentence(question.hint) || row.title,
    narration: learn.bimoNarration || "",
    items,
    gameType: game.gameType || "word-image",
    question,
    review: review.bimoNarration || "",
  };
});

const questionBlocks = (text, options, hint) => [
  {
    type: "question",
    title: clip(text, 180),
    body: options.map((option) => `${option.correct ? "✔" : "•"} ${option.text}`).join("\n"),
  },
  { type: "text", title: "Petunjuk", body: hint },
];

function buildMaterials(module, index) {
  const title = module.title;
  const lower = title.toLowerCase();
  const otherOf = (offset) => modules[(index + offset) % modules.length];
  const cards = [];

  const add = (card) => cards.push(card);

  add({
    title: `Ringkasan: ${title}`,
    summary: module.definition,
    blocks: [
      { type: "text", title: `Yuk belajar: ${title}`, body: module.narration },
      { type: "text", title: "Penjelasan", body: module.definition },
    ],
  });

  module.items.slice(0, 3).forEach((item) => {
    add({
      title: `Amati: ${item.label}`,
      summary: clip(item.explanation || module.definition, 400),
      blocks: [
        {
          type: "text",
          title: `${item.icon || "🔎"} ${item.label}`,
          body: [item.soundText, item.explanation].filter(Boolean).join("\n"),
        },
      ],
    });
  });

  add({
    title: `Misi: ${title}`,
    summary: `Permainan ${module.gameType} untuk menguatkan pemahaman ${lower}.`,
    blocks: [
      { type: "game", title: `Misi kecil: ${title}`, body: module.gameType },
      {
        type: "text",
        title: "Cara bermain",
        body: "Amati contoh, lalu pilih pasangan yang tepat.",
      },
    ],
  });

  add({
    title: `Latihan: ${clip(module.question.text, 100)}`,
    summary: clip(module.question.text, 400),
    blocks: questionBlocks(
      module.question.text,
      (module.question.options || []).map((option) => ({
        text: option.text,
        correct: Boolean(option.isCorrect),
      })),
      module.question.hint || module.definition,
    ),
  });

  add({
    title: `Soal: Ide utama ${title}`,
    summary: `Mengenali gagasan pokok dari ${lower}.`,
    blocks: questionBlocks(
      `Apa ide utama dari ${title}?`,
      [
        { text: module.definition, correct: true },
        ...(otherOf(1).definition !== module.definition
          ? [{ text: otherOf(1).definition, correct: false }]
          : []),
        ...(otherOf(3).definition !== module.definition
          ? [{ text: otherOf(3).definition, correct: false }]
          : []),
      ],
      `Ingat kembali: ${module.definition}`,
    ),
  });

  add({
    title: `Soal: Penerapan ${title}`,
    summary: `Memilih langkah yang tepat saat mempelajari ${lower}.`,
    blocks: questionBlocks(
      `Langkah mana yang paling tepat saat mempelajari ${lower}?`,
      [
        { text: module.items[0].label, correct: true },
        ...(module.items[1] ? [{ text: module.items[1].label, correct: false }] : []),
        ...(module.items[2] ? [{ text: module.items[2].label, correct: false }] : []),
        ...(otherOf(2).items[0].label !== module.items[0].label
          ? [{ text: otherOf(2).items[0].label, correct: false }]
          : []),
      ],
      `Pilih yang berhubungan langsung dengan ${lower}.`,
    ),
  });

  if (module.items[1]) {
    add({
      title: `Soal: Bukan contoh ${title}`,
      summary: "Membedakan contoh yang sesuai dan yang tidak sesuai.",
      blocks: questionBlocks(
        `Mana yang BUKAN contoh ${lower}?`,
        [
          { text: module.items[1].label, correct: true },
          { text: module.items[0].label, correct: false },
          ...(otherOf(2).items[0].label !== module.items[1].label
            ? [{ text: otherOf(2).items[0].label, correct: false }]
            : []),
        ],
        "Dua pilihan lain adalah contoh yang benar, jadi pilih sisanya.",
      ),
    });
  }

  add({
    title: `Refleksi: ${title}`,
    summary: module.review || module.definition,
    blocks: [
      {
        type: "text",
        title: "Yang sudah kamu pelajari",
        body: module.review || module.definition,
      },
      {
        type: "text",
        title: "Tugas kecil",
        body: `Sebutkan satu contoh ${lower} yang kamu temui hari ini, lalu ceritakan kepada orang tua.`,
      },
    ],
  });

  // Modul dengan contoh kurang dari tiga tetap mendapat 10 materi lewat panduan tambahan.
  const extras = [
    {
      title: `Panduan orang tua: ${title}`,
      summary: `Cara mendampingi anak belajar ${lower} di rumah.`,
      blocks: [
        { type: "text", title: "Inti materi", body: module.definition },
        {
          type: "text",
          title: "Saran pendampingan",
          body: `Bacakan ringkasan bersama anak, lalu minta anak menjelaskan ${lower} dengan kata-katanya sendiri.`,
        },
      ],
    },
    {
      title: `Ulangi bersama: ${title}`,
      summary: module.definition,
      blocks: [
        { type: "text", title: "Penjelasan", body: module.definition },
        {
          type: "text",
          title: "Ajak bicara",
          body: `Minta anak menyebutkan satu contoh ${lower} dari cerita yang pernah dibaca.`,
        },
      ],
    },
  ];
  for (const extra of extras) {
    if (cards.length >= MATERIALS_PER_MODULE) break;
    add(extra);
  }
  if (cards.length !== MATERIALS_PER_MODULE) {
    throw new Error(`Modul ${module.id} menghasilkan ${cards.length} materi.`);
  }

  return cards.map((card, cardIndex) => ({
    ...card,
    key: String(cardIndex + 1).padStart(2, "0"),
  }));
}

const header = [
  "-- 10 materi per modul intl-* kategori cerita, disusun dari isi lesson di D1.",
  "-- Dihasilkan oleh scripts/generate-intl-stories-materials.mjs. Jangan diubah manual.",
  "-- INSERT OR IGNORE sehingga aman dijalankan berulang.",
  "",
].join("\n");

const statements = [];
for (const [index, module] of modules.entries()) {
  const materials = buildMaterials(module, index);
  for (const material of materials) {
    statements.push(
      [
        `INSERT OR IGNORE INTO materials (id, lesson_id, category_id, title, slug, summary, content_json,` +
          ` thumbnail_url, cover_url, age_min, age_max, difficulty, objectives_json, skills_json, status,` +
          ` created_by, updated_by)`,
        `  SELECT ${sqlText(`builtin-material-${module.id}-materi-${material.key}`)}, l.id, m.category_id,` +
          ` ${sqlText(clip(material.title, 180))}, ${sqlText(`${module.id}-materi-${material.key}`)},` +
          ` ${sqlText(clip(material.summary, 1000))}, ${sqlJson(material.blocks)}, '', '',` +
          ` m.age_min, m.age_max, ${sqlText(module.difficulty)},` +
          ` ${sqlJson([clip(material.summary, 300)])}, ${sqlJson(module.skills)}, 'published',` +
          ` m.created_by, m.updated_by`,
        `    FROM modules m`,
        `    LEFT JOIN lessons l ON l.id = ${sqlText(module.lesson_id ?? "")}`,
        `   WHERE m.id = ${sqlText(module.id)};`,
      ].join("\n"),
    );
  }
}

// Hapus hasil generate sebelumnya agar tidak ada bagian usang yang tertinggal.
for (const entry of await readdir(MIGRATIONS_DIR)) {
  if (/^\d{4}_intl_stories.*\.sql$/.test(entry)) await unlink(path.join(MIGRATIONS_DIR, entry));
}

// Pecah per ±70 KB karena D1 membatasi panjang satu perintah SQL ke 100 KB.
const chunks = [];
let current = [];
let currentBytes = Buffer.byteLength(header);
for (const statement of statements) {
  const bytes = Buffer.byteLength(statement) + 2;
  if (current.length && currentBytes + bytes > CHUNK_BYTES) {
    chunks.push(current);
    current = [];
    currentBytes = Buffer.byteLength(header);
  }
  current.push(statement);
  currentBytes += bytes;
}
if (current.length) chunks.push(current);

for (const [index, chunk] of chunks.entries()) {
  const fileName = `0010_intl_stories_part${index + 1}.sql`;
  await writeFile(path.join(MIGRATIONS_DIR, fileName), `${header}${chunk.join("\n\n")}\n`, "utf8");
}

console.log(
  `Seed ditulis ke ${chunks.length} migration: ${modules.length} modul, ${statements.length} materi.`,
);
