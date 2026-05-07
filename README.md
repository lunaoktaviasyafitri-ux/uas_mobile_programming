# Saku Mahasiswa - Tracker IPK Kumulatif

Aplikasi mobile berbasis flutter yang dirancang khusus untuk mahasiswa dalam mengelola dan memantau pencapaian akademik (IPK) dengan antarmuka yang modern, bersih, dan estetik.

---

## 🏗️ Blueprint & Rencana Kerja**
1. Aplikasi ini dirancang dengan prinsip Utility-First, di mana fungsi utama ditempatkan pada jangkauan satu klik, namun tetap memperhatikan aspek visual agar pengguna tidak bosan.

2. Target Pengguna: Mahasiswa tingkat diploma maupun sarjana.

3. Visi Produk: Menghilangkan kebingungan mahasiswa dalam menghitung sisa nilai yang dibutuhkan untuk mengejar predikat kelulusan tertentu.

4. Struktur Navigasi: Menggunakan navigasi tab per semester (1-8) yang terpusat pada satu dashboard utama.

## 🛠️ Tahapan Pengenbangan (Roadmap)**
1. Proses pengembangan aplikasi ini mengikuti siklus hidup perangkat lunak (SDLC) yang terukur:

2. Analisis & Desain: Penentuan palet warna Soft Blue (#89A8B2) dan perancangan UI menggunakan Material 3.

3. Pemrograman UI (Frontend): Implementasi widget Slifer untuk dinamis dan TabController untuk navigasi semester.

4. Integrasi Grafik: Implementasi visual data menggunakan library fl_chart.

5. Logika Kalkulasi: Pembuatan algoritma penghitungan IPK otomatis dan fitur simulasi target.

6. Finalisasi & Rilis: optimasi performa aplikasi, penamaan package unik, dan persiapan rilis ke Google Play Store.

## ✨ Fitur Utama
1. Dashboard IPK Real-Time: Menampilkan nilai kumulatif secara dominan di bagian atas layar.

2. Visualisasi Tren Nilai: Grafik garis interaktif untuk melihat naik-turunnya performa akademik antar semester.

3. Smart Simulation Banner: Fitur cerdas yang memberi tahu nilai rata-rata yang harus dicapai di semester depan untuk mendapatkan target IPK impian.

Menejemen Semester: Pemisahan data nilai yang rapi dari semester 1 hingga 8 tanpa tercampur.

5. Export Data: Shortcut ikon PDF yang disiapkan untuk mencetak atau menbagikan transkrip nilai sementara.

6. Input User-Friendly: Tombol tambah nilai yang ergonomis di pojok kana bawah.

## 🔄 Cara Kerja Aplikasi
1. Input Data: Pengguna memasukkan nilai mata kuliah melalui tombol "Tambah Nilai".

2. Pemrosesan: Sistem secara otomatis menghitung IPK malalui tombol "Tambah Nilai".

3. Visualisasi: Data yang diproses kemudian dipetakan ke dalam grafik  tren nilai agar pengguna dapat melihat progresnya secara visual.

4. Analisis Simulasi: Aplikasi membandingkan IPK saat ini dengan target yang diinginkan pengguna, lalu memberikan saran akademik di benner simulasi.

## 🚀 Teknologi yang Digunakan 
1. Framework: Flutter (versi terbaru dengan dukungan Material 3).

2.Bahasa Pemrograman: Dark.

3. State Manegement: StatefulWidget dengan TickerProvider (untuk animasi tab).

4. Visualisasi Data: fi_chart.

5. Font System: Google Fonts (Poppins).

6. UI Layout: NestedScrollView & Sliver Persistent Header (untuk efek scroll profesional).

## 📋 Cara Menjalankan Secara Lokal
1. Bagi pengembang yang ingin mencoba menjalankan kode ini secara lokal:

2. Pastikan Flutter SDK terinstal di sistem anda.

3. Jalankan Flutter pub get untuk mamasang semua library.

4. Hubungkan emulator Android atau perangkat fisik.

5. Jalankan perintah flutter run.

---

## Developer by: Luna Oktavia Syafitri

## Program Studi: Informatika (Semester 4)

## Lokasi: Pamekasan, Jawa Timur

## Status: Siap Rilis Ke Google Play Store 🚀