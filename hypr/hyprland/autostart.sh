#!/usr/bin/env bash

# Autostart script for Hyprland


systemctl --user start hyprpolkitagent
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

hyprlock
while pgrep -x hyprlock >/dev/null; do
    sleep 0.1
done

swww-daemon &
sh ~/Wallpapers/dynamic_wallpapers.sh &
sleep 1 && waybar &
