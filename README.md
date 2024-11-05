# PalgopGamepass 🏪

## Link Deployment -> 

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
