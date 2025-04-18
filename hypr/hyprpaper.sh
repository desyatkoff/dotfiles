#!/usr/bin/env bash

# Wallpaper switcher for Hyprpaper


WP_DIR="/usr/share/hypr"
MAX_WPS=3
WP_IDX_FILE="$HOME/.config/hypr/wp_idx"

if [ -f "$WP_IDX_FILE" ]; then
    WP_IDX=$(cat "$WP_IDX_FILE")
else
    WP_IDX=0
fi

NEXT_WP_IDX=$(( (WP_IDX + 1) % MAX_WPS ))
WP="$WP_DIR/wall$NEXT_WP_IDX.png"

hyprctl hyprpaper wallpaper ", $WP"

echo "$NEXT_WP_IDX" > "$WP_IDX_FILE"

