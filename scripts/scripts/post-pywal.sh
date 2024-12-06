#!/bin/sh

sleep 1;
hyprctl hyprpaper preload "$(< "${HOME}/.cache/wal/wal")" 
hyprctl hyprpaper wallpaper "HDMI-A-1,$(< "${HOME}/.cache/wal/wal")" 
hyprctl hyprpaper wallpaper "eDP-1,$(< "${HOME}/.cache/wal/wal")" 
systemctl --user restart dunst
