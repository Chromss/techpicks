## Identitas Proyek

- Nama: Nabil Zahid Rahman
- NPM: 2306203324
- Kelas: PBP-A
- Asdos: Fernando Valentino Sitinjak (NAN)
- Repositori: https://github.com/Chromss/techpicks

## Tugas 7 Checkpoint

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah jenis widget pada framework Flutter yang tidak memiliki keadaan yang berubah selama menampilkan projek dalam suatu peramban web. Widget ini hanya dibangun sekali dan tidak akan diperbarui sampai parent widget yang memuatnya berubah. Contoh penggunaan stateless widget termasuk teks statis, gambar, dan elemen UI lainnya yang tidak memerlukan interaksi pengguna atau perubahan data apapun.

Stateful widget, di sisi lain, adalah widget yang memiliki keadaan yang dapat berubah. Stateful widget dapat menyimpan dan mengelola state internal yang memungkinkan tampilan widget diperbarui secara dinamis saat data berubah. Perbedaan utama antara keduanya terletak pada kemampuan stateful widget untuk merespons perubahan dan memperbarui tampilannya, sedangkan stateless widget tidak memiliki kemampuan tersebut.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Pada proyek ini, terdapat beberapa widget yang digunakan, yaitu `Text`, `Container`, `Column`, dan `Row`. Widget `Text` digunakan untuk menampilkan teks pada layar dengan kustomisasi `style` yang bertujuan dalam menyampaikan kumpulan informasi; `Container` digunakan untuk mengatur layout dan memberikan `padding`, `margin`, atau warna latar belakang pada elemen; `Column` dan `Row` digunakan untuk mengatur tata letak widget dalam arah vertikal dan horizontal sehingga elemen-elemen yang ada tersusun dengan baik.

### 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi dari `setState()` dalam Flutter adalah memberi tahu framework bahwa ada perubahan pada state yang perlu diperbarui di sisi User Interface. Ketika `setState()` dipanggil, Flutter akan menjadwalkan rebuild dari widget yang menggunakan state tersebut sehingga perubahan yang dilakukan dapat dilihat pengguna. Selain itu, `SetState()` bersifat krusial untuk stateful widget yang menjaga tampilan dan interaksi pengguna tetap responsif terhadap perubahan data.

Variabel yang dapat terdampak oleh fungsi `setState()` biasanya adalah variabel yang dideklarasikan di dalam kelas stateful widget tersebut. Jika `setState()` dipanggil, semua variabel yang terkait dengan tampilan yang tergantung pada state tersebut akan diperbarui. Ini berarti bahwa jika ada variabel yang menyimpan informasi yang diubah, tampilan akan diatur untuk menampilkan perubahan tersebut.

### 4. Jelaskan perbedaan antara `const` dengan `final`.
Perbedaan antara `const` dengan `final` dalam Dart terletak pada bagaimana nilai variabel tersebut ditetapkan dan diubah. Variabel yang dideklarasikan dengan `final` hanya dapat diinisialisasi satu kali dan nilainya tidak dapat diubah setelah itu. Namun, `final` tidak memaksa nilai untuk ditentukan pada waktu kompilasi sehingga dapat ditetapkan di waktu runtime dengan catatan hanya diinisiasi sekali.

Sementara itu, variabel yang dideklarasikan dengan `const` memiliki nilai yang harus ditetapkan pada waktu kompilasi dan tidak dapat diubah. `Const` juga memastikan bahwa nilai tersebut benar-benar konstan dan tidak dapat diubah di sisi mana pun dalam program. Dengan demikian, penggunaan `const` dan `final` bergantung pada kebutuhan aplikasi untuk mengelola suatu variabel.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
- [x] **Membuat sebuah program Flutter baru**
- Pada projek Flutter ini, Saya memberi nama aplikasi e-commerce "TechPicks". Untuk memulai, pada direktori yang sudah ditentukan, buat program Flutter dengan command `flutter create techpicks` pada terminal.
- Direktori `techpicks` terbuat beserta subdirektori-subdirektori di dalamnya yang merupakan built-in dari Flutter.

**2. Membuat tiga tombol sederhana dengan ikon dan teks**
- Buat class `ItemHomepage` dengan atribut `name`, `icon`, dan `bgcolor` yang mengatur teks tombol, ikon, beserta warna latarnya.
- Agregasikan `ItemHomepage` ke `ItemCard`, yakni class yang mengatur struktur tombol secara keseluruhan beserta penempatannya pada widget.
- Lakukan casting ke `MyHomePage` untuk membuat tiga tombol yang sesuai. Tombol-tombol tersebut diperuntukkan pada melihat daftar produk, menambah produk, dan log out.

**3. Mengimplementasikan warna berbeda untuk setiap tombol**
- Dari atribut `bgcolor` yang ada, konfigurasikan pengaturan warna latar di method `build` di class `Widget`. Untuk hal itu, tambahkan line `color: item.bgcolor,` agar ketika objek di cast, kustomisasi warna latar dapat diimplementasikan.
- Lakukan casting ke `MyHomePage` dengan mencantumkan warna yang diinginkan menggunakan format RGBO `const Color.fromRGBO(r,g,b,o)`. Pastikan warna yang digunakan berbeda antara satu sama lain.

**4. Memunculkan snackbar**
- Pada blok `Widget build`, tambahkan Class `SnackBar` yang berguna menampilkan suatu pesan setelah ditekannya tombol. Agar dapat interaktif, atur event listener dengan menambahkan sintaks `onTap` yang me-wrap `SnackBar` tersebut. Lakukan kustomisasi tampilan `SnackBar` dengan mengatur konten dan warna latarnya.
- Atur pesan `SnackBar` sesuai tombol apa yang ditekan. Untuk penyesuaian tersebut, gunakan tag `${item.name}`.