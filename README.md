# PalgopGamepass 🏪

## Link Deployment -> 

## Tugas 9 PBP 2024/2025 🧑‍💻🔗


### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

data JSON dipetakan dengan jelas dan rapi. Jika kita tidak membuat models terlebih dahulu maka JSON tidak dapat menanngkap input dari User. contoh kode seperti saya , `item_name` dimana JSON akan memetakan input user yaitu sebuah nama dan diteruskan lalu disimpan di dalam database

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

Library http yang digunakan dalam Flutter memiliki fungsi utama untuk melakukan komunikasi antara aplikasi dengan server melalui protokol HTTP. Pada tugas ini, http digunakan untuk mengambil data dari API atau mengirim data ke server. Dengan menggunakan library ini, kita dapat melakukan berbagai jenis permintaan HTTP seperti GET, POST, PUT, DELETE, dan sebagainya, untuk berinteraksi dengan server dan mendapatkan data yang dibutuhkan oleh aplikasi.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah objek dalam Flutter yang berguna untuk mengelola autentikasi dan menjaga sesi pengguna dengan menggunakan cookies, terutama dalam aplikasi yang berkomunikasi dengan backend berbasis Django atau framework web lainnya. Cookie dapat menyimpan informasi terkait sesi pengguna, seperti token autentikasi atau identifikasi sesi, sehingga pengguna tidak perlu login ulang setiap kali berinteraksi dengan aplikasi atau ketika aplikasi di-refresh.


### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Proses pengiriman data dari input hingga ditampilkan di Flutter dengan integrasi Django melalui beberapa langkah penting. Pertama, pengguna memasukkan data melalui antarmuka Flutter, seperti formulir atau elemen interaktif lainnya. Setelah itu, aplikasi Flutter mengirimkan data tersebut ke server Django menggunakan HTTP request, umumnya dengan metode POST untuk mengirim data baru dan GET untuk mengambil data yang sudah ada. Di sisi Django, data yang diterima akan diproses oleh view dan serializer untuk memastikan data tersebut sesuai dengan format yang diinginkan sebelum disimpan dalam database. Setelah berhasil diproses dan disimpan, Django mengirimkan respons dalam format JSON. Respons ini kemudian diterima oleh Flutter, diproses menjadi objek yang dapat digunakan, dan ditampilkan di antarmuka pengguna melalui widget seperti ListView atau Card. Seluruh proses ini memungkinkan data berpindah dengan lancar antara aplikasi frontend Flutter dan server backend Django, melalui API yang memastikan komunikasi yang aman dan terstruktur.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pada fungsi register, data-data seperti username, password, dan password confirmation dikirim dalam bentuk POST JSON ke app auth, tepatnya pada page register. Page register ini menjalankan fungsi register pada views.py dari app auth. Di sana diatur penyocokan seperti penyamaan password dan password confirmation, menghindari pengulangan username sama, dll. Lalu diatur pembuatan sebuah user dan mengembalikan sebuah `jsonResponse` berisi username sehingga dapat dikirim dan digunakan dalam flutter. Untuk fungsi login, flutter mengirimkan POST JSON ke app auth pada page login dimana page tersebut menjalankan fungsi login pada views.py dari app auth. Pada fungsi login di views.py, dijalankan fungsi `authenticate` dengan password dan username yang didapatkan dari flutter. Jika berhasil maka akan mengembalikan `jsonResponse` dan dikirim kembali ke flutter. Jika berhasil maka akan dialihkan ke page main di flutter. Terakhir, fungsi logout juga menjalankan fungsi logout di django tepatnya pada app auth. Di dalamnya, dijalankan fungsi `auth_logout` dan mengembalikan `jsonResponse` kembali sehingga nantinya dapat ditangkap dan digunakan oleh flutter untuk menentukan berhasil atau tidaknya logout.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Buat app authentication di project Django, install django-cors-headers, masukkan ke `INSTALLED_APPS` di settings.py, dan include corsheaders.middleware.CorsMiddleware ke MIDDLEWARE di settings.py. Buat fungsi pada views.py di app authentication
```python3
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
```


Fitur registrasi dimulai dengan membuat file Dart baru bernama register.dart di dalam direktori screens. Di dalam file tersebut, buatlah beberapa TextFormField untuk menerima input dari pengguna, seperti username, password, dan konfirmasi password. Selanjutnya, buat sebuah ElevatedButton yang akan mengirimkan data username dan password ke Django menggunakan postJson ketika tombol tersebut ditekan. Data ini akan diproses oleh fungsi register yang ada di dalam file `views.py` pada aplikasi authentication di backend Django. Fungsi register akan mengembalikan JSONResponse, yang akan diterima oleh aplikasi Flutter. Berdasarkan respons yang diterima, jika registrasi berhasil, lakukan navigasi menggunakan pushReplacement ke halaman login. Namun, jika registrasi gagal, tetap berada di halaman registrasi dan tampilkan pesan kesalahan sesuai dengan respons yang diterima.

 #### Membuat halaman login pada proyek tugas Flutter.
 Install terlebih dahulu package yang disediakan oleh tim asdos sehingga bisa mengintegrasikan sistem autentikasi dengan Django dengan menjalankan `flutter pub add provider` dan `flutter pub add pbp_django_auth`. Pada main.dart, ubah `home: MyHomePage(),` menjadi `home: const LoginPage(),` agar aplikasi bersifat login restricted. Pada view.py di app authentication di project Django, buat sebuah fungsi login yang menjalankan fungsi `authenticate` dan mengembalikan JSONResponse

 ```python3
 def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
 ```
 
  Lalu buat sebuah file bernama `login.dart` di folder screens. buat widget build dengan membuat TextField yang meminta input username dan juga password. Buat button untuk submit dengan menggunakan `ElevatedButton` dan melakukan request pada `onPressed()` ke Django App Authentication tepatnya pada fungsi login di views.py. Lalu berdasarkan response yang dikirim oleh Django, buat kondisi antara login sukses atau gagal. jika login berhasil, lakukan `pushReplacement` ke `menu.dart` namun jika gagal maka stay di login page.

  #### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
  Sudah dijelaskan di atas.

  #### Membuat model kustom sesuai dengan proyek aplikasi Django.
  Pada Django, buat terlebih dahulu beberapa contoh product dengan menggunakan fitur add new product, lalu pergi ke page JSON, copy data JSON dalam bentuk pretty print dan ubah jadi format dart di website [Quicktype](https://app.quicktype.io/). Buat sebuah direktori baru bernama `models` dan file baru bernama `product_entry.dart` dan paste data JSON tadi ke dalam file tersebut.

  #### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
  Buat sebuah file baru di screens dengan nama `list_product.dart`. di dalamnya, ambil data dari JSON Django dan masukkan ke dalam sebuah list dengan menggunakan loop. Selanjutnya buat ListView untuk dapat menampung data yang ingin ditampilkan dalam format column. Lalu tampilkan nama produk, harga produk, dan juga deskripsi dari produk.

  #### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  Pada `list_product.dart`, pada ListView tambahkan fungsi `onPressed()` agar ketika satu list tersebut ditekan, bisa menghasilkan respons yang diinginkan. Gunakan `Navigator.push()` saja agar nantinya bisa dilakukan pop di page selanjutnya. Pada `onPressed()` tersebut, lakukan forward dari product agar dapat diakses pada page lain. Buat sebuah file bernama `details_product.dart` di dalam folder screens. Karena objek product sudah di-forward dari `list_product.dart`, pada `details_product.dart` kita tinggal melakukan penampilan data dari masing-masing field dari product data tersebut. Jangan lupa membuat sebuah `ElevatedButton` yang diimplementasikan `onPressed()` yang ketika ditekan maka akan mengembalikan user ke halaman list product dengan menggunakan `Navigator.pop`.

  #### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
  Saat melakukan login, flutter mengirimkan info username dan juga password ke Django. Pada django, dijalankan fungsi login pada views.py. Pada fungsi login, dijalankan method `authenticate`
  ```python3
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
  ```
  method authenticate ini merestriksi pengguna yang login saja yang bisa melakukan add product. Lalu nanti product akan ditampikan berdasarkan input-input product yang dilakukan oleh user tertentu. Jadi jika kita login sebagai user lain, maka product yang diciptakan oleh user lainnya tidak akan muncul di list product user tersebut.



## Archive Tugas
<details><summary> Tugas 8 PBP 2024/2025 🧑‍💻🔗 📖</summary>

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
