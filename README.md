# PalgopGamepass 🏪

## Link Deployment -> 


## Tugas 8 PBP 2024/2025 🧑‍💻🔗

### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Dalam Flutter, `const` digunakan untuk mendefinisikan objek yang tetap konstan selama aplikasi berjalan. Artinya, objek `const` tidak perlu dibuat ulang setiap kali Flutter melakukan proses build. Manfaat utama penggunaan `const` adalah peningkatan kinerja aplikasi dan pengurangan penggunaan memori, karena objek `const` hanya dibuat sekali dan dipertahankan selama aplikasi berjalan. Penggunaan `const` sangat ideal untuk widget yang bersifat statis, tidak berubah selama aplikasi berjalan, sering digunakan berulang kali, atau untuk nilai-nilai konstanta. Namun, `const` sebaiknya dihindari untuk widget yang bersifat dinamis, yaitu widget yang memiliki properti yang dapat berubah seiring berjalannya aplikasi.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`column` digunakan untuk menyusun widget secara vertikal dari atas ke bawah. Sesuai namanya `column` akan mengatur objek sehingga berbentuk sebuah kolom. Sedangkan `Row`, digunakan untuk menyusun widget secara horizontal sehingga objek atau widget berbentuk baris.

Contoh penggunaan `Column`:
```
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh Column')),
        body: Column(
          children: const [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
          ],
        ),
      ),
```
Kode di atas meletakan Text dibuat secara Column dimana item 1 terletak paling atas dan item 3 terletak paling bawah

Contoh penggunaan `Row`:
```
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh Row')),
        body: Row(
          children: const [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
          ],
        ),
      ),
```
Kode di atas meletakan item 1 di posisi paling kiri dan item 3 diletakan pada posisi paling kanan.

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang saya gunakan pada halaman form saya adalah `TextFormField` dimana user akan memberikan sebuah input berbentuk text yang bisa berupa string maupun integer. Lalu elemen input lain yang saya gunakana adalah `ElevatedButton` yang berfungsi mengirimkan sinyal berupa data yang di-input oleh user. Terdapat beberapa elemen input lain dalam flutter yang saya tidak gunakan seperti `Checkbox`, `RadioButton`, `DropDownButton`, `Slider`, dan lain-lain.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Agar aplikasi konsisten dengan tema dan pewarnaan, pengaturan tema dilakukan pada file `main.dart` dalam widget `MaterialApp`:
```
    MaterialApp(
      title: 'Palgop GamePass',
      theme: theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
```
Widget ini dapat digunakan pada seluruh file dalam project flutter dimana warna dari widget-widget yang mengaplikasikan `MyHomePage` ini dapat menggunakan atribut `MyHomepage`. Dalam project ini, pengaplikasian tema dapat dilakukan dengan memanggil:
```
  backgroundColor: Theme.of(context).colorScheme.primary,
```

sehingga warna latar belakang dari sebuah fitur dapat sama dengan yang diinginkan pada tema aplikasi.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi halaman pada aplikasi dapat dilakukan dengan berbagai cara. Beberapa cara navigasi yang saya tangani dalam aplikasi adalah dengan menggunakan beberapa method yakni `Navigator.pushReplacement()` yang memiliki fungsi menghapus route yang sedang ditampilkan dan menggantinya dengan route yang baru sehingga stack dari halaman menjadi hanya satu halaman, yakni halaman yang baru. Selanjutnya saya menggunakan `Navigator.push()` dimana fungsinya adalah menambahkan route baru di atas route lama sehingga jumlah stack menjadi dua. Terakhir, saya menggunakan `Navigator.pop()` yang fungsinya adalah menghapus route yang sedang ditampilkan dan menggantinya ke route sebelumnya di dalam stack.

### Tugas 7 PBP


### - Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak memiliki keadaan (state) yang dapat berubah selama siklus hidupnya. Widget ini bersifat statis dan hanya dibangun sekali, berdasarkan parameter yang diberikan padanya. Jika ada perubahan dalam data yang diperlukan untuk membangun widget ini, maka widget tersebut harus dibangun kembali dengan cara membuat instansi baru.Stateful widget adalah widget yang memiliki keadaan (state) yang dapat berubah selama siklus hidupnya. Widget ini dapat membangun kembali dirinya sendiri ketika ada perubahan pada state-nya. Stateful widget terdiri dari dua bagian: widget itu sendiri dan objek state yang menyimpan data yang dapat berubah.

### - Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Widget yang digunakan dalam project saya terdiri dari _built-in widget_ dan juga _custom widget_. Berikut adalah beberapa contoh _built in widget_ dalam project saya:
- `Scaffold`: Container utama dari sebuah _page_, dapat digunakan untuk menambahkan elemen-elemen lain.
- `AppBar`: Digunakan untuk menampilkan bagian atas aplikasi yang berisi judul, ikon, atau gambar.
- `SnackBar`: Menampilkan notifikasi singkat di bagian bawah layar.

### - Apa fungsi dari `setState()?` Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` digunakan untuk menandakan bahwa data dari sebuah variabel dalam widget telah berubah. _method_ `setState()` ini hanya dapat berjalan di dalam `StatefulWidget` karena `StatefulWidget` punya kemampuan untuk menyimpan perubahan variabel.

### - Jelaskan perbedaan antara `const` dengan `final`.
`const` adalah sebuah keyword dalam dart untuk menyatakan state sebuah variabel. Nilai dari variabel yang di-state oleh `const` harus sudah ditentukan pada saat _compile time_, bukan saat program berjalan. Sementara keyword `final`, nilai yang di-state ditentukan pada saat program berjalan. Namun, keduanya sama-sama _immutable_ dan tidak bisa diubah.

Contoh penggunaan:
```
const int pi = 3;
final String userName = getUserName();
```

Dapat dilihat, `const` sudah ditentukan dan tidak dapat diganti sejak awal program berjalan. Namun `final` terlihat kondisional berdasarkan username yang dimasukkan dan setelah method `getUserName()` dijalankan, variablenya menjadi _immutable_

### - Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

#### 1. Membuat base app flutter dan merapikan proyek:
Instansiasi app flutter yang baru dengan menggunakan prompt `flutter create e_commerce`, lalu dalam direktori `lib/` buat sebuah file dart baru, contohnya `menu.dart`. Lalu pindahkan beberapa class ke file baru tersebut agar proyek menjadi rapih dan terpisah. Jangan lupa untuk hilangkan parameter title dan ubah juga menjadi `StatelessWidget`

#### 2. Buat tiga buah tombol sederhana dengan ikon, teks dan warna yang berbeda. Serta Implementasikan `SnackBar` dengan tulisan yang berbeda-beda:
Memakai `Elevated Button` dan dialam Eleveated button disambungkan dengan fungsi `_showSnakckBar()` dan menampilkan message yang diinginkan 

Terakhir, tampilkan buttons yang sudah dibuat dalam class `MyHomePage`, tepatnya di dalam Widget Build di body dengan memanggil widget Elevated Button satu satu dipanggil 
