#aggiungere IP statico all'interfaccia di rete

#nel file sudo nano /etc/network/interfaces, modificare in basso e sostituire con il seguente codice

# The primary network interface
allow-hotplug eth0
iface enp0s3 inet static
        address 10.0.2.4
        netmask 255.255.255.0
        gateway 10.0.2.1

#riavviare macchina, verificare con ip a
