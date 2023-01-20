#!/usr/bin/env sh

# $1 contains the images directory

cp "$1/rootfs.cpio" "$1/../../overlay/"
