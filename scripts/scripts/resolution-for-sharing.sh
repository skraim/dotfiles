#!/usr/bin/env bash

if [ -n "$WAYLAND_DISPLAY" ]; then
    hyprctl keyword monitor HDMI-A-1,1920x1080,auto-right,auto
else
    xrandr --output eDP1 --mode 1920x1200 --pos 0x120 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
fi
