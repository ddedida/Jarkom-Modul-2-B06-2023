# Praktikum Modul 2 Jaringan Komputer

Berikut merupakan Laporan Resmi dari Praktikum Modul 2 Jaringan Komputer kelompok B06.

Anggota Kelompok:
| Nama | NRP |
| -------------------------- | ---------- |
| Muhammad Dafian Zakiakhdan | 5025211108 |
| Dewangga Dika Darmawan | 5025211109 |

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

- File `/etc/bind/named.conf.local` node Yudhistira pada zone `abimanyu` ditambahkan:

  ```
  zone "abimanyu.b06.com" {
      type master;
      notify yes;
      also-notify { 192.181.3.2; };
      allow-transfer { 192.181.3.2; };
      file "/etc/bind/abimanyu/abimanyu.b06.com";
  };
  ```

- File `/etc/bind/named.conf.local` node Werkudara ditambahkan:

  ```
  zone "abimanyu.b06.com" {
  	type slave;
  	masters { 192.181.2.2; };
  	file "/var/lib/bind/abimanyu.b06.com";
  };
  ```

- Testing dengan `service bind9 stop` pada node Yudhisitira dan `service bind9 restart` pada node Werkudara, lalu ping di node client: <br>

![abimanyu](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/e63add25-eddb-4967-bf7c-44a6e93883ba)

## Nomor 7

Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu `baratayuda.abimanyu.yyy.com` dengan alias `www.baratayuda.abimanyu.yyy.com` yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

**Penyelesaian:**

- File `abimanyu.b06.com` node Yudhistira: <br>

  ![configyudhis](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/a29a57fe-81cc-4cdc-862f-e8bd7e561c02)

- File `/etc/bind/named.conf.options` pada node Yudhistira: <br>

  ![configoptionyudhis](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/a2764a4c-c9f9-4293-a576-31241cd560f9)

- File `/etc/bind/named.conf.local` node Yudhistira pada zone `abimanyu` ditambahkan:

  ```
  zone "abimanyu.b06.com" {
      type master;
      notify yes;
      also-notify { 192.181.3.2; };
      allow-transfer { 192.181.3.2; };
      file "/etc/bind/abimanyu/abimanyu.b06.com";
  };
  ```

- File `/etc/bind/named.conf.options` pada node Werkudara: <br>

  ![configoptionyudhis](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/a2764a4c-c9f9-4293-a576-31241cd560f9)

- Konfigurasi file `baratayuda.abimanyu.b06.com` node Werkudara: <br>

  ![werkudaraconfig](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/690dd44c-c9f5-4f22-be15-c2f0b1263a42)

- Lakukan `service bind9 restart` pada node Werkudara dan lakukan `ping` pada node client, berikut adalah hasilnya: <br>

  ![baratayuda](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/eec2ce07-4258-4e75-bcfd-e62961553498)

## Nomor 8

Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses `rjp.baratayuda.abimanyu.yyy.com` dengan alias `www.rjp.baratayuda.abimanyu.yyy.com` yang mengarah ke Abimanyu.

**Penyelesaian:**

- Konfigurasi file `baratayuda.abimanyu.b06.com` node Werkudara: <br>

  ![config](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/e2c3d92a-7089-471b-a9e6-59bbaa34f707)

- Lakukan `service bind9 restart` pada node Werkudara dan lakukan `ping` pada node client, berikut adalah hasilnya: <br>

  ![rjp](https://github.com/ddedida/Jarkom-Modul-2-B06-2023/assets/108203648/10919319-7c16-4aa7-9f7c-407c78ed36e6)

## Nomor 9

Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

**Penyelesaian:**

- Install nginx pada masing-masing worker dengan `apt-get install nginx`
- Lakukan konfigurasi nginx pada masing masing worker

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/4623e595-8739-4077-a7ed-6f9f235674b4)

- Lakukan konfigurasi nginx pada Arjuna Load Balancer agar mengarah ke masing masing worker

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/bad840c6-c3bd-453d-8bb4-65c745225d3c)

- Lakukan `service nginx restart` pada masing masing worker dan Arjuna Load Balancer
- Test menggunakan ping masing masing ip worker di client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/c60c3aae-73e8-4c4b-a292-bfe13f514b3a)

## Nomor 10

Kemudian gunakan algoritma `Round Robin` untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh:

- Prabakusuma:8001
- Abimanyu:8002
- Wisanggeni:8003

**Penyelesaian:**

- Lakukan konfigurasi nginx pada Arjuna Load Balancer agar mengarah ke masing masing worker dengan algoritma Round Robin

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/771ab14f-261f-4e95-8d04-fe89e2b8749c)

- Lakukan `service nginx restart` pada Arjuna Load Balancer
- Untuk menge test lynx pada abimanyu.b06.com pada client yang akan berganti worker setiap kali lynx dilakukan

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/75ab3c49-5aee-4699-ac74-cef5a2e61dd0)

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/f84e8741-43eb-447c-95de-e2be1a6a1466)

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/2a155da3-af44-479f-9391-68effdde65a9)

## Nomor 11

Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server `www.abimanyu.yyy.com`. Pertama dibutuhkan web server dengan DocumentRoot pada `/var/www/abimanyu.yyy`.

**Penyelesaian:**

- Lakukan instalasi apache2 di worker abimanyu menggunakan `apt-get install apache2`
- Buat konfigurasi domain abimanyu didalam folder `/etc/apache2/sites-available` dengan nama file `abimanyu.b06.com.conf`

  ```sh
    <VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/abimanyu.b06
        ServerName abimanyu.b06.com
        ServerAlias www.abimanyu.b06.com
        ServerAlias 192.181.3.4

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
  ```

  - Gunakan command `a2ensite abimanyu.b06.com` untuk mengaktifkan konfigurasi domain abimanyu
  - Download file zip dari github dengan command `wget` lalu pindahkan ke folder `/var/www/abimanyu.b06`
  - Tes menggunakan command `lynx` melalui client

    ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/b4d6b2df-9780-4558-a5c8-979e850d5b8c)

## Nomor 12

Setelah itu ubahlah agar url `www.abimanyu.yyy.com/index.php/home` menjadi `www.abimanyu.yyy.com/home`.

**Penyelesaian:**

- Jalankan script berikut di worker abimanyu

  ```sh
    echo -e
    '<VirtualHost *:80>
      ServerAdmin webmaster@localhost
      DocumentRoot /var/www/abimanyu.b06
      ServerName abimanyu.b06.com
      ServerAlias www.abimanyu.b06.com

      <Directory /var/www/abimanyu.b06/index.php/home>
              Options +Indexes
      </Directory>

      Alias "/home" "/var/www/abimanyu.b06/index.php/home"

      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>' > /etc/apache2/sites-available/abimanyu.b06.com.conf

    service apache2 restart
  ```

- Untuk menge tes lakukan `lynx` di client menujut ```abimanyu.b06.com/index.php/home

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/b4d6b2df-9780-4558-a5c8-979e850d5b8c)

## Nomor 13

Selain itu, pada subdomain `www.parikesit.abimanyu.yyy.com`, DocumentRoot disimpan pada `/var/www/parikesit.abimanyu.yyy`.

**Penyelesaian:**

- Buat file konfigurasi parikesit ke apache2

  ```sh
    <VirtualHost *:80>
              ServerAdmin webmaster@localhost
              DocumentRoot /var/www/parikesit.abimanyu.b06
              ServerName parikesit.abimanyu.b06.com
              ServerAlias www.parikesit.abimanyu.b06.com

              ErrorLog ${APACHE_LOG_DIR}/error.log
              CustomLog ${APACHE_LOG_DIR}/access.log combined
      </VirtualHost>
  ```

- Konfigurasi parikesit kedalam apache2 dengan command `a2ensite parikesit.b06.com`
- Download file zip dari github dengan command `wget` lalu pindahkan ke folder `/var/www/parikesit.b06`
- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/ebe8734b-cb7a-4967-9537-3e9e380e244f)

## Nomor 14

Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

**Penyelesaian:**

- Tambahkan script konfigurasi parikesit ke apache2

  ```sh
      <Directory /var/www/parikesit.b06/public>
              Options +Indexes
      </Directory>

      <Directory /var/www/parikesit.b06/secret>
              Options -Indexes
              Deny from all
      </Directory>
  ```

- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/18acb028-8054-48a9-843c-5df0dad76606)

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/1e1cd0e0-d249-4da8-b73a-44cb717f819c)

## Nomor 15

Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

**Penyelesaian:**

- Tambahkan file `.htaccess` pada folder `/var/www/parikesit.abimanyu.b06`
  ```sh
    ErrorDocument 404 /error/404.html
    ErrorDocument 403 /error/403.html
  ```
- Jalankan perintah `en2mod rewrite` dan `service apache2 restart`
- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/26019a05-b50a-4c18-b2c3-4a2b0dbd23e0)

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/08f79a42-174d-4f0b-8df3-2cd928fa7280)

## Nomor 16

Buatlah suatu konfigurasi virtual host agar file asset `www.parikesit.abimanyu.yyy.com/public/js` menjadi `www.parikesit.abimanyu.yyy.com/js`.

**Penyelesaian:**

- Tambahkan script konfigurasi parikesit ke apache2

```sh

    Alias "/js" "/var/www/parikesit.b06/public/js"
```

- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/c7300398-f07f-4805-87cd-7e23ce468a06)

## Nomor 17

Agar aman, buatlah konfigurasi agar `www.rjp.baratayuda.abimanyu.yyy.com` hanya dapat diakses melalui port 14000 dan 14400.

**Penyelesaian:**

- Tambakhan konfigurasi port apache pada file `/etc/apache2/ports.conf`

```sh
  Listen 80
  Listen 14000
  Listen 14400
```

- Tambahkan script konfigurasi rjp ke apache2

```sh
  <VirtualHost *:14000 *:14400>
          ServerAdmin webmaster@localhost
          DocumentRoot /var/www/rjp.baratayuda.b06
          ServerName rjp.baratayuda.b06.com
          ServerAlias www.rjp.baratayuda.b06.com

          ErrorLog ${APACHE_LOG_DIR}/error.log
          CustomLog ${APACHE_LOG_DIR}/access.log combined
  </VirtualHost>
```

- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/98105205-6bff-4c6b-bf64-7a0401a35fb9)

## Nomor 18

Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada `/var/www/rjp.baratayuda.abimanyu.yyy`.

**Penyelesaian:**

- Tambahkan script konfigurasi rjp ke apache2
  ```sh
    <Directory /var/www/rjp.baratayuda.abimanyu.b06>
              AuthType        Basic
              AuthName        "Need Authentication"
              AuthUserFile    "/etc/apache2/.htpasswd"
              Require user    Wayang
    </Directory>
  ```
- Buat file `.htpasswd` pada `/etc/apache2/` dengan command `htpasswd -b -c /etc/apache2/.htpasswd Wayang baratayudab06`
- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/4589285f-6060-49c0-a6bb-2e1c1c4182a0)

## Nomor 19

Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke `www.abimanyu.yyy.com`. (alias)

**Penyelesaian:**

- Tambahkan script konfigurasi `./htaccess` kedalam folder `/var/www/html/`
  ```sh
    Options +FollowSymLinks
    RewriteEngine On
    RewriteBash /
    RewriteCond %{HTTP_HOST} ^192\.181\.3\.4$
    RewriteRule ^(.*)$ http://abimanyu.b06.com/$1 [R=301,L]
  ```
- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/eeb2bdec-bc1f-4d48-b401-4eb6766668eb)

## Nomor 20

Karena website `www.parikesit.abimanyu.yyy.com` semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

**Penyelesaian:**

- Tambahkan script konfigurasi `./htaccess` kedalam folder `/var/www/parikesit.b06/`
  ```sh
    RewriteEngine On
    RewriteCond %{REQUEST_URI} !^/public/images/abimanyu.png
    RewriteCond %{REQUEST_URI} abimanyu
    RewriteRule \.(jpg|jpeg|png)$ /public/images/abimanyu.png [L]
  ```
- Lakukan `lynx` pada client

  ![image](https://github.com/Rencist/A07_Sisop_Individu_Modul_3/assets/91055469/decf5d8c-3978-41d4-bdf6-29e0e40035b3)
