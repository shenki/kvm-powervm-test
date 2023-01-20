#!/bin/bash

set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASE_DIR=$SCRIPT_DIR/../

pushd "$BASE_DIR" || exit
echo "Cleaning up old builds..."
rm -rf "$BASE_DIR/output/build/qemu-l1-custom/" "$BASE_DIR/output/build/host-qemu-custom/"
echo "Generating config..."
./make kvm_l1_defconfig
echo "Building host qemu..."
./make host-qemu-reconfigure #2>>host_qemu_build.log >>host_qemu_build.log
#./make host-qemu-rebuild 2>>host_qemu_build.log >>host_qemu_build.log
echo "Building guest qemu..."
./make qemu-l1-reconfigure #2>>guest_qemu_build.log >>guest_qemu_build.log
#./make qemu-l1-rebuild 2>>guest_qemu_build.log >>guest_qemu_build.log

popd || exit
