#!/bin/sh

file="default"
num=1;
ext="txt"
j=0
i=$#
while [ $# -ne $((j)) ]
do
    if ([ "$1" = "-e" ] || [ $1 = "--extension" ]);
    then
        shift
        ext="$1"
        shift
        continue
    fi
    if ([ "$1" = "-f" ] || [ $1 = "--filename" ]);
    then
        shift
        file="$1"
        shift
        continue
    fi
    if ([ "$1" = "-n" ] || [ $1 = "--number" ]);
    then
        shift
        num=$1
        shift
        continue
    fi
    exit 1
done
for a in $(seq 1 1 $num); do
    num=$((a))
    touch -- "$file-$num.$ext"
done
exit 0
