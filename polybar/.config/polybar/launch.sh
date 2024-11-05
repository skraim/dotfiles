#!/usr/bin/env bash

killall -q polybar

sleep 1;
polybar --reload main >> ~/polybar-startup.logs &
polybar --reload small >> ~/polybar-startup.logs &

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main &
#   done
# else
#   polybar --reload main & polybar --reload small &
# fi
