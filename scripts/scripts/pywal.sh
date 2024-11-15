#!/bin/sh

if [ -n "$WAYLAND_DISPLAY" ]; then
    wal -a 92 -i ~/Pictures/wallpapers/ -n
    walogram -B
    hyprctl hyprpaper preload "$(< "${HOME}/.cache/wal/wal")" 
    hyprctl hyprpaper wallpaper "HDMI-A-1,$(< "${HOME}/.cache/wal/wal")" 
    hyprctl hyprpaper wallpaper "eDP-1,$(< "${HOME}/.cache/wal/wal")" 
else
    wal -i ~/Pictures/wallpapers/ -e
    walogram -B
fi
