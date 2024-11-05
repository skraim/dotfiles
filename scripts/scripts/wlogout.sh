#!/bin/bash

ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
if [ "$ACTIVE_MONITOR" == "HDMI-A-1" ]; then
    wlogout --buttons-per-row 5 --show-bind --css ~/.config/wlogout/style-wide.css
else
    wlogout --buttons-per-row 5 --show-bind --css ~/.config/wlogout/style-internal.css
fi
