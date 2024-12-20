#!/bin/sh

attempt=0
limit=5

while [ "$result" != "ok" ] && [ "$attempt" -le "$limit" ]; do
    sleep 0.5
    result=$(hyprctl hyprpaper preload "$(< "${HOME}/.cache/wal/wal")")
    attempt=$((attempt+1))
done

if [ "$attempt" -le "$limit" ]; then
    hyprctl hyprpaper wallpaper "HDMI-A-1,$(< "${HOME}/.cache/wal/wal")"
    hyprctl hyprpaper wallpaper "eDP-1,$(< "${HOME}/.cache/wal/wal")"
    systemctl --user restart dunst
fi
