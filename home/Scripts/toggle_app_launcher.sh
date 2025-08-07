#!/usr/bin/env bash

# App launcher toggle script


if pgrep -x "rofi" > /dev/null; then
    killall rofi
else
    rofi -show drun &
fi
