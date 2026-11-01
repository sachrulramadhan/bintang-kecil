# Bintang Kecil - Belajar Bersama Bimo

Aplikasi edukasi anak (usia 2-12 tahun) berbasis React + Vite + Tailwind. Akun orang tua/staff, profil anak, dan progres belajar disimpan di Cloudflare D1 dengan cache lokal (localStorage) di peramban. Karena itu halaman utama harus dijalankan lewat `npm run cms:dev` (bukan `npm run dev` saja) agar login dan sinkronisasi berfungsi.

## Menjalankan di komputer
```bash
npm install
npm run dev      # http://localhost:3000
npm run lint     # cek tipe TypeScript
npm run build    # hasil di folder dist/
npm run sync     # auto-sync perubahan langsung ke GitHub
```

## Sinkronisasi Otomatis ke GitHub
Setiap perubahan file dapat langsung disinkronkan ke GitHub secara otomatis:
- Klik ganda file `start-auto-sync.bat`, ATAU
- Jalankan `npm run sync` (atau `node scripts/auto-sync.js`) di terminal.
Watcher akan memantau folder dan otomatis melakukan commit & push ke GitHub dalam hitungan detik setelah file disimpan.

## CMS Admin Master (Cloudflare Workers + D1)

CMS admin diakses melalui `/admin`. Autentikasi staff, akun orang tua, dan konten CMS disimpan di D1. Halaman utama hanya menampilkan login username + kata sandi; pendaftaran akun orang tua hanya dilakukan admin lewat CMS. Pustaka media saat ini menerima URL eksternal; belum ada upload file.

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
6. Untuk orang tua, buka **Manajemen akun** -> **Tambah akun**, pilih role **Orang Tua**, lalu isi username dan kata sandi awal (minimal 12 karakter). Akun langsung aktif dan dapat dipakai login di halaman utama. Setelah login pertama, orang tua membuat profil anaknya sendiri.

Perubahan schema selanjutnya harus ditambahkan sebagai migration SQL bernomor baru di `migrations/`, lalu diterapkan menggunakan `npm run cms:migrate:remote` sebelum deploy kode yang memerlukannya.

## Sinkronisasi data anak (D1)

Profil anak, progres modul, attempt, dan mastery disinkronkan ke tabel D1 pada migration `0002_child_data.sql`:
- Saat login (atau sesi dipulihkan), aplikasi memuat data anak milik akun dari `/api/app/data` dan menyimpannya sebagai cache lokal.
- Setiap perubahan lokal (profil, progres, attempt, mastery, hapus anak) dikirim otomatis ke server setelah jeda singkat, saat logout, dan saat halaman ditutup.
- Perangkat lain melihat data terbaru ketika login/refresh. Tidak ada pembaruan real-time antarperangkat, dan data lokal yang belum sempat terkirim bisa tertimpa oleh data server saat login berikutnya.
- Data anak selalu dibatasi pada akun orang tua yang sedang login; endpoint `/api/app/*` menolak akses tanpa sesi atau ke anak milik akun lain.

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
- Login orang tua diverifikasi server memakai akun D1 dan cookie sesi HttpOnly. Profil anak dan progres belajar kini tersinkron lewat D1, sedangkan PIN gerbang orang tua dan pengaturan suara ElevenLabs masih tersimpan di perangkat masing-masing.
- Tombol logout mengakhiri sesi server dan kembali ke halaman login. Tidak ada pendaftaran di halaman utama; akun baru harus dibuat admin lewat `/admin`.
- Suara memakai Web Speech API bawaan peramban; kualitas berbeda tiap perangkat. Untuk suara natural, ganti dengan file MP3 (lihat `src/core/audio.ts`).
- Data Misi Harian di beranda masih contoh statis.
