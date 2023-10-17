apt-get update
apt-get install nginx php php-fpm -y
apt-get install wget
apt-get install unzip

wget "https://drive.google.com/uc?export=download&id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS" -O parikesit.zip
unzip parikesit.zip
rm parikesit.zip

wget "https://drive.google.com/uc?export=download&id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6" -O rjp.baratayuda.zip
unzip -d rjp.baratayuda.abimanyu.b06 -j rjp.baratayuda.zip
rm rjp.baratayuda.zip

mkdir parikesit.abimanyu.yyy.com/secret
mkdir parikesit.abimanyu.yyy.com/secret/lmao
cp index.html-parikesit parikesit.abimanyu.yyy.com/secret

cp index.php parikesit.abimanyu.yyy.com/index.php
cp home.html-parikesit parikesit.abimanyu.yyy.com/home.html
cp .htaccess parikesit.abimanyu.yyy.com/.htaccess

cp -r parikesit.abimanyu.yyy.com parikesit.abimanyu.b06
cp -r parikesit.abimanyu.b06 /var/www/

cp -r rjp.baratayuda.abimanyu.b06 /var/www/

mkdir /var/www/nijika
mkdir /var/www/abimanyu.b06

cp index.php-nijika /var/www/nijika/index.php
cp home.html /var/www/nijika/home.html

cp .htaccess /var/www/abimanyu.b06/.htaccess
cp .htaccess-rjp /var/www/rjp.baratayuda.abimanyu.b06/.htaccess

cp nijika-sites-available /etc/nginx/sites-available/nijika

cp resolv.conf /etc/resolv.conf

ln -s /etc/nginx/sites-available/nijika /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default

cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf

mkdir /var/www/abimanyu.b06

cp index.php-abimanyu /var/www/abimanyu.b06/index.php
cp abimanyu.webp /var/www/abimanyu.b06/abimanyu.webp

cp parikesit.abimanyu.b06.com.conf /etc/apache2/sites-available/parikesit.abimanyu.b06.com.conf
cp abimanyu.b06.com.conf /etc/apache2/sites-available/abimanyu.b06.com.conf

cp index.html-default /var/www/html/index.html

rm -rf parikesit.abimanyu.b06
rm -rf parikesit.abimanyu.yyy.com
rm -rf rjp.baratayuda.abimanyu.b06

cp ports.conf /etc/apache2/ports.conf

cp rjp.baratayuda.abimanyu.b06.com.conf /etc/apache2/sites-available/rjp.baratayuda.abimanyu.b06.com.conf

cp .htaccess-default-html /var/www/html/.htaccess

htpasswd -b -c /etc/apache2/.htpasswd Wayang baratayudab06

a2enmod rewrite
a2ensite abimanyu.b06.com
a2ensite parikesit.abimanyu.b06.com
a2ensite rjp.baratayuda.abimanyu.b06.com
service php7.2-fpm start
service php7.2-fpm restart
service apache2 start
service apache2 restart
service nginx restart