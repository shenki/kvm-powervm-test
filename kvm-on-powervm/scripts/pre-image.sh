#!/usr/bin/env sh

# $1 contains the target directory

if ! grep -q 9p2000 "$1/etc/fstab"; then
    echo "host0	/root	9p	trans=virtio,version=9p2000.L,rw,noauto,x-systemd.automount	0 0" >> "$1/etc/fstab"
fi
