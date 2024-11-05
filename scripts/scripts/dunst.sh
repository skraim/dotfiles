#!/bin/bash

COUNT=$(dunstctl count waiting)
ENABLED=󰂚
DISABLED=󰂛
if [ $COUNT != 0 ]; then DISABLED="󰂛 $COUNT"; fi
if [ -n "$WAYLAND_DISPLAY" ]; then
    if dunstctl is-paused | grep -q "false" ; then
        echo "{\"text\":\"$ENABLED\",\"class\":\"enabled\"}";
    else
        echo "{\"text\":\"$DISABLED\",\"class\":\"disabled\"}";
    fi
else
    source "${HOME}/.cache/wal/colors.sh"
    if dunstctl is-paused | grep -q "false" ; then
        echo "%{F$color6}$ENABLED";
    else
        echo "%{F#f55}$DISABLED";
    fi
fi
