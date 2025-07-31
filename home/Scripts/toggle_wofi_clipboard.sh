#!/usr/bin/env bash

# Wofi clipboard toggle script


if pgrep -x "wofi" > /dev/null; then
    killall wofi
fi

cliphist list | wofi --prompt "Clipboard" --dmenu | cliphist decode | wl-copy
