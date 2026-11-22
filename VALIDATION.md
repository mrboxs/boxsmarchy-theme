# Validasi Boxsmarchy

23 November 2026. Omarchy 4.5.0-3, Hyprland Lua, monitor 1366 × 768 pada scale 1.
Mode antislop: DURING, dipilih pengguna untuk sesi ini.

## Hasil teknis

- PASS: theme aktif dilaporkan sebagai `Boxsmarchy` oleh `omarchy theme current`.
- PASS: `hyprctl reload` sukses dan `hyprctl configerrors` kosong.
- PASS: `omarchy shell shell ping` menjawab `ok`.
- PASS: seluruh TOML theme dan hasil generator diparse; JSON VS Code valid tanpa key duplikat.
- PASS: tidak ada placeholder template tersisa pada config terminal, btop, browser, atau Hyprland.
- PASS: `bash -n` untuk kedua script dan `luac -p neovim.lua`.
- PASS: `git diff --check`.
- PASS: Neovim dengan config LazyVim pengguna start memakai `onedark`.
- PASS: 15 group Neovim diperiksa langsung, mencakup syntax, selection, popup, Tree-sitter, dan diagnostic.
- PASS: plugin One Dark terpasang pada commit `df4792accde9db0043121f32628bcf8e645d9aea`.
- PASS: lockfile Lazy hanya menambah `onedark.nvim`; plugin lain tidak diubah atau dihapus.
- PASS: JSON extension VS Code lokal sama dengan `vscode-theme.json` repo setelah sinkronisasi selesai.
- PASS: file theme lokal sama dengan source repo, termasuk warna dan mapping editor.
- PASS: master SVG yang disertakan sama dengan file brandkit yang diunduh.
- PASS: PNG wallpaper 3840 × 2160, preview 960 × 540, unlock 640 × 139 dengan alpha, preview unlock 1920 × 1080.
- PASS: wallpaper dan preview unlock dirender lalu diperiksa secara visual.
- PASS: integrasi theme-set yang terpasang melaporkan 0 failed.

## Interaksi yang diperiksa

- Menu root: terbuka dengan panel graphite dan selection putih, seluruh isi muat di layar.
- Down: memindahkan selection ke Learn dengan teks hitam di bidang putih.
- Enter pada Learn: membuka submenu, dengan selection keyboard tetap terbaca.
- Escape: kembali/menutup menu; menu uji ditutup setelah pengecekan.
- App grid: terbuka, ikon dan nama aplikasi terbaca tanpa keluar dari panel.
- Pencarian `boxsmarchy-no-match`: menampilkan pesan tidak ada aplikasi yang cocok.
- Escape pertama: membersihkan pencarian; Escape berikutnya: menutup app grid.
- Desktop: wallpaper dan bar memakai warna baru; workspace dikembalikan ke 5 setelah pengujian.

Kontrol bawaan Omarchy tidak ditulis ulang. Pengujian berfokus pada permukaan
dan state yang diwarnai theme ini. Helix tidak terpasang, jadi config-nya
diverifikasi melalui parse TOML, referensi palette, dan pemeriksaan mapping.
VS Code diverifikasi melalui output extension lokal; GUI editornya tidak dibuka.
Boot unlock tidak dipasang ke initramfs; aset dan preview saja yang diuji.
App GTK yang sudah terbuka bisa perlu dibuka ulang untuk membaca warna baru.

## Kontras terukur

Rasio dihitung dengan luminance relatif sRGB, bukan perkiraan visual.

| Pasangan | Rasio |
| --- | --- |
| Teks utama `#fafafa` di panel `#171717` | 17.18:1 |
| Teks sekunder `#a1a1a1` di panel | 6.94:1 |
| Teks selection menu `#09090b` di `#e5e5e5` | 15.79:1 |
| Border fokus `#e5e5e5` di panel | 14.23:1 |
| Minimum syntax/comment di canvas `#09090b` | 5.66:1 |
| Minimum syntax/comment di panel `#171717` | 5.10:1 |
| Minimum syntax/comment di selection kode `#212121` | 4.58:1 |

Perhitungan syntax mencakup teks netral, comment, merah, oranye, kuning,
hijau, cyan, biru, dan ungu yang ditentukan theme. Rasio ini tidak menjadi
klaim kepatuhan menyeluruh untuk semua aplikasi/plugin pengguna.

## Delivery Gate

### Hard Gate

- R-02 PASS: teks yang ditulis untuk theme tidak mengandung em dash.
- R-03 PASS, scope desktop: menu dan app grid muat pada 1366 × 768; tidak ada halaman web/mobile baru.
- R-17 PASS: ukuran aset dan rasio kontras berasal dari pengukuran.
- R-18 PASS: tidak ada testimonial atau avatar buatan.
- R-23 PASS: logo berasal dari brandkit yang diberikan; wallpaper memakai geometri asli.
- R-24 PASS: tidak ada item navigasi baru atau tautan UI baru.
- R-25 PASS: pasangan teks utama, sekunder, syntax, dan selection yang ditentukan theme dihitung di atas.
- R-26 PASS: menu, submenu, search, dan penutupan overlay bekerja saat diuji.
- R-27 PASS: empty search app grid terbaca; theme tidak menambah alur data atau state loading/error baru.
- R-28 PASS: tidak ada FAQ.
- R-32 PASS: Down, Enter, dan Escape diuji; selection keyboard menggunakan pembalikan bidang yang jelas.
- R-33 PASS: fitur ditulis langsung di config theme; tidak ada patcher yang mengubah source/CSS app.
- R-34 PASS: mode yang dikirim hanya dark, ditentukan eksplisit di `colors.toml` dan theme editor.
- R-35 PASS: theme diterapkan dan diuji di session aktif; cakupan serta batas pengujian dicatat di atas.
- R-36 PASS: tidak ada klaim performa, keamanan, atau sertifikasi yang dibuat-buat.
- R-37 PASS: sumber arah desain dan alasan keputusan dicatat di `DESIGN.md`.
- R-38 PASS: semua aset memakai logo asli dan isi UI bawaan yang nyata.
- R-39 PASS, scope theme: tidak ada kontrol/semantik baru; kontras fokus diperiksa dan tanpa animasi tambahan.
- R-40 PASS, scope aset: PNG memiliki dimensi tetap; tidak ada dokumen web, script pihak ketiga, atau klaim Web Vitals.

### Purpose-Gate

- R-01 PASS: UI monokrom diambil dari web; warna tambahan khusus syntax dan status semantik.
- R-04 PASS: logo asli dan ikon Yaru dipakai sesuai fungsi identitas/file manager.
- R-06 PASS: font pengguna dipertahankan; wordmark memakai outline resmi brandkit.
- R-07 PASS: wallpaper tidak memakai grid atau pola dekoratif.
- R-08 PASS: tidak menambah panah pada kontrol.
- R-09 PASS: tidak menambah badge dekoratif.
- R-10 PASS: tidak menambah efek glass atau blur.
- R-12 PASS: tidak menambah bayangan dekoratif.
- R-13 PASS: tidak menambah glow.
- R-14 PASS: tidak membuat kartu fitur atau layout baru.
- R-19 PASS: tidak menambah animasi; transisi sistem pengguna dipertahankan.
- R-22 PASS: tidak menambah ilustrasi generik; simbol berasal dari brandkit.

### Liveliness

- Dials PASS: ENERGY 1 / RHYTHM 2 / MOTION 1 dicatat di `DESIGN.md`.
- Konsistensi PASS: kontras tenang, bidang netral, dan tanpa animasi tambahan cocok dengan dials.
- Focal point PASS: simbol putih tunggal menjadi fokus wallpaper.
- Whitespace PASS: ruang kosong menjaga logo terbaca dan tidak bersaing dengan jendela.
- Accent PASS: putih menandai selection/fokus; hue hanya membawa makna syntax/status.
- Motif PASS: kubus berlapis asli menjadi pengenal utama theme.
- Design Read PASS: arah web dark monokrom dan One Dark dinyatakan sebelum implementasi config.

### Craftsmanship dan Quality Locks

- C-1 PASS: alasan warna, font, spacing, wallpaper, dan motion dicatat di `DESIGN.md`.
- C-2 PASS: tidak ada kontrol baru yang kosong; kontrol representatif diuji langsung.
- C-3 PASS: semua file melayani theme, aset, pemasangan, atau dokumentasi.
- C-4 PASS, scope pengujian: dark UI dan empty search bekerja di monitor yang tersedia; batas editor dicatat.
- C-5 PASS: hasil verifikasi berasal dari command, screenshot inspeksi, atau perhitungan nyata.
- R-05 PASS: layout desktop bawaan dipertahankan; tidak ada template halaman baru.
- R-11 PASS: theme tidak mengubah geometry/radius desktop.
- R-15 PASS: dokumentasi memakai perintah instalasi yang konkret, tanpa CTA generik.
- R-16 PASS: tidak ada copy pemasaran atau klaim berlebihan.
- R-20 PASS: identitas monokrom dan logo asli mrboxs terlihat pada wallpaper dan shell.
- R-21 PASS: dark merupakan permintaan eksplisit pengguna.
- R-29 PASS: grayscale untuk UI, palet One Dark khusus kategori syntax/status.
- R-30 PASS: referensi visual adalah web milik pengguna yang diminta secara eksplisit.
- R-31 PASS: keputusan utama memiliki alasan tertulis di `DESIGN.md`.
