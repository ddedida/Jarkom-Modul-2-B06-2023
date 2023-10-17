apt-get update
apt-get install nginx php php-fpm -y

mkdir /var/www/nijika

cp index.php /var/www/nijika/index.php

cp nijika-sites-available /etc/nginx/sites-available/nijika

cp resolv.conf /etc/resolv.conf

ln -s /etc/nginx/sites-available/nijika /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default

service apache2 stop
service php7.2-fpm start
service php7.2-fpm restart
service nginx restart