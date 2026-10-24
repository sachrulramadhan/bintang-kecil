import fs from 'fs';

const content = fs.readFileSync('C:/Users/dinke/Downloads/bintang-kecil-github-public-sync/src/data/modules/index.ts', 'utf8');

// Count how many questions each module has
const lines = content.split('\n');
let currentModule = '';
let qCount = 0;
const results = {};

for (const line of lines) {
  const modMatch = line.match(/^\s*id:\s*["']([a-z]+-[0-9]-[0-9]-[0-9]+)["']/);
  if (modMatch) {
    if (currentModule) {
      results[currentModule] = qCount;
    }
    currentModule = modMatch[1];
    qCount = 0;
  }
  if (line.match(/^\s*id:\s*["'][a-zA-Z0-9_]+_q[0-9]+["']/) || line.match(/^\s*id:\s*["'][a-zA-Z0-9_]+_[0-9]+["']/)) {
    qCount++;
  }
}
if (currentModule) {
  results[currentModule] = qCount;
}

console.log(JSON.stringify(results, null, 2));
