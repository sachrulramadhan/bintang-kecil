import fs from 'fs';

const content = fs.readFileSync('C:/Users/dinke/Downloads/bintang-kecil-github-public-sync/src/data/modules/index.ts', 'utf8');

// find all modules
const lines = content.split('\n');
let currentModule = null;
const modules = [];

for (const line of lines) {
  const idMatch = line.match(/^\s*id:\s*["']([^"']+)["']/);
  const catMatch = line.match(/^\s*category:\s*["']([^"']+)["']/);
  const titleMatch = line.match(/^\s*title:\s*["']([^"']+)["']/);
  const ageMatch = line.match(/^\s*ageRange:\s*["']([^"']+)["']/);
  
  if (idMatch && !line.includes('opt') && !line.includes('q') && !line.includes('step')) {
    currentModule = { id: idMatch[1] };
    modules.push(currentModule);
  }
  if (currentModule) {
    if (catMatch && !currentModule.category) currentModule.category = catMatch[1];
    if (titleMatch && !currentModule.title) currentModule.title = titleMatch[1];
    if (ageMatch && !currentModule.ageRange) currentModule.ageRange = ageMatch[1];
  }
}

console.log(`Found ${modules.length} modules:`);
for (const m of modules) {
  console.log(`${m.id} | ${m.category} | ${m.ageRange} | ${m.title}`);
}
