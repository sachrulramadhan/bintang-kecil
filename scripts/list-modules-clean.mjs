import fs from 'fs';

const content = fs.readFileSync('C:/Users/dinke/Downloads/bintang-kecil-github-public-sync/src/data/modules/index.ts', 'utf8');

// Match each module object
const regex = /\{\s*id:\s*"([a-z0-9-]+)",\s*category:\s*"([a-z0-9-]+)"[\s\S]*?ageRange:\s*"([^"]+)"[\s\S]*?title:\s*"([^"]+)"/g;
let match;
const found = [];
while ((match = regex.exec(content)) !== null) {
  found.push({ id: match[1], category: match[2], age: match[3], title: match[4] });
}
console.log('Real modules count:', found.length);
found.forEach(m => console.log(`${m.id.padEnd(16)} | ${m.category.padEnd(14)} | ${m.age.padEnd(6)} | ${m.title}`));
