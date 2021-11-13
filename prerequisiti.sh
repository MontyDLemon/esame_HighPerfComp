#installo pacchetti

sudo apt install -y apache2 openssh-client openssh-server lvm2

# configuro iptables

#regole in ingresso
sudo iptables -A INPUT -i eth1 -p udp -m multiport --dports 5404,5405,5406 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

#regole in uscita
sudo iptables -A OUTPUT -o eth1 -p udp -m multiport --dports 5404,5405,5406 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#salvo regole
sudo iptables -L -n

#salvo su file chiamato rules.v4
sudo iptables -save > /tmp/rules.v4
