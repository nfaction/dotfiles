#!/bin/bash

if [ -a /var/run/reboot-required ];then
    echo -e "\xE2\x86\xBB"
else
    echo
fi

exit 0
