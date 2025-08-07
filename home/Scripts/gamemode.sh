#!/usr/bin/env bash

# Gamemode toggle script


HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = 1 ]; then
    sleep 1

    killall hydock
    killall waybar
    killall swww-daemon

    hyprctl --batch " \
        keyword animations:enabled 0; \
        keyword decoration:shadow:enabled 0; \
        keyword decoration:blur:enabled 0; \
        keyword general:gaps_in 0; \
        keyword general:gaps_out 0; \
        keyword general:border_size 1; \
        keyword decoration:rounding 0"

    notify-send \
        -a "Game Mode" \
        -i "qjoypad-tray" \
        "Game Mode" \
        "Enabled"

    swaync-client -dn

    exit
else
    swww-daemon &
    waybar &
    hydock &

    swaync-client -df

    notify-send \
        -a "Game Mode" \
        -i "qjoypad-tray" \
        "Game Mode" \
        "Disabled"
fi

hyprctl reload
