#!/usr/bin/env bash

# Waybar toggle script


if pgrep -x "waybar" > /dev/null; then
    pkill -x waybar
else
    waybar &
fi
