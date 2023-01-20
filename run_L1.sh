#!/usr/bin/env sh

scripts/copy_qemu.sh
scripts/copy_images.sh

N=$(nproc)
nproc
free

output/build/host-qemu-custom/build/qemu-system-ppc64 -nographic \
  -machine pseries,cap-nested-hv=true -cpu POWER10 \
  -display none -vga none -m 4G -accel tcg,thread=multi \
  -serial mon:stdio \
  -smp cores=$N,maxcpus=$N,threads=1 \
  -kernel output/images/vmlinux \
  -initrd output/images/rootfs.cpio \
  -virtfs local,path=overlay,mount_tag=host0,security_model=mapped-xattr,id=host0
