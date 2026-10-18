import { spawn } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

const IGNORE_PATTERNS = [
  /^\.git([\\/]|$)/,
  /^node_modules([\\/]|$)/,
  /^dist([\\/]|$)/,
  /^\.wrangler([\\/]|$)/,
  /\.tmp$/,
  /~$/,
  /Thumbs\.db$/,
  /\.DS_Store$/
];

let syncTimeout = null;
let isSyncing = false;
let pendingSync = false;
const DEBOUNCE_MS = 3000;

function runCommand(command, args, cwd) {
  return new Promise((resolve, reject) => {
    const proc = spawn(command, args, { cwd, shell: true });
    let stdout = '';
    let stderr = '';

    proc.stdout.on('data', (data) => {
      stdout += data.toString();
    });

    proc.stderr.on('data', (data) => {
      stderr += data.toString();
    });

    proc.on('close', (code) => {
      if (code === 0) {
        resolve(stdout.trim());
      } else {
        reject(new Error(stderr.trim() || stdout.trim() || `Exit code ${code}`));
      }
    });

    proc.on('error', (err) => {
      reject(err);
    });
  });
}

async function doSync() {
  if (isSyncing) {
    pendingSync = true;
    return;
  }

  isSyncing = true;
  pendingSync = false;

  try {
    const status = await runCommand('git', ['status', '--porcelain'], rootDir);
    if (!status) {
      // Tidak ada perubahan yang perlu di-commit
      isSyncing = false;
      return;
    }

    const changedFiles = status
      .split('\n')
      .map((line) => {
        const match = line.match(/^.{2}\s+(.*)$/);
        return match ? match[1].trim() : null;
      })
      .filter(Boolean);

    const now = new Date();
    const timeStr = now.toLocaleTimeString('id-ID', { hour12: false });
    const dateStr = now.toISOString().slice(0, 10);
    const summary = changedFiles.slice(0, 3).join(', ') + (changedFiles.length > 3 ? ` (+${changedFiles.length - 3} lainnya)` : '');

    console.log(`\n[${timeStr}] Perubahan terdeteksi (${changedFiles.length} file): ${summary}`);
    console.log(`[${timeStr}] Melakukan 'git add -A'...`);
    await runCommand('git', ['add', '-A'], rootDir);

    const commitMsg = `Auto-sync: update ${summary} (${dateStr} ${timeStr})`;
    console.log(`[${timeStr}] Melakukan 'git commit'...`);
    await runCommand('git', ['commit', '-m', `"${commitMsg.replace(/"/g, '\\"')}"`], rootDir);

    console.log(`[${timeStr}] Melakukan 'git push origin main'...`);
    await runCommand('git', ['push', 'origin', 'main'], rootDir);

    console.log(`[${timeStr}] ✅ Berhasil disinkronkan ke GitHub: https://github.com/sachrulramadhan/bintang-kecil\n`);
  } catch (err) {
    console.error(`[Auto-Sync Error] Gagal melakukan sinkronisasi:`, err.message);
  } finally {
    isSyncing = false;
    if (pendingSync) {
      setTimeout(doSync, 1000);
    }
  }
}

function shouldIgnore(relPath) {
  return IGNORE_PATTERNS.some((pattern) => pattern.test(relPath));
}

console.log('='.repeat(60));
console.log('  AUTO-SYNC GITHUB - BINTANG KECIL');
console.log('  Memantau folder:', rootDir);
console.log('  Remote:', 'https://github.com/sachrulramadhan/bintang-kecil');
console.log('  Setiap kali file diubah/ditambah/dihapus,');
console.log('  akan otomatis di-commit & di-push ke GitHub.');
console.log('='.repeat(60));
console.log('Menunggu perubahan file... (Tekan Ctrl + C untuk berhenti)\n');

// Trigger sync awal jika sudah ada perubahan yang belum di-commit
doSync();

fs.watch(rootDir, { recursive: true }, (eventType, filename) => {
  if (!filename) return;
  const normalized = filename.replace(/\\/g, '/');
  if (shouldIgnore(normalized)) return;

  if (syncTimeout) {
    clearTimeout(syncTimeout);
  }

  syncTimeout = setTimeout(() => {
    doSync();
  }, DEBOUNCE_MS);
});
