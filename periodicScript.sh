#!/bin/sh
while [ true ]
do
    make clean
    make
    echo 'PERIODIC MAKE EXECUTION COMPLETE.'
    sleep 60

done
