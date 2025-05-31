#!/usr/bin/env bash

# Wallpaper switcher for Hyprpaper


WP_DIR="$HOME/Wallpapers/"
WP_IDX_FILE="$HOME/.config/hypr/hyprpaper_index.txt"
WPS=($(find "$WP_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) | sort))
WP_COUNT=${#WPS[@]}

if [[ -f "$WP_IDX_FILE" ]]; then
    CURRENT_IDX=$(<"$WP_IDX_FILE")
else
    CURRENT_IDX=0
fi

DIRECTION="next"

if [[ "$1" == "--previous" ]]; then
    DIRECTION="previous"
fi

if [[ "$DIRECTION" == "next" ]]; then
    NEXT_IDX=$(( (CURRENT_IDX + 1) % WP_COUNT ))
else
    NEXT_IDX=$(( (CURRENT_IDX - 1 + WP_COUNT) % WP_COUNT ))
fi

echo "$NEXT_IDX" > "$WP_IDX_FILE"

WP="${WPS[$NEXT_IDX]}"

hyprctl hyprpaper reload ", $WP"
