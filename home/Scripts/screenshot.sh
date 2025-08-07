#!/usr/bin/env bash

# Screenshot script


SAVE_DIR="$HOME/Pictures/Screenshots"
SAVE_NAME=$(date +'%Y-%m-%d_%H-%M-%S')
SAVE_PATH="$SAVE_DIR/$SAVE_NAME.png"

grim -l 0 -c - | satty --filename - --output-filename "$SAVE_PATH"

if [ -f "$SAVE_PATH" ]; then
    notify-send \
        -a "Screenshot" \
        -i "applets-screenshooter" \
        "Screenshot" \
        "$SAVE_PATH"
fi
