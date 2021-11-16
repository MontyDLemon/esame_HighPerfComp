#configurazione drbd per entrambi i nodes appartenenti al cluster

resource webdata {
        protocol C;
        meta-disk internal;
        device /dev/drbd0;
        disk   /dev/disk_drbd/lv_drbd;
        handlers {
            split-brain "/usr/lib/drbd/notify-split-brain.sh root";
        }
        net {
        allow-two-primaries no;
        after-sb-0pri discard-zero-changes;
        after-sb-1pri discard-secondary;
        after-sb-2pri disconnect;
        rr-conflict disconnect;
        }
        disk {
            on-io-error detach;
        }
        syncer {
            verify-alg sha1;
        }
        on monty1 {
            address  10.0.2.4:7789;
        }
        on monty2 {
            address  10.0.2.6:7789;
        }
    }

#Abbiamo appena creato una nuova risorsa chiamata webdata, la quale verrà salvata sulla partizione /dev/disk\_drbd/lv\_drbs. La risorsa utilizzerà TCP su porta 7789\footnote{In caso di problemi di connessione, assicurarsi che la porta sia aperta e non protetta da firewall.} per le connessioni e binding agli indirizzi IP scritti sopra.\\

#Ora inizializziamo i metadati locali per questa nuova risorsa e portiamola in rete, eseguire:
#sudo drbdadm create-md webdata
#sudo drbdadm up webdata

