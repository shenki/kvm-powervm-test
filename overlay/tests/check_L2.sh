#!/bin/bash

F=$1

while ! grep "kvm-on-powervm login" "$F" > /dev/null; do
    sleep 1
done

echo Done: "$F"
