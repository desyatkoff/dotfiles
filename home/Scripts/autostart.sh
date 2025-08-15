#!/usr/bin/env bash

# Autostart script


systemctl --user start hyprpolkitagent

wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

swaync &
swaync-client -df

if [[ "$(cut -d . -f 1 /proc/uptime)" -lt 60 ]]; then
    hyprlock

    while pgrep -x hyprlock >/dev/null; do
        sleep 0.1;
    done
fi

sh ~/Scripts/dynamic_wallpapers.sh &

sleep 1.5

waybar &

hydock &

sleep 1.5

notify-send \
    -a "System" \
    -i "mx-welcome" \
    "System" \
    "Welcome back, $USER\!"
