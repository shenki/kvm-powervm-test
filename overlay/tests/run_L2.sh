#!/bin/bash
/root/qemu-system-ppc64 -nographic -M pseries -m 1024 -enable-kvm -vga none \
   -machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken \
   -kernel /root/vmlinux -initrd /root/rootfs.cpio \
   -virtfs local,path=/root,mount_tag=host0,security_model=mapped-xattr,id=host0 \
   -bios /usr/share/qemu/slof.bin
