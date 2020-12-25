#!/bin/bash

test -d /proc/sys/net/ipv4/conf/tun0
VPN=$?
if [[ $VPN -eq 0 ]]
then
    CONNECTED_VPN="$(nmcli con | grep -i vpn | grep -i -e wlp3s0 -e enp8s0 | awk '!($2=$3=$4="")')"
    printf "{\"text\": \"\", \"percentage\": 0, \"tooltip\": \"$CONNECTED_VPN\", \"class\": \"up\"}"
else
    printf "{\"text\": \"\", \"percentage\": 50, \"tooltip\": \"disconnected\", \"class\": \"down\"}"
fi
