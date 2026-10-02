# Bintang Kecil - Belajar Bersama Bimo

Aplikasi edukasi anak (usia 2-12 tahun) berbasis React + Vite + Tailwind. Seluruh data tersimpan di peramban (localStorage), sehingga tidak membutuhkan server atau API key.

## Menjalankan di komputer
```bash
npm install
npm run dev      # http://localhost:3000
npm run lint     # cek tipe TypeScript
npm run build    # hasil di folder dist/
```

## Deploy ke Cloudflare

**Opsi A - Pages dari GitHub (paling mudah)**
1. Unggah folder ini ke repositori GitHub.
2. Cloudflare Dashboard -> Workers & Pages -> Create -> Pages -> Connect to Git.
3. Build command: `npm run build` - Build output directory: `dist` - Node version: 20 atau lebih baru.

**Opsi B - Unggah langsung**
```bash
npm run build
npx wrangler pages deploy dist --project-name bintang-kecil
```

**Opsi C - Workers Static Assets** (memakai `wrangler.jsonc`)
```bash
npm run build && npx wrangler deploy
```

Catatan: `public/_headers` mengatur header keamanan dan cache. Aplikasi tidak memakai URL routing, jadi tidak perlu `_redirects`.

## Aset Bimo
Ilustrasi ada di `public/bimo/` (WebP transparan): `face-*.webp` (10 ekspresi) dan `body-*.webp` (depan, tiga perempat, samping, belakang). Komponen `src/components/BimoMascot.tsx` memetakan ekspresi ke file. Untuk menambah ekspresi, tambahkan file baru lalu daftarkan di `FACE_FILE`.

## Penting sebelum rilis publik
- Akun dan PIN orang tua saat ini disimpan di peramban (hash SHA-256 + salt statis). Ini cukup untuk satu perangkat, **bukan** autentikasi sungguhan. Untuk sinkron antarperangkat, tambahkan backend (mis. Cloudflare D1/Workers) dengan autentikasi server.
- Suara memakai Web Speech API bawaan peramban; kualitas berbeda tiap perangkat. Untuk suara natural, ganti dengan file MP3 (lihat `src/core/audio.ts`).
- Data Misi Harian di beranda masih contoh statis.
