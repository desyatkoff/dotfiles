#!/usr/bin/env bash

# Clipboard toggle script


if pgrep -x "rofi" > /dev/null; then
    killall rofi
else
    cliphist list | rofi -dmenu -p "󱉧  Clipboard" | cliphist decode | wl-copy
fi
