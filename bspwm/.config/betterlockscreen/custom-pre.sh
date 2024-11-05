#!/usr/bin/env bash

xkb-switch -s us &
playerctl pause &
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause &
