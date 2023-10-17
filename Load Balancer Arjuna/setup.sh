apt-get update
apt-get install nginx

cp lb-nijika /etc/nginx/sites-available/lb-nijika
ln -s /etc/nginx/sites-available/lb-nijika /etc/nginx/sites-enabled

cp resolv.conf /etc/resolv.conf

service nginx restart