#!/usr/bin/env bash

# Wallpaper switcher toggle script


if pgrep -x "rofi" > /dev/null; then
    killall rofi
else
    WP="$(find ~/Pictures/Wallpapers -type f | xargs -n1 basename | rofi -dmenu -p "  Wallpaper" | cut -d ' ' -f 1 | tr -d '\n')"

    if [ -n "$WP" ]; then
        swww img --transition-type=center --transition-step=255 --transition-duration=1 --transition-fps=60 ~/Pictures/Wallpapers/$WP

        notify-send \
            -a "Wallpaper" \
            -i "preferences-desktop-wallpaper" \
            "Wallpaper" \
            "$WP"
    fi
fi
