;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.b06.com. root.arjuna.b06.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.b06.com.
@       IN      A       192.181.3.3
www     IN      CNAME   arjuna.b06.com.