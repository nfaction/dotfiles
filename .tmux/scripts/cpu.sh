#!/bin/bash

### Get os name via uname ###
_myos="$(uname)"

case $_myos in
    Linux)
        CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))%"`

        FREE_MEM=`free | awk '/buffers\/cache/{print (100 - ($4/($3+$4) * 100.0));}'`
        ;;
    Darwin)
		CPU=`ps -A -o %cpu | awk '{s+=$1} END {print s}'`

		FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
		INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
		SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
		INSTALLED=$(sysctl -a | grep hw.memsize | cut -f 2 -d ' ')
		FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS)*4096/1048576))
		INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
		TOTAL=$((($FREE+$INACTIVE)))
		TOTALINMB=$(($INSTALLED/1024/1024))
		FREE_MEM=$(awk "BEGIN {printf \"%.0f\",${TOTAL}/${TOTALINMB}*100}")
		;;
esac

printf "CPU:%.0f%% Mem:%.0f%%" $CPU $FREE_MEM

exit 0