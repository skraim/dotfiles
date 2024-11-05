#!/usr/bin/env bash

STATE_FILE="$HOME/scripts/force_qwerty_state"

if [[ -f "$STATE_FILE" ]]; then
    FORCE_QWERTY=$(cat "$STATE_FILE")
else
    FORCE_QWERTY="0"
fi

if [[ "$FORCE_QWERTY" -eq "0" ]]; then
    hyprctl keyword input:kb_variant ,
    hyprctl keyword input:kb_layout us,ua
    echo "1" > "$STATE_FILE"
else
    hyprctl keyword input:kb_variant ,colemak_reverse
    hyprctl keyword input:kb_layout us,uac
    echo "0" > "$STATE_FILE"
fi
