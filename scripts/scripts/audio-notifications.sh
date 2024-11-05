#!/usr/bin/env bash

action=$1
wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
