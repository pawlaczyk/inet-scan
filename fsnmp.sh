#!/bin/bash

zmap -M udp -p 161 -q -v 0 -o - -i $1 -B 1M --probe-args=file:snmpbulkget.bin -f "saddr,data" $2 | stdbuf -i0 -o0 -e0 awk -F, '{print $1" "(length($2)-1)/2}'

exit

