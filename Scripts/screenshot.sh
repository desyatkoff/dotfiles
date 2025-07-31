#!/usr/bin/env bash

# Screenshot script


grim -l 0 -c - | satty --filename - --fullscreen --output-filename "$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"

notify-send \
    -a "Screenshot" \
    -i "applets-screenshooter" \
    "Screenshot" \
    "New screenshot was taken"
