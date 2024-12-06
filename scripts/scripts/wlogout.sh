#!/bin/bash

ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
if [ "$ACTIVE_MONITOR" == "HDMI-A-1" ]; then
    wlogout -m 450 --buttons-per-row 5 --css ~/.config/wlogout/style-wide.css
else
    wlogout -L 20 -R 20 -T 250 -B 250 --buttons-per-row 5 --css ~/.config/wlogout/style-internal.css
fi
