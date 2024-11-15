#!/usr/bin/env bash

if [ -n "$WAYLAND_DISPLAY" ]; then
    hyprctl keyword monitor HDMI-A-1,3440x1440,1280x-500,auto
else
    xrandr --output eDP1 --mode 1920x1200 --pos 0x120 --rotate normal --output HDMI1 --primary --mode 3440x1440 --pos 1920x0 --rotate normal
fi
