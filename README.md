## Identitas Proyek

- Nama: Nabil Zahid Rahman
- NPM: 2306203324
- Kelas: PBP-A
- Asdos: Fernando Valentino Sitinjak (NAN)
- Repositori: https://github.com/Chromss/techpicks

## Penjelasan Tugas 7

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

- [x] ** Membuat tiga tombol sederhana dengan ikon dan teks**
- Buat class `ItemHomepage` dengan atribut `name`, `icon`, dan `bgcolor` yang mengatur teks tombol, ikon, beserta warna latarnya.
- Agregasikan `ItemHomepage` ke `ItemCard`, yakni class yang mengatur struktur tombol secara keseluruhan beserta penempatannya pada widget.
- Lakukan casting ke `MyHomePage` untuk membuat tiga tombol yang sesuai. Tombol-tombol tersebut diperuntukkan pada melihat daftar produk, menambah produk, dan log out.

- [x] **Mengimplementasikan warna berbeda untuk setiap tombol**
- Dari atribut `bgcolor` yang ada, konfigurasikan pengaturan warna latar di method `build` di class `Widget`. Untuk hal itu, tambahkan line `color: item.bgcolor,` agar ketika objek di cast, kustomisasi warna latar dapat diimplementasikan.
- Lakukan casting ke `MyHomePage` dengan mencantumkan warna yang diinginkan menggunakan format RGBO `const Color.fromRGBO(r,g,b,o)`. Pastikan warna yang digunakan berbeda antara satu sama lain.

- [x] **Memunculkan snackbar**
- Pada blok `Widget build`, tambahkan Class `SnackBar` yang berguna menampilkan suatu pesan setelah ditekannya tombol. Agar dapat interaktif, atur event listener dengan menambahkan sintaks `onTap` yang me-wrap `SnackBar` tersebut. Lakukan kustomisasi tampilan `SnackBar` dengan mengatur konten dan warna latarnya.
- Atur pesan `SnackBar` sesuai tombol apa yang ditekan. Untuk penyesuaian tersebut, gunakan tag `${item.name}`.

## Penjelasan Tugas 8

### 1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Dalam sebuah proyek Flutter, `const` digunakan untuk mendeklarasikan objek yang nilainya tidak akan berubah setelah diciptakan. Penggunaan const memungkinkan Flutter untuk mengoptimalkan memori karena objek `const` dapat diaplikasikan di seluruh aplikasi. Selain itu, penggunaan `const` juga mengurangi kebutuhan alokasi memori baru sehingga aplikasi menjadi lebih efisien dan performa menjadi lebih cepat. Ini terjadi disebabkan Flutter dapat menghindari pembuatan ulang objek yang sudah ada.

Deklarasi `const` sebaiknya digunakan ketika objek yang dideklarasikan tidak akan berubah, seperti sebuah teks statis atau widget yang tidak dipengaruhi oleh state. Jika widget atau nilai objek bisa berubah, seperti saat menerima input pengguna atau hasil perhitungan, penggunaan `const` tidak tepat karena dapat menyebabkan error. Penggunaan const pada widget `Text` atau `TextFormField` lebih tepat saat nilai tidak berubah, tetapi jika widget tersebut bergantung pada state, lebih baik tidak menggunakan `const`.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget layout yang digunakan untuk mengatur posisi widget anak secara vertikal dan horizontal. `Column` digunakan untuk menata widget dalam satu kolom secara vertikal, membuatnya berguna saat elemen-elemen UI disusun satu di bawah yang lain. Sebagai contoh, pada kode `product_form.dart`, widget Column digunakan untuk menata beberapa elemen form, seperti `TextFormField` untuk nama, deskripsi, dan jumlah produk secara vertikal, memberikan tampilan yang terstruktur.

Selanjutnya, `Row` digunakan untuk mengatur widget dalam satu baris secara horizontal, seperti yang terlihat pada kode `MyHomePage` di `menu.dart`. Di dalam kode ini, `Row` digunakan untuk menata tiga elemen `InfoCard` secara berdampingan dimana `InfoCard` ini menampilkan informasi NPM, nama, dan kelas. Dengan pengaturan `mainAxisAlignment: MainAxisAlignment.spaceEvenly`, elemen-elemen ini tersebar secara merata di sepanjang sumbu horizontal. Layout ini sangat efektif untuk menampilkan informasi secara kompak dan terstruktur dalam satu baris seperti pada bagian header di halaman utama aplikasi TechPicks.

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form di `product_form.dart`, elemen input yang digunakan adalah `TextFormField` untuk menyediakan masukan pengguna dengan tiga atribut berikut: Nama produk, deskripsi, dan jumlah produk. Masing-masing `TextFormField` dilengkapi dengan validasi untuk memastikan data yang dimasukkan sesuai dengan format yang diinginkan. Misalnya, untuk nama produk, ada pengecekan panjang *minimal 5 karakter; Untuk jumlah produk, hanya bilangan bulat positif yang diterima. Setiap elemen input ini mengandung atribut penting seperti `validator` dan `onChanged` untuk mengontrol perubahan nilai yang dimasukkan pengguna.

Kemudian, ada berbagai elemen input lainnya, seperti `Checkbox`, `Radio`, atau `Switch`, yang bisa digunakan untuk pilihan atau pengaturan lebih lanjut. Namun, pada halaman form ini, ketiga contoh tersebut tidak digunakan. Elemen-elemen ini tidak dibutuhkan dalam kasus ini karena form hanya meminta teks dan angka sehingga pemilihan elemen input pada form ini sesuai dengan kebutuhan.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk memastikan konsistensi desain dalam aplikasi Flutter, tema global biasanya diatur menggunakan `ThemeData` pada root aplikasi. Tema ini mengontrol elemen UI, seperti warna latar belakang, font, dan tombol. Pada aplikasi TechPicks, tema dapat diatur dalam file `main.dart` menggunakan `ThemeData` untuk menyatukan elemen visual di seluruh aplikasi sehingga menciptakan tampilan yang konsisten. Namun, jika tema hanya terdiri dari satu warna yang dominan, penggunaan tema bisa disederhanakan dengan mengatur warna di widget tertentu, tanpa membutuhkan tema global yang kompleks.

Pada kode `product_form.dart`, tema aplikasi tidak diatur menggunakan `ThemeData`. Sebagai gantinya, warna untuk elemen UI, seperti `AppBar` dan `ElevatedButton`, disesuaikan langsung di dalam widget. Pengaturan tema sederhana ini bisa diimplementasikan jika aplikasi tidak memerlukan variasi warna atau font yang kompleks. Dengan memilih satu warna utama dan menerapkannya secara manual, tampilan aplikasi tetap konsisten.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi antarhalaman dapat dilakukan menggunakan widget `Navigator` yang mengelola tumpukan halaman (memiliki cara kerja yang serupa dengan `Stack`). Untuk beralih antarhalaman, kita dapat menggunakan metode seperti `Navigator.push` untuk menambahkan halaman baru ke tumpukan atau `Navigator.pop` untuk kembali ke halaman sebelumnya. Dalam aplikasi TechPicks, jika ada halaman untuk menambah produk, kita bisa menggunakan `Navigator.push` untuk berpindah ke halaman form.