#!/usr/bin/env bash

# Color picker script

COLOR=$(hyprpicker --autocopy --lowercase-hex)

if [ -n "$COLOR" ]; then
    notify-send \
        -a "Color Picker" \
        -i "color-select" \
        "Color Picker" \
        "$COLOR"
fi
