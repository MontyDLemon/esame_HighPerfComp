sudo iptables-save > /root/firewall.rules
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT


#per ripristinare le impostazioni precedenti

iptables-restore < /root/firewall.rules
