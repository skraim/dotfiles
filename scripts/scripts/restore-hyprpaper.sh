#!/bin/sh

is_process_running() {
    pgrep -x "hyprpaper" > /dev/null
}

if ! is_process_running; then
    hyprpaper &
    ~/scripts/post-pywal.sh
fi

