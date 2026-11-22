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
- PASS: wallpaper default WEBP lossless 3840 × 2160, alternatif PNG 3840 × 2160, preview 960 × 540, unlock 800 × 173 dengan alpha, preview unlock 1920 × 1080.
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
VS Code diverifikasi melalui output extension lokal dan instance GUI QA terpisah,
dengan TextMate serta semantic highlighting diuji secara terpisah.
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

## Pembaruan logo custom dan default aset

Permintaan pengguna: ganti O pada SVG Omarchy dengan simbol mrboxs, gunakan
warna theme, lalu pakai hasilnya untuk wallpaper dan aset unlock/preview default.

- PASS: O asli dihapus; keenam path MARCHY memiliki atribut path yang sama persis dengan SVG referensi.
- PASS: kelima path simbol mrboxs sama persis dengan master brandkit, hanya diberi transform translasi dan skala seragam.
- PASS: `logo.svg` memuat 11 path, satu warna `#e5e5e5`, tanpa font hidup, raster, filter, script, atau referensi eksternal.
- PASS: jarak simbol ke M adalah 60 unit, melebihi seperempat lebar simbol yang sekitar 211.45 unit.
- PASS: wallpaper baru memakai canvas 3840 × 2160 dan artwork selebar 1600 px, mengikuti lebar referensi.
- PASS: bounding box artwork baru `(1120, 907, 2720, 1253)` terpusat dalam toleransi 1 px.
- PASS: background `#09090b` dan warna logo `#e5e5e5` cocok dengan palette; kontras logo/canvas 15.79:1.
- PASS: PNG 4K dan WEBP lossless memiliki pixel RGB yang identik.
- PASS: `preview.png` 960 × 540, `unlock.png` 800 × 173 dengan alpha 0 sampai 255, dan `preview-unlock.png` 1920 × 1080.
- PASS: wallpaper, preview unlock, dan logo pada ukuran 960, 320, 184, serta 160 px dirender untuk inspeksi; rekomendasi minimum wordmark lengkap adalah lebar 184 px.
- PASS: salinan SVG dan WEBP referensi identik dengan attachment yang diberikan pengguna.
- PASS: installer menyertakan master logo dan kedua wallpaper; `00-boxsmarchy-dark.webp` adalah file pertama dalam urutan default.
- PASS: wallpaper baru dipilih melalui `omarchy theme bg set`; symlink background aktif menunjuk ke file baru.
- PASS: logo, preview, unlock, dan wallpaper di theme terpasang/current identik dengan source repo.
- PASS: `bash -n`, `git diff --check`, shell ping, dan pemeriksaan error config Hyprland lulus.

Audit SVG tidak menghasilkan FAIL. Peringatan sudut yang mendekati 150 derajat
berasal dari geometri simbol asli dan sengaja dipertahankan. Audit juga
mencatat viewBox pecahan, presisi transform, dan bentuk wordmark yang lebar;
simbol terpisah untuk ukuran kecil tetap tersedia di `assets/brand/`.

Delivery Gate pembaruan aset: PASS. Cakupan R-23/R-37 adalah modifikasi yang
diminta eksplisit dengan dua referensi pengguna; R-25 memakai rasio terukur;
R-35 memakai hasil render dan penerapan wallpaper; R-40 memakai dimensi
ekspor tetap. Tidak ada kontrol, motion, geometry desktop, atau syntax yang
diubah pada pembaruan ini. Konfigurasi boot/initramfs tetap tidak disentuh.

## Pembaruan fokus dan bold token

- PASS: fokus aktif list/tree VS Code memakai background `#e5e5e5`, teks `#09090b`, dan highlight pencarian `#09090b`.
- PASS: rasio teks/highlight pada fokus berubah dari pasangan bermasalah 1.31:1 menjadi 15.79:1.
- PASS: fokus + selection aktif, Quick Input, dan match autocomplete masing-masing 15.79:1.
- PASS: match biru pada hover gelap tetap 6.40:1; teks selection tidak aktif tetap 12.10:1.
- PASS: aturan bold ada pada TextMate dan semantic tokens VS Code, termasuk modifier `function.defaultLibrary`.
- PASS: Helix memiliki modifier bold pada keyword/operator, fungsi, constructor, tipe, namespace, dan tag; variabel, nilai constant, angka, string, serta comment tidak diberi bold.
- PASS: Neovim diuji melalui highlight API saat colorscheme dimuat, mencakup syntax klasik, Tree-sitter, dan LSP. Group struktural bold, sementara teks normal dan token nilai tetap regular.
- PASS: font terminal yang tersedia mencakup `JetBrainsMonoNerdFont-Bold.ttf`, tanpa mengubah pengaturan font global.
- PASS: instance VS Code QA memuat theme dari salinan source dengan user-data dan extensions directory sementara, terpisah dari konfigurasi pribadi pengguna.
- PASS: mode TextMate diuji dengan semantic highlighting nonaktif; `export`, `interface`, `function`, `greet`, dan `Theme` memiliki computed font-weight setidaknya 600.
- PASS: mode semantic diuji setelah provider TypeScript aktif, dikonfirmasi lewat warna semantic readonly pada `count`; token struktural tetap bold dan angka/string/comment tetap regular.
- PASS: shortcut Explorer membuka list; baris fokus memiliki computed background `rgb(229, 229, 229)` dan foreground `rgb(9, 9, 11)`.
- PASS: Command Palette dibuka dan dicari dengan `Preferences`; teks match di baris fokus berwarna `rgb(9, 9, 11)` pada background `rgb(229, 229, 229)`.
- PASS: Escape menutup palette; instance QA ditutup setelah uji dan fokus kembali ke jendela T3 semula.
- PASS: tampilan kode dan fokus diperiksa dari screenshot instance QA.

Aturan ini mengikuti [TextMate/semantic token VS Code](https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide),
[state list/tree VS Code](https://code.visualstudio.com/api/references/theme-color#lists-and-trees),
[modifier Helix](https://docs.helix-editor.com/themes.html), dan
[code style One Dark Neovim](https://github.com/navarasu/onedark.nvim#default-configuration).
Helix tetap divalidasi melalui config karena binary-nya tidak terpasang.
Palet ANSI terminal hanya membawa warna; bobot token di aplikasi CLI lain
tetap mengikuti style yang diminta aplikasi tersebut.

Delivery Gate pembaruan editor: PASS untuk kontras dan scope visual R-25,
keyboard/fokus R-32, runtime/GUI R-35, serta alasan hierarki tipografi R-06/R-31.
Tidak ada perubahan layout, kontrol, wallpaper, ataupun motion pada pembaruan ini.

## Delivery Gate

### Hard Gate

- R-02 PASS: teks yang ditulis untuk theme tidak mengandung em dash.
- R-03 PASS, scope desktop: menu dan app grid muat pada 1366 × 768; tidak ada halaman web/mobile baru.
- R-17 PASS: ukuran aset dan rasio kontras berasal dari pengukuran.
- R-18 PASS: tidak ada testimonial atau avatar buatan.
- R-23 PASS: logo memakai SVG Omarchy dan brandkit yang diberikan pengguna, dengan penggantian O yang diminta eksplisit.
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
- R-06 PASS: font pengguna dipertahankan; wordmark custom memakai outline Omarchy yang diberikan pengguna.
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
- Focal point PASS: wordmark custom tunggal menjadi fokus wallpaper default; simbol tunggal tetap tersedia sebagai alternatif.
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
