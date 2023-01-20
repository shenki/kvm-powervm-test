#!/bin/bash

N=8
if [ -n "$1" ] ; then
    N=$1
fi

for i in $(seq $N) ; do
    ./check_L2.sh "l2-$i.log" &
done

wait

echo All L2s done!
