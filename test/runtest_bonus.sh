#!/bin/sh

gcc bonus.c

./a.out | cat -e > vanilla
LD_PRELOAD=../libasmbonus.so ./a.out | cat -e > preload

VASIZE=$(wc -c <vanilla)
PRSIZE=$(wc -c <preload)

if [ "$VASIZE" == "0" ]
then
    echo "./a.out segfault"
fi
if [ "$PRSIZE" == "0" ]
then
    echo "./a.out with preload segfault"
fi

DIFF=$(diff vanilla preload)
if [ "$VASIZE" != "0" -a "$PRSIZE" != "0" -a "$DIFF" == "" ]
then
    echo "OK!"
elif [ "$VASIZE" != "0" -a "$PRSIZE" != "0" ]
then
    echo "FAIL"
    echo "$DIFF"
fi
