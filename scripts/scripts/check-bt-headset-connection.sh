#!/bin/bash

bt_device_connected=$(pactl list short sinks | grep "bluez_");
source "${HOME}/.cache/wal/colors.sh"

if [ -n "$bt_device_connected" ]; then
    echo "%{F$color6}󰥰"
else
    echo ""
fi

