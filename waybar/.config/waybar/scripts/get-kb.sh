#!/bin/bash

ZSA=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "zsa-technology-labs-voyager") | .active_keymap')
INT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap')
BKB=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "bastard-keyboards-skeletyl-splinky") | .active_keymap')
CHOCOFI=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "corne-keyboard") | .active_keymap')
TOTEM=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "totem-keyboard") | .active_keymap')
SKELETYL=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "zmk-project-skeletyl-keyboard") | .active_keymap')

CURRENT="${TOTEM:-${CHOCOFI:=${SKELETYL:-${ZSA:-${BKB:-$INT}}}}}"

case $CURRENT in
    "Ukrainian")
        echo "🇺🇦Q"
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
