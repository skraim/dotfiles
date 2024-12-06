#!/usr/bin/env bash

killall -q polybar

sleep 1;
polybar --reload main &
polybar --reload small &
