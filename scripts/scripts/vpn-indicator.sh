#!/bin/bash

TUN=$(ip -j a | jq -r '.[] | select(.ifname == "tun0")')

if [ -n "$WAYLAND_DISPLAY" ]; then
    if [ -n "$TUN" ]; then
        echo "{\"text\":\"󰇧\",\"class\":\"connected\"}";
    else
        echo "{\"text\":\"󰇨\",\"class\":\"disconnected\"}";
    fi
else
    source "${HOME}/.cache/wal/colors.sh"
    if [ -n "$TUN" ]; then
        echo "%{F$color6}󰇧";
    else
        echo "%{F$color3}󰇨";
    fi
fi
