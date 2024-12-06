#!/bin/bash

DAC=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "tshort-dactyl-manuform-(5x6)s") | .active_keymap')
ZSA=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "zsa-technology-labs-voyager") | .active_keymap')
INT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap')
BKB=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "bastard-keyboards-skeletyl-splinky") | .active_keymap')
CORNE=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "corne-keyboard") | .active_keymap')

CURRENT="${CORNE:-${ZSA:-${BKB:-${DAC:-$INT}}}}"

case $CURRENT in
    "Ukrainian")
        echo "🇺🇦Q"
        ;;
    "Ukrainian (Colemak reverse)")
        echo "🇺🇦C"
        ;;
    "Ukrainian (Graphite reverse)")
        echo "🇺🇦"
        ;;
    "English (US)")
        echo "🇺🇸"
        ;;
    *)
        echo "$CURRENT"
        ;;
esac
