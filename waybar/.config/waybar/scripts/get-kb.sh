#!/bin/bash

DAC=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "tshort-dactyl-manuform-(5x6)s") | .active_keymap')
ZSA=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "zsa-technology-labs-voyager") | .active_keymap')
INT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap')
BKB=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "bastard-keyboards-skeletyl-splinky") | .active_keymap')
if [ -n "$DAC" ]; then
    CURRENT="$DAC"
else
    if [ -n "$ZSA" ]; then
        CURRENT="$ZSA"
    else
        if [ -n "$BKB" ]; then
            CURRENT="$BKB"
        else
            CURRENT="$INT"
        fi
    fi
fi
case $CURRENT in
    "Ukrainian")
        echo "🇺🇦(qwerty)"
        ;;
    "Ukrainian (colemak reverse)")
        echo "🇺🇦"
        ;;
    "English (US)")
        echo "🇺🇸"
        ;;
    *)
        echo "🚩"
        ;;
esac
