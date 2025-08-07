#!/usr/bin/env bash

# Reboot PC script


windows=$(hyprctl clients -j | jq -r '.[] | .address')

for window in $windows; do
    hyprctl dispatch movetoworkspacesilent special:magic, address:$window
done

swaync-client -df

notify-send \
    -a "System" \
    -i "system-reboot" \
    "System" \
    "Rebooting..."

sleep 2

killall swaync
killall hydock
killall waybar

swww img \
    --transition-type=outer \
    --transition-step=30 \
    --transition-duration=1 \
    --transition-fps=60 0x111111

sleep 1

systemctl reboot
