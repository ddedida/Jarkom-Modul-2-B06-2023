apt-get update

apt-get install bind9 -y

cp named.conf.local /etc/bind/named.conf.local

cp named.conf.options /etc/bind/named.conf.options

mkdir /etc/bind/arjuna

mkdir /etc/bind/abimanyu

cp arjuna.b06.com /etc/bind/arjuna/arjuna.b06.com

cp abimanyu.b06.com /etc/bind/abimanyu/abimanyu.b06.com

cp 1.181.192.in-addr.arpa-abimanyu /etc/bind/abimanyu/3.181.192.in-addr.arpa

service bind9 restart