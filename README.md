# Praktikum Modul 2 Jaringan Komputer
<div align=justify>

Berikut merupakan Laporan Resmi dari Praktikum Modul 2 Jaringan Komputer kelompok B06.

Anggota Kelompok:
| Nama                       | NRP        |
| -------------------------- | ---------- |
| Muhammad Dafian Zakiakhdan | 5025211108 |
| Dewangga Dika Darmawan     | 5025211109 |

# Soal dan Penyelesaian

## Nomor 1
Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian [sebagai berikut](https://docs.google.com/spreadsheets/d/1OqwQblR_mXurPI4gEGqUe7v0LSr1yJViGVEzpMEm2e8/edit?usp=sharing). Folder topologi dapat diakses pada [drive berikut](https://drive.google.com/drive/folders/1Ij9J1HdIW4yyPEoDqU1kAwTn_iIxg3gk?usp=sharing).

**Penyelesaian:**

## Nomor 2
Buatlah website utama pada node arjuna dengan akses ke `arjuna.yyy.com` dengan alias `www.arjuna.yyy.com` dengan `yyy` merupakan kode kelompok.

**Penyelesaian:**

## Nomor 3
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke `abimanyu.yyy.com` dan alias `www.abimanyu.yyy.com`.

**Penyelesaian:**

## Nomor 4
Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain `parikesit.abimanyu.yyy.com` yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

**Penyelesaian:**

## Nomor 5
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)

**Penyelesaian:**

## Nomor 6
Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

**Penyelesaian:**

## Nomor 7
Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu `baratayuda.abimanyu.yyy.com` dengan alias `www.baratayuda.abimanyu.yyy.com` yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

**Penyelesaian:**

## Nomor 8
Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses `rjp.baratayuda.abimanyu.yyy.com` dengan alias `www.rjp.baratayuda.abimanyu.yyy.com` yang mengarah ke Abimanyu.

**Penyelesaian:**

## Nomor 9
Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

**Penyelesaian:**

## Nomor 10
Kemudian gunakan algoritma `Round Robin` untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh:
- Prabakusuma:8001
- Abimanyu:8002
- Wisanggeni:8003

**Penyelesaian:**

## Nomor 11
Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server `www.abimanyu.yyy.com`. Pertama dibutuhkan web server dengan DocumentRoot pada `/var/www/abimanyu.yyy`.

**Penyelesaian:**

## Nomor 12
Setelah itu ubahlah agar url `www.abimanyu.yyy.com/index.php/home` menjadi `www.abimanyu.yyy.com/home`.

**Penyelesaian:**

## Nomor 13
Selain itu, pada subdomain `www.parikesit.abimanyu.yyy.com`, DocumentRoot disimpan pada `/var/www/parikesit.abimanyu.yyy`.

**Penyelesaian:**

## Nomor 14
Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

**Penyelesaian:**

## Nomor 15
Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

**Penyelesaian:**

## Nomor 16
Buatlah suatu konfigurasi virtual host agar file asset `www.parikesit.abimanyu.yyy.com/public/js` menjadi `www.parikesit.abimanyu.yyy.com/js`.

**Penyelesaian:**

## Nomor 17
Agar aman, buatlah konfigurasi agar `www.rjp.baratayuda.abimanyu.yyy.com` hanya dapat diakses melalui port 14000 dan 14400.

**Penyelesaian:**

## Nomor 18
Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada `/var/www/rjp.baratayuda.abimanyu.yyy`.

**Penyelesaian:**

## Nomor 19
Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke `www.abimanyu.yyy.com`. (alias)

**Penyelesaian:**

## Nomor 20
Karena website `www.parikesit.abimanyu.yyy.com` semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

**Penyelesaian:**
