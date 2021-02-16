#!/bin/bash

# Add vpn with nmcli import
# Then nmcli connection modify VPNNAME autoconnect no
# Then nmcli connection modify VPNNAME +vpn.data username=VPNUSERNAME
# Then nmcli connection modify VPNNAME -vpn.data password-flags
# Then nmcli connection modify VPNNAME +vpn.data password-flags = 0
# Create file containing like this line
# vpn.secrets.password:thisispassword123
PASSWD_FILE="$HOME/passwd"

function connect_vpn() {
    SELECT_VPN="$(nmcli con | grep -i vpn | awk '!($2=$3=$4="")' | wofi --show dmenu)"
    notify-send "Connecting VPN" "Connecting to $SELECT_VPN"
    nmcli connection up $SELECT_VPN passwd-file $PASSWD_FILE &> /dev/null
    if [[ $? -eq 0 ]]
    then
        notify-send "Connection to VPN successful" "Connected to $SELECT_VPN"
    else
        notify-send "Connection to VPN failed" "Connection attempt to $SELECT_VPN failed"
    fi
    return 0
}

function check_vpn(){
    #This is for getting active vpn
    CONNECTED_VPN="$(nmcli con | grep -i vpn | grep -i -e wlp3s0 -e enp8s0 | awk '!($2=$3=$4="")')"
    if [[ -n $CONNECTED_VPN ]]
    then
        nmcli connection down $CONNECTED_VPN
        notify-send "VPN Disconnected" "Disconnected from $CONNECTED_VPN"
        return 0
    fi
        connect_vpn
}

check_vpn
