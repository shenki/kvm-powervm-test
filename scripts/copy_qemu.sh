#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ -f "$SCRIPT_DIR/../output/build/qemu-l1-custom/build/qemu-system-ppc64" ]; then
    cp "$SCRIPT_DIR/../output/build/qemu-l1-custom/build/qemu-system-ppc64"  "$SCRIPT_DIR/../output/build/qemu-l1-custom/build/qemu-bundle/usr/share/qemu/slof.bin" "$SCRIPT_DIR/../overlay/"
fi
