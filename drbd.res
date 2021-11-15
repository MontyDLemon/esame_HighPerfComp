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
        on giacomo1 {
            address  10.0.2.15:7789;
        }
        on giacomo2 {
            address  10.2.0.4:7789;
        }
    }
