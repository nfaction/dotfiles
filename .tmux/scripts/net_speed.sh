#!/bin/bash

case "$OSTYPE" in
    linux-gnu)
        if [ -z "$1" ]; then
            echo
            echo usage: $0 network-interface
            echo
            echo e.g. $0 eth0
            echo
            exit
        fi

        IF=$1

        R1=`cat /sys/class/net/$1/statistics/rx_bytes`
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`
        sleep 1
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TKBPS=`expr $TBPS / 1024`
        RKBPS=`expr $RBPS / 1024`
        # printf "%s:%d %d " $1 $RKBPS $TKBPS
        echo -e "\xE2\x86\x91:$TKBPS \xE2\x86\x93:$RKBPS"
        ;;
esac