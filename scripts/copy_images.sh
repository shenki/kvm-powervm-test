#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ -f "$SCRIPT_DIR/../output/images/rootfs.cpio" ]; then
    cp "$SCRIPT_DIR/../output/images/rootfs.cpio" "$SCRIPT_DIR/../overlay/"
fi

if [ -f "$SCRIPT_DIR/../output/build/linux-custom/vmlinux" ]; then
    cp "$SCRIPT_DIR/../output/build/linux-custom/vmlinux" "$SCRIPT_DIR/../overlay"
else
    if [ -f "$SCRIPT_DIR/../output/build/vmlinux" ]; then
	cp "$SCRIPT_DIR/../output/build/vmlinux" "$SCRIPT_DIR/../overlay"
    fi
fi
