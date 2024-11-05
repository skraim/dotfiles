#!/bin/sh

updates_arch=$(checkupdates 2>/dev/null | wc -l)

if [ -n "$WAYLAND_DISPLAY" ]; then
    if [ $updates_arch != 0 ]; then
        echo "{\"text\":\"$updates_arch\",\"class\":\"updates\"}";
    else
        echo "{\"text\":\"\",\"class\":\"updated\"}";
    fi
else
    source "${HOME}/.cache/wal/colors.sh"
    if [ $updates_arch != 0 ]; then
        echo "%{F$color6}$updates_arch ";
    else
        echo "%{F$color3} ";
    fi
fi
