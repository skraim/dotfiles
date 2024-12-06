#!/bin/bash

source "$HOME/states"

case $KB_LAYOUT in
    "qwerty")
        hyprctl --batch "keyword input:kb_variant , ; keyword input:kb_layout us,ua"
        ;;
    "colemak")
        hyprctl --batch "keyword input:kb_variant ,colemak-rev ; keyword input:kb_layout us,ua"
        ;;
    "graphite")
        hyprctl --batch "keyword input:kb_variant ,graphite-rev ; keyword input:kb_layout us,ua"
        ;;
esac
