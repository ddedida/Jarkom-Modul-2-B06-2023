# Praktikum Modul 2 Jaringan Komputer

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

- Berikut merupakan topologi yang dikerjakan:
  <br>

  ![Topologi](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/d39894ce-cf21-4337-a9b4-473ce438faf6)

- Berikut adalah network configuration pada setiap node:
  - Router Pandudewanata
    <br>
  
    ```
    auto eth0
    iface eth0 inet dhcp
  
    auto eth1
      iface eth1 inet static
	    address 192.181.1.1
	    netmask 255.255.255.0

    auto eth2
      iface eth2 inet static
	    address 192.181.2.1
	    netmask 255.255.255.0

    auto eth3
      iface eth3 inet static
	    address 192.181.3.1
	    netmask 255.255.255.0
    ```

  - Yudhistira DNS Master
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.2.2
	    netmask 255.255.255.0
	    gateway 192.181.2.1
    ```

  - Sadewa Client
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.1.2
	    netmask 255.255.255.0
	    gateway 192.181.1.1
    ```

  - Nakula Client
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.1.3
	    netmask 255.255.255.0
	    gateway 192.181.1.1
    ```

  - Werkudara DNS Slave
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.3.2
	    netmask 255.255.255.0
	    gateway 192.181.3.1
    ```

  - Arjuna Load Balancer
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.3.3
	    netmask 255.255.255.0
	    gateway 192.181.3.1
    ```

  - Abimanyu Web Server
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.3.4
	    netmask 255.255.255.0
	    gateway 192.181.3.1
    ```

  - Prabakusuma Web Server
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.3.5
	    netmask 255.255.255.0
	    gateway 192.181.3.1
    ```

  - Wisanggeni Web Server
    <br>

    ```
    auto eth0
      iface eth0 inet static
	    address 192.181.3.6
	    netmask 255.255.255.0
	    gateway 192.181.3.1
    ```

  Selanjutnya, pada terminal `Router Pandudewanata` diketikan script:
  ```
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.181.0.0/16
  ```
  Kemudian pada terminal setiap node yang telah dikonfigurasi networknya, dilakukan script:
  ```
  echo nameserver 192.168.122.1 > /etc/resolv.conf
  ```
  Setelah itu setiap node bisa melakukan ping ke `google.com`, berikut merupakan hasil dari node `Sadewa Client` dan `Nakula Client`:
  - Sadewa
    <br>
    
    ![Topologi_Sadewa](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/2063b8af-5ce1-459f-a67c-336bf37fb0b2)
  - Nakula
    <br>
    
    ![Topologi_Nakula](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/fe2c778f-58df-40d3-a2a7-9fcecac6588f)

## Nomor 2
Buatlah website utama pada node arjuna dengan akses ke `arjuna.yyy.com` dengan alias `www.arjuna.yyy.com` dengan `yyy` merupakan kode kelompok.

**Penyelesaian:**
  - File `/etc/bind/named.conf.local` node Yudhistira ditambahkan:
    ```
    zone "arjuna.b06.com" {
        type master;
        file "/etc/bind/arjuna/arjuna.b06.com";
    };
    ```

  - Konfigurasi file `arjuna.b06.com` node Yudhistira: <br>
  
    ![config](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/268e703c-5c1e-40af-a5f0-7cd698534991)

  - Lakukan `service bind9 restart` pada node Yudhistira dan lakukan `ping` pada node client, berikut adalah hasilnya: <br>

    ![arjuna](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/ad67eac0-c38e-4882-abd7-2e97771d341b)

## Nomor 3
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke `abimanyu.yyy.com` dan alias `www.abimanyu.yyy.com`.

**Penyelesaian:**
  - File `/etc/bind/named.conf.local` node Yudhistira ditambahkan:
    ```
    zone "abimanyu.b06.com" {
        type master;
        file "/etc/bind/abimanyu/abimanyu.b06.com";
    };
    ```

  - Konfigurasi file `abimanyu.b06.com` node Yudhistira: <br>
  
    ![config](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/e177faf4-4b5d-48d1-924c-24af8f7373c5)

  - Lakukan `service bind9 restart` pada node Yudhistira dan lakukan `ping` pada node client, berikut adalah hasilnya: <br>

    ![abimanyu](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/086bd526-8097-4394-9aab-64d371cbb412)

## Nomor 4
Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain `parikesit.abimanyu.yyy.com` yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

**Penyelesaian:**
  - File `abimanyu.b06.com` node Yudhistira: <br>

    ![config](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/0ef2bbc2-2f87-41ac-96c7-2a55f107c66d)

  - Lakukan `service bind9 restart` pada node Yudhistira dan lakukan `ping` pada node client, berikut adalah hasilnya: <br>

    ![parikesit](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/255fe011-856d-4b72-9e1d-bac5dce0f4e4)

## Nomor 5
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)

**Penyelesaian:**

- File `/etc/bind/named.conf.local` node Yudhistira ditambahkan:
    ```
    zone "3.181.192.in-addr.arpa" {
      type master;
      file "/etc/bind/abimanyu/3.181.192.in-addr.arpa";
    };
    ```

  - Konfigurasi file `3.181.192.in-addr.arpa`: <br>
  
    ![config](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/c2d3c5bb-ca1b-4da1-9fb0-4c02494a9275)

  - Lakukan `service bind9 restart` pada node Yudhistira dan lakukan `host -t PTR 192.181.3.4` pada node client, berikut adalah hasilnya: <br>

    ![parikesit](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/3b5c9630-932d-4017-80a5-ec1f3b29a87b)

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
