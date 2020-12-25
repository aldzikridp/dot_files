#!/bin/bash

# Create file containing like this line
# vpn.secrets.password:thisispassword123
PASSWD_FILE="$HOME/passwd"

function connect_vpn() {
    SELECT_VPN="$(nmcli con | grep -i vpn | awk '!($2=$3=$4="")' | wofi --show dmenu)"
    nmcli connection up $SELECT_VPN passwd-file $PASSWD_FILE &> /dev/null
    return 0
}

function check_vpn(){
    #This is for getting active vpn
    CONNECTED_VPN="$(nmcli con | grep -i vpn | grep -i -e wlp3s0 -e enp8s0 | awk '!($2=$3=$4="")')"
    if [[ -n $CONNECTED_VPN ]]
    then
        nmcli connection down $CONNECTED_VPN
        return 0
    fi
        connect_vpn
}

check_vpn
