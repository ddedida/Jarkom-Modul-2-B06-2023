apt-get update
apt-get install bind9 -y

cp named.conf.local /etc/bind/named.conf.local

cp named.conf.options /etc/bind/named.conf.options

mkdir /etc/bind/delegasi

cp baratayuda.abimanyu.b06.com-delegasi /etc/bind/delegasi/baratayuda.abimanyu.b06.com

service bind9 restart