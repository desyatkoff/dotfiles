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
swww img --resize=fit --transition-type=center --transition-step=30 --transition-duration=1 --transition-fps=60 ~/Wallpapers/default.png &
sleep 1 && waybar &
