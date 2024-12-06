#!/bin/bash

battery_level=$(cat /sys/class/power_supply/BAT*/capacity)

if [[ "$battery_level" -ge 90 ]]; then
    icon="󰁹"
elif [[ "$battery_level" -ge 80 ]]; then
    icon="󰂂"
elif [[ "$battery_level" -ge 70 ]]; then
    icon="󰂁"
elif [[ "$battery_level" -ge 60 ]]; then
    icon="󰂀"
elif [[ "$battery_level" -ge 50 ]]; then
    icon="󰁿"
elif [[ "$battery_level" -ge 40 ]]; then
    icon="󰁾"
elif [[ "$battery_level" -ge 30 ]]; then
    icon="󰁽"
elif [[ "$battery_level" -ge 20 ]]; then
    icon="󰁼"
elif [[ "$battery_level" -ge 10 ]]; then
    icon="󰁻"
else
    icon="󰂎"
fi

echo "$icon$battery_level"
