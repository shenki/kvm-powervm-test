#!/bin/bash

rm -f l2-*.log

N=8
if [ -n "$1" ] ; then
    N=$1
fi

for i in $(seq $N) ; do
    touch l2-$i.log
    screen -dm -Logfile l2-$i.log -L -s ./run_L2.sh ;
done
