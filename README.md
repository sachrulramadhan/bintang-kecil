# Bintang Kecil - Belajar Bersama Bimo

Aplikasi edukasi anak (usia 2-12 tahun) berbasis React + Vite + Tailwind. Seluruh data tersimpan di peramban (localStorage), sehingga tidak membutuhkan server atau API key.

## Menjalankan di komputer
```bash
npm install
npm run dev      # http://localhost:3000
npm run lint     # cek tipe TypeScript
npm run build    # hasil di folder dist/
```

## CMS Admin Master (Cloudflare Workers + D1)

CMS admin diakses melalui `/admin`. Autentikasi staff dan konten CMS disimpan di D1, terpisah dari akun orang tua aplikasi belajar yang masih tersimpan di browser. Pustaka media saat ini menerima URL eksternal; belum ada upload file.

### Setup lokal
Pastikan Wrangler sudah terautentikasi (`npx wrangler login`), lalu jalankan:
```bash
npm run build
npm run cms:migrate:local
npm run cms:dev
```
Buka alamat Wrangler yang ditampilkan (biasanya `http://localhost:8787/admin`). Untuk mereset database lokal setelah pengujian, gunakan perintah Wrangler D1 lokal yang sesuai; jangan menjalankan perintah reset pada database remote.

### Setup Cloudflare pertama kali
Konfigurasi ini memakai Cloudflare Worker Static Assets, bukan Cloudflare Pages.
1. Buat secret acak minimal 32 karakter dan simpan di password manager. Set secret tanpa menaruh nilainya di source code:
   ```bash
   npx wrangler secret put CMS_SETUP_TOKEN
   ```
2. Terapkan schema dan data awal ke D1:
   ```bash
   npm run cms:migrate:remote
   ```
3. Build dan deploy Worker:
   ```bash
   npm run build
   npx wrangler deploy
   ```
4. Buka `/admin` pada alamat Worker, masukkan `CMS_SETUP_TOKEN`, lalu buat akun Admin Master dengan kata sandi minimal 12 karakter. Setup hanya dapat dilakukan sekali; simpan kredensial admin dengan aman.
5. Buat akun staff dari menu **Manajemen akun**. Tautan aktivasi berlaku 48 jam dan hanya dapat dipakai sekali.

Perubahan schema selanjutnya harus ditambahkan sebagai migration SQL bernomor baru di `migrations/`, lalu diterapkan menggunakan `npm run cms:migrate:remote` sebelum deploy kode yang memerlukannya.

## Deploy ke Cloudflare

**Opsi A - Pages dari GitHub (aplikasi belajar saja)**
1. Unggah folder ini ke repositori GitHub.
2. Cloudflare Dashboard -> Workers & Pages -> Create -> Pages -> Connect to Git.
3. Build command: `npm run build` - Build output directory: `dist` - Node version: 20 atau lebih baru.

Penerapan Pages tidak menyediakan Worker API/D1 CMS yang dikonfigurasi di `wrangler.jsonc`. Gunakan deploy Workers Static Assets di bawah untuk aplikasi lengkap dengan CMS.

**Opsi B - Pages manual (aplikasi belajar saja)**
```bash
npm run build
npx wrangler pages deploy dist --project-name bintang-kecil
```

**Opsi C - Workers Static Assets (aplikasi belajar + CMS)** (memakai `wrangler.jsonc`)
```bash
npm run build && npx wrangler deploy
```

Catatan: `public/_headers` mengatur header keamanan dan cache. Aplikasi tidak memakai URL routing, jadi tidak perlu `_redirects`.

## Aset Bimo
Ilustrasi ada di `public/bimo/` (WebP transparan): `face-*.webp` (10 ekspresi) dan `body-*.webp` (depan, tiga perempat, samping, belakang). Komponen `src/components/BimoMascot.tsx` memetakan ekspresi ke file. Untuk menambah ekspresi, tambahkan file baru lalu daftarkan di `FACE_FILE`.

## Penting sebelum rilis publik
- Akun dan PIN orang tua saat ini disimpan di peramban (hash SHA-256 + salt statis). Ini cukup untuk satu perangkat, **bukan** autentikasi sungguhan. Untuk sinkron antarperangkat, tambahkan backend (mis. Cloudflare D1/Workers) dengan autentikasi server.
- Tombol logout kembali ke halaman pendaftaran tanpa menghapus data lokal. Gunakan PIN orang tua untuk melanjutkan kembali ke profil yang tersimpan.
- Dari halaman logout, pilih "Daftar akun orang tua baru" untuk membuat akun lain di perangkat yang sama. Akun lama dan progresnya tetap tersimpan; gunakan email dan PIN akun tersebut untuk membukanya kembali.
- Suara memakai Web Speech API bawaan peramban; kualitas berbeda tiap perangkat. Untuk suara natural, ganti dengan file MP3 (lihat `src/core/audio.ts`).
- Data Misi Harian di beranda masih contoh statis.
