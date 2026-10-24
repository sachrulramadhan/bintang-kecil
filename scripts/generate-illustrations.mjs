import fs from 'fs';
import path from 'path';

const outDir = 'C:/Users/dinke/Downloads/bintang-kecil-github-public-sync/public/illustrations';
if (!fs.existsSync(outDir)) {
  fs.mkdirSync(outDir, { recursive: true });
}

const illustrations = [
  {
    name: 'story-moral-01.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <defs>
    <linearGradient id="skyGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#BAE6FD"/>
      <stop offset="100%" stop-color="#E0F2FE"/>
    </linearGradient>
    <linearGradient id="grassGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#86EFAC"/>
      <stop offset="100%" stop-color="#22C55E"/>
    </linearGradient>
  </defs>
  <!-- Background -->
  <rect width="400" height="300" fill="url(#skyGrad)"/>
  <circle cx="340" cy="50" r="30" fill="#FDE047" opacity="0.9"/>
  <!-- Hills -->
  <ellipse cx="200" cy="330" rx="260" ry="110" fill="url(#grassGrad)"/>
  <!-- Basket with Strawberries -->
  <g transform="translate(190, 160)">
    <!-- Basket -->
    <path d="M20 50 Q60 110 100 50 L110 20 Q60 15 10 20 Z" fill="#D97706" stroke="#92400E" stroke-width="4"/>
    <path d="M10 20 Q60 -10 110 20" fill="none" stroke="#92400E" stroke-width="5"/>
    <!-- Strawberries -->
    <circle cx="45" cy="25" r="14" fill="#EF4444"/>
    <circle cx="70" cy="20" r="15" fill="#DC2626"/>
    <circle cx="90" cy="30" r="13" fill="#EF4444"/>
    <circle cx="55" cy="40" r="14" fill="#DC2626"/>
    <circle cx="80" cy="42" r="14" fill="#EF4444"/>
    <!-- Leaves -->
    <path d="M45 13 L43 8 L49 11 Z" fill="#22C55E"/>
    <path d="M70 7 L68 2 L74 5 Z" fill="#22C55E"/>
  </g>
  <!-- Bimo the Bunny -->
  <g transform="translate(60, 100)">
    <!-- Body -->
    <ellipse cx="65" cy="120" rx="35" ry="42" fill="#FFFFFF" stroke="#CBD5E1" stroke-width="3"/>
    <!-- Feet -->
    <ellipse cx="45" cy="160" rx="16" ry="10" fill="#FCE7F3" stroke="#F472B6" stroke-width="2"/>
    <ellipse cx="85" cy="160" rx="16" ry="10" fill="#FCE7F3" stroke="#F472B6" stroke-width="2"/>
    <!-- Head -->
    <circle cx="65" cy="70" r="36" fill="#FFFFFF" stroke="#CBD5E1" stroke-width="3"/>
    <!-- Ears -->
    <ellipse cx="50" cy="18" rx="10" ry="28" fill="#FFFFFF" stroke="#CBD5E1" stroke-width="3"/>
    <ellipse cx="50" cy="18" rx="6" ry="20" fill="#F472B6" opacity="0.6"/>
    <ellipse cx="80" cy="18" rx="10" ry="28" fill="#FFFFFF" stroke="#CBD5E1" stroke-width="3"/>
    <ellipse cx="80" cy="18" rx="6" ry="20" fill="#F472B6" opacity="0.6"/>
    <!-- Cheeks & Eyes -->
    <circle cx="52" cy="74" r="5" fill="#1E293B"/>
    <circle cx="78" cy="74" r="5" fill="#1E293B"/>
    <circle cx="46" cy="82" r="6" fill="#FDA4AF" opacity="0.8"/>
    <circle cx="84" cy="82" r="6" fill="#FDA4AF" opacity="0.8"/>
    <ellipse cx="65" cy="80" rx="4" ry="3" fill="#F43F5E"/>
    <!-- Smiling Mouth -->
    <path d="M60 85 Q65 92 70 85" fill="none" stroke="#1E293B" stroke-width="2.5" stroke-linecap="round"/>
    <!-- Holding one strawberry -->
    <circle cx="102" cy="115" r="12" fill="#EF4444"/>
    <path d="M102 104 L100 100 L104 102 Z" fill="#22C55E"/>
  </g>
</svg>`
  },
  {
    name: 'story-moral-02.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <defs>
    <linearGradient id="warmSky" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#FED7AA"/>
      <stop offset="100%" stop-color="#FFEDD5"/>
    </linearGradient>
  </defs>
  <rect width="400" height="300" fill="url(#warmSky)"/>
  <!-- Tree hollow / Cozy forest scene -->
  <path d="M-20 200 Q200 160 420 200 L420 320 L-20 320 Z" fill="#854D0E"/>
  <!-- Momo the Squirrel -->
  <g transform="translate(130, 80)">
    <!-- Big fluffy tail -->
    <path d="M30 110 C-30 60 -10 -10 40 20 C60 40 40 80 30 110 Z" fill="#EA580C" stroke="#9A3412" stroke-width="3"/>
    <!-- Body -->
    <ellipse cx="80" cy="110" rx="32" ry="40" fill="#EA580C"/>
    <ellipse cx="80" cy="115" rx="20" ry="28" fill="#FFEDD5"/>
    <!-- Head -->
    <circle cx="85" cy="65" r="28" fill="#EA580C"/>
    <!-- Ears -->
    <polygon points="70,45 76,20 85,42" fill="#EA580C"/>
    <polygon points="90,42 98,20 105,45" fill="#EA580C"/>
    <!-- Face -->
    <circle cx="80" cy="64" r="4" fill="#1E293B"/>
    <circle cx="98" cy="64" r="4" fill="#1E293B"/>
    <circle cx="89" cy="72" r="3.5" fill="#78350F"/>
    <!-- Smiling Mouth -->
    <path d="M85 77 Q89 83 93 77" fill="none" stroke="#1E293B" stroke-width="2" stroke-linecap="round"/>
    <!-- Steaming warm bread in hands -->
    <ellipse cx="90" cy="118" rx="22" ry="14" fill="#D97706" stroke="#78350F" stroke-width="2.5"/>
    <path d="M80 98 Q83 92 81 86" stroke="#FFFFFF" stroke-width="2.5" fill="none" stroke-linecap="round" opacity="0.8"/>
    <path d="M90 96 Q93 90 91 84" stroke="#FFFFFF" stroke-width="2.5" fill="none" stroke-linecap="round" opacity="0.8"/>
    <path d="M100 98 Q103 92 101 86" stroke="#FFFFFF" stroke-width="2.5" fill="none" stroke-linecap="round" opacity="0.8"/>
  </g>
  <!-- Little bird friend -->
  <g transform="translate(260, 140)">
    <circle cx="30" cy="30" r="18" fill="#38BDF8"/>
    <polygon points="12,30 2,33 12,36" fill="#F59E0B"/>
    <circle cx="22" cy="25" r="3" fill="#1E293B"/>
  </g>
</svg>`
  },
  {
    name: 'story-adv-01.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <rect width="400" height="300" fill="#E0F2FE"/>
  <!-- Rainbow -->
  <g transform="translate(200, 240)">
    <ellipse cx="0" cy="0" rx="190" ry="160" fill="none" stroke="#EF4444" stroke-width="12"/>
    <ellipse cx="0" cy="0" rx="178" ry="148" fill="none" stroke="#F97316" stroke-width="12"/>
    <ellipse cx="0" cy="0" rx="166" ry="136" fill="none" stroke="#FACC15" stroke-width="12"/>
    <ellipse cx="0" cy="0" rx="154" ry="124" fill="none" stroke="#22C55E" stroke-width="12"/>
    <ellipse cx="0" cy="0" rx="142" ry="112" fill="none" stroke="#3B82F6" stroke-width="12"/>
    <ellipse cx="0" cy="0" rx="130" ry="100" fill="none" stroke="#A855F7" stroke-width="12"/>
  </g>
  <!-- Clouds -->
  <circle cx="60" cy="220" r="35" fill="#FFFFFF"/>
  <circle cx="95" cy="210" r="40" fill="#FFFFFF"/>
  <circle cx="130" cy="225" r="30" fill="#FFFFFF"/>
  <circle cx="340" cy="220" r="35" fill="#FFFFFF"/>
  <circle cx="305" cy="210" r="40" fill="#FFFFFF"/>
  <!-- Magical Trees -->
  <polygon points="50,140 20,200 80,200" fill="#10B981"/>
  <polygon points="350,130 320,190 380,190" fill="#06B6D4"/>
  <!-- Ground -->
  <rect x="0" y="240" width="400" height="60" fill="#15803D"/>
  <circle cx="200" cy="210" r="22" fill="#FDE047"/>
  <text x="200" y="217" font-size="20" text-anchor="middle">✨</text>
</svg>`
  },
  {
    name: 'story-adv-02.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <!-- Deep Space -->
  <rect width="400" height="300" fill="#0F172A"/>
  <!-- Stars -->
  <circle cx="50" cy="40" r="2" fill="#FFFFFF"/>
  <circle cx="120" cy="70" r="3" fill="#FDE047"/>
  <circle cx="280" cy="30" r="2" fill="#FFFFFF"/>
  <circle cx="350" cy="80" r="3" fill="#FDE047"/>
  <circle cx="80" cy="180" r="2" fill="#FFFFFF"/>
  <circle cx="330" cy="220" r="2" fill="#FFFFFF"/>
  <!-- Moon Surface with Crystals -->
  <path d="M-20 230 Q200 190 420 230 L420 320 L-20 320 Z" fill="#475569"/>
  <polygon points="90,210 98,185 106,210" fill="#38BDF8" opacity="0.9"/>
  <polygon points="120,220 126,195 132,220" fill="#C084FC" opacity="0.9"/>
  <polygon points="280,215 288,190 296,215" fill="#34D399" opacity="0.9"/>
  <!-- Star Rocket -->
  <g transform="translate(180, 70) rotate(35)">
    <!-- Rocket Flame -->
    <polygon points="15,90 25,120 35,90" fill="#F97316"/>
    <polygon points="19,90 25,110 31,90" fill="#FDE047"/>
    <!-- Fins -->
    <polygon points="5,70 15,90 25,90" fill="#EF4444"/>
    <polygon points="45,70 35,90 25,90" fill="#EF4444"/>
    <!-- Body -->
    <path d="M15 40 Q25 5 35 40 L35 90 L15 90 Z" fill="#F8FAFC" stroke="#CBD5E1" stroke-width="2"/>
    <!-- Window -->
    <circle cx="25" cy="50" r="8" fill="#38BDF8" stroke="#0284C7" stroke-width="2"/>
    <!-- Bimo looking out -->
    <circle cx="25" cy="50" r="5" fill="#FFFFFF"/>
  </g>
</svg>`
  },
  {
    name: 'story-sci-01.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <!-- Sky -->
  <rect width="400" height="300" fill="#BAE6FD"/>
  <!-- Sun -->
  <circle cx="70" cy="60" r="28" fill="#FBBF24"/>
  <text x="70" y="67" font-size="22" text-anchor="middle">☀️</text>
  <!-- Water Evaporation arrows -->
  <path d="M120 220 Q125 170 130 130" stroke="#0284C7" stroke-width="3" stroke-dasharray="6,4" fill="none" stroke-linecap="round"/>
  <path d="M150 230 Q155 180 160 140" stroke="#0284C7" stroke-width="3" stroke-dasharray="6,4" fill="none" stroke-linecap="round"/>
  <!-- Cloud -->
  <g transform="translate(220, 60)">
    <circle cx="40" cy="40" r="30" fill="#64748B"/>
    <circle cx="70" cy="30" r="35" fill="#64748B"/>
    <circle cx="100" cy="40" r="28" fill="#64748B"/>
    <!-- Raindrops -->
    <line x1="45" y1="80" x2="40" y2="105" stroke="#38BDF8" stroke-width="3" stroke-linecap="round"/>
    <line x1="70" y1="80" x2="65" y2="110" stroke="#38BDF8" stroke-width="3" stroke-linecap="round"/>
    <line x1="95" y1="80" x2="90" y2="105" stroke="#38BDF8" stroke-width="3" stroke-linecap="round"/>
    <line x1="55" y1="110" x2="50" y2="135" stroke="#38BDF8" stroke-width="3" stroke-linecap="round"/>
    <line x1="80" y1="110" x2="75" y2="135" stroke="#38BDF8" stroke-width="3" stroke-linecap="round"/>
  </g>
  <!-- Mountain & Ocean -->
  <polygon points="160,150 240,240 80,240" fill="#15803D"/>
  <rect x="0" y="240" width="400" height="60" fill="#0284C7"/>
  <!-- River to Ocean -->
  <path d="M170 210 Q240 230 350 240" stroke="#38BDF8" stroke-width="12" fill="none"/>
</svg>`
  },
  {
    name: 'story-cul-01.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <!-- Sky -->
  <rect width="400" height="300" fill="#FEF08A"/>
  <!-- Hills -->
  <ellipse cx="200" cy="320" rx="260" ry="100" fill="#22C55E"/>
  <!-- Rumah Gadang Traditional House -->
  <g transform="translate(100, 80)">
    <!-- Curved Horn Roofs (Gonjong) -->
    <path d="M-20 60 Q50 10 100 60 Q150 10 220 60 L180 85 Q100 50 20 85 Z" fill="#991B1B" stroke="#7F1D1D" stroke-width="3"/>
    <!-- Horn Peaks -->
    <path d="M-20 60 Q-40 20 -30 10 Q-15 30 0 65" fill="#7F1D1D"/>
    <path d="M220 60 Q240 20 230 10 Q215 30 200 65" fill="#7F1D1D"/>
    <!-- House Wooden Body with Carvings -->
    <rect x="20" y="85" width="160" height="70" fill="#B45309" stroke="#78350F" stroke-width="3"/>
    <!-- Windows -->
    <rect x="35" y="95" width="22" height="25" fill="#FEF3C7" stroke="#78350F" stroke-width="2"/>
    <rect x="75" y="95" width="22" height="25" fill="#FEF3C7" stroke="#78350F" stroke-width="2"/>
    <rect x="115" y="95" width="22" height="25" fill="#FEF3C7" stroke="#78350F" stroke-width="2"/>
    <rect x="145" y="95" width="22" height="25" fill="#FEF3C7" stroke="#78350F" stroke-width="2"/>
    <!-- Wooden Pillars (Stilts) -->
    <line x1="30" y1="155" x2="30" y2="195" stroke="#78350F" stroke-width="6"/>
    <line x1="70" y1="155" x2="70" y2="195" stroke="#78350F" stroke-width="6"/>
    <line x1="130" y1="155" x2="130" y2="195" stroke="#78350F" stroke-width="6"/>
    <line x1="170" y1="155" x2="170" y2="195" stroke="#78350F" stroke-width="6"/>
  </g>
</svg>`
  },
  {
    name: 'math-numbers.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <rect width="400" height="300" rx="30" fill="#EFF6FF"/>
  <!-- Floating colorful number bubbles -->
  <circle cx="80" cy="80" r="38" fill="#3B82F6"/>
  <text x="80" y="95" font-size="42" font-weight="900" fill="#FFFFFF" text-anchor="middle" font-family="Arial, sans-serif">1</text>
  
  <circle cx="200" cy="70" r="42" fill="#10B981"/>
  <text x="200" y="87" font-size="46" font-weight="900" fill="#FFFFFF" text-anchor="middle" font-family="Arial, sans-serif">2</text>
  
  <circle cx="320" cy="90" r="38" fill="#F59E0B"/>
  <text x="320" y="105" font-size="42" font-weight="900" fill="#FFFFFF" text-anchor="middle" font-family="Arial, sans-serif">3</text>
  
  <circle cx="120" cy="200" r="44" fill="#EC4899"/>
  <text x="120" y="218" font-size="48" font-weight="900" fill="#FFFFFF" text-anchor="middle" font-family="Arial, sans-serif">4</text>
  
  <circle cx="280" cy="210" r="46" fill="#8B5CF6"/>
  <text x="280" y="228" font-size="50" font-weight="900" fill="#FFFFFF" text-anchor="middle" font-family="Arial, sans-serif">5</text>
  <!-- Happy Star in Center -->
  <text x="200" y="170" font-size="40" text-anchor="middle">⭐</text>
</svg>`
  },
  {
    name: 'math-shapes.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <rect width="400" height="300" rx="30" fill="#FFFBEB"/>
  <!-- Circle -->
  <circle cx="80" cy="150" r="50" fill="#EF4444" stroke="#DC2626" stroke-width="5"/>
  <text x="80" y="235" font-size="18" font-weight="bold" fill="#78350F" text-anchor="middle">Lingkaran</text>
  <!-- Triangle -->
  <polygon points="200,95 150,195 250,195" fill="#F59E0B" stroke="#D97706" stroke-width="5"/>
  <text x="200" y="235" font-size="18" font-weight="bold" fill="#78350F" text-anchor="middle">Segitiga</text>
  <!-- Square -->
  <rect x="275" y="100" width="95" height="95" rx="10" fill="#3B82F6" stroke="#2563EB" stroke-width="5"/>
  <text x="322" y="235" font-size="18" font-weight="bold" fill="#78350F" text-anchor="middle">Persegi</text>
</svg>`
  },
  {
    name: 'sci-solar-system.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <rect width="400" height="300" rx="30" fill="#0B132B"/>
  <!-- Sun -->
  <circle cx="30" cy="150" r="75" fill="#F59E0B"/>
  <circle cx="30" cy="150" r="65" fill="#FBBF24"/>
  <!-- Planet Orbits -->
  <circle cx="30" cy="150" r="110" fill="none" stroke="#334155" stroke-width="1.5" stroke-dasharray="4,4"/>
  <circle cx="30" cy="150" r="150" fill="none" stroke="#334155" stroke-width="1.5" stroke-dasharray="4,4"/>
  <circle cx="30" cy="150" r="195" fill="none" stroke="#334155" stroke-width="1.5" stroke-dasharray="4,4"/>
  <circle cx="30" cy="150" r="250" fill="none" stroke="#334155" stroke-width="1.5" stroke-dasharray="4,4"/>
  <circle cx="30" cy="150" r="310" fill="none" stroke="#334155" stroke-width="1.5" stroke-dasharray="4,4"/>
  <!-- Planets -->
  <circle cx="140" cy="150" r="8" fill="#94A3B8"/> <!-- Mercury -->
  <circle cx="180" cy="150" r="14" fill="#FCD34D"/> <!-- Venus -->
  <circle cx="225" cy="150" r="16" fill="#38BDF8"/> <!-- Earth -->
  <circle cx="280" cy="150" r="12" fill="#EF4444"/> <!-- Mars -->
  <!-- Jupiter -->
  <circle cx="340" cy="150" r="28" fill="#D97706"/>
</svg>`
  },
  {
    name: 'code-blocks.svg',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="100%">
  <rect width="400" height="300" rx="30" fill="#F0FDFA"/>
  <!-- Block 1: Right -->
  <rect x="60" y="50" width="280" height="55" rx="16" fill="#0EA5E9"/>
  <text x="100" y="86" font-size="22" font-weight="bold" fill="#FFFFFF">Maju ke Kanan ➡️</text>
  <!-- Block 2: Loop -->
  <rect x="60" y="120" width="280" height="55" rx="16" fill="#8B5CF6"/>
  <text x="100" y="156" font-size="22" font-weight="bold" fill="#FFFFFF">Ulangi 3x 🔁</text>
  <!-- Block 3: Jump -->
  <rect x="60" y="190" width="280" height="55" rx="16" fill="#10B981"/>
  <text x="100" y="226" font-size="22" font-weight="bold" fill="#FFFFFF">Melompat ke Atas ⬆️</text>
</svg>`
  }
];

for (const item of illustrations) {
  const filePath = path.join(outDir, item.name);
  fs.writeFileSync(filePath, item.svg, 'utf8');
  console.log('Created:', item.name);
}
