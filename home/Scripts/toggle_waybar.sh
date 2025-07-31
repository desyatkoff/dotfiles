#!/usr/bin/env bash

# Waybar toggle script


if pgrep -x "waybar" > /dev/null; then
    killall waybar
else
    waybar &
fi
