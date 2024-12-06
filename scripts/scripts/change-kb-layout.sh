#!/bin/bash

STATES="$HOME/states"
source "$STATES"

case $1 in
    "qwerty")
        hyprctl --batch "keyword input:kb_variant , ; keyword input:kb_layout us,ua"
        sed -i "s/^KB_LAYOUT=.*/KB_LAYOUT=\"$1\"/" "$STATES"
        ;;
    "colemak")
        hyprctl --batch "keyword input:kb_variant ,colemak-rev ; keyword input:kb_layout us,ua"
        sed -i "s/^KB_LAYOUT=.*/KB_LAYOUT=\"$1\"/" "$STATES"
        ;;
    "graphite")
        hyprctl --batch "keyword input:kb_variant ,graphite-rev ; keyword input:kb_layout us,ua"
        sed -i "s/^KB_LAYOUT=.*/KB_LAYOUT=\"$1\"/" "$STATES"
        ;;
    *)
        echo "Wrong param; should be qwerty, colemak or graphite"
esac
