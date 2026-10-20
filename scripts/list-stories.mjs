import fs from 'fs';

const content = fs.readFileSync('C:/Users/dinke/Downloads/bintang-kecil-github-public-sync/src/data/stories.ts', 'utf8');

const regex = /id:\s*"([a-z0-9_]+)",\s*title:\s*"([^"]+)",\s*category:\s*"([^"]+)",\s*ageRange:\s*"([^"]+)"/g;
let match;
while ((match = regex.exec(content)) !== null) {
  console.log(`${match[1]} | ${match[3]} | ${match[4]} | ${match[2]}`);
}
