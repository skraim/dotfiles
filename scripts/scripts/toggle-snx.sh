#!/bin/bash

source $HOME/states

export SNX_PASS_KEY SNX_OTP_KEY

SNX=$(ip -j a | jq -r '.[] | select(.ifname == "snx-xfrm")')
if [ -n "$SNX" ]; then
    snxctl disconnect
    exec dunstify -t 2000 -a "SNX" "Disconnected"
else
    snx-connect.sh
fi
