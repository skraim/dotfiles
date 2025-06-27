#!/bin/bash

SNX=$(ip -j a | jq -r '.[] | select(.ifname == "snx-xfrm")')

if [ -n "$WAYLAND_DISPLAY" ]; then
    if [ -n "$SNX" ]; then
        echo "{\"text\":\"󰇧\",\"class\":\"connected\"}";
    else
        echo "{\"text\":\"󰇨\",\"class\":\"disconnected\"}";
    fi
else
    source "${HOME}/.cache/wal/colors.sh"
    if [ -n "$SNX" ]; then
        echo "%{F$color6}󰇧";
    else
        echo "%{F$color3}󰇨";
    fi
fi
