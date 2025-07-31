#!/usr/bin/env bash

# Shutdown PC script


windows=$(hyprctl clients -j | jq -r '.[] | .address')

for window in $windows; do
    hyprctl dispatch movetoworkspacesilent special:magic, address:$window
done

swaync-client -df

notify-send \
    -a "System" \
    -i "system-shutdown" \
    "System" \
    "Goodbye, $USER\! Shutting down..."

sleep 2

killall swaync
killall waybar

swww img \
    --transition-type=outer \
    --transition-step=30 \
    --transition-duration=1 \
    --transition-fps=60 0x111111

sleep 1

systemctl poweroff
