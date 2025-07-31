#!/usr/bin/env bash

# Color picker script

color=$(hyprpicker --autocopy --lowercase-hex)

if [ -n "$color" ]; then
    notify-send \
        -a "Color Picker" \
        -i "color-select" \
        "Color Picker" \
        "$color"
fi
