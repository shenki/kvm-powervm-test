#!/usr/bin/env sh
make O=$PWD/output BR2_EXTERNAL=$PWD/kvm-on-powervm BR2_GLOBAL_PATCH_DIR="$PWD/kvm-on-powervm/patches" -C buildroot $@
