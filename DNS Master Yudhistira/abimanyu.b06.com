;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.b06.com. root.abimanyu.b06.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      abimanyu.b06.com.
@               IN      A       192.181.3.4
www             IN      CNAME   abimanyu.b06.com.
parikesit       IN      A       192.181.3.4
ns1             IN      A       192.181.3.2
baratayuda      IN      NS      ns1
www.parikesit   IN      CNAME   parikesit.abimanyu.b06.com.