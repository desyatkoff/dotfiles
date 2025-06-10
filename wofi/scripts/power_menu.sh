#!/usr/bin/env bash

# Power menu script for Wofi


case_shutdown() {
    local windows=$(hyprctl clients -j | jq -r '.[] | .address')

    for window in $windows; do
        hyprctl dispatch movetoworkspacesilent special:magic, address:$window
    done

    pkill -x waybar

    swww img --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111

    sleep 1

    systemctl poweroff
}

case_reboot() {
    local windows=$(hyprctl clients -j | jq -r '.[] | .address')

    for window in $windows; do
        hyprctl dispatch movetoworkspacesilent special:magic, address:$window
    done

    pkill -x waybar

    swww img --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111

    sleep 1

    systemctl reboot
}

case_lock() {
    hyprlock
}

case $(printf "1. Shutdown\n2. Reboot\n3. Lock" | wofi --dmenu --sort-order alphabetical) in
    "1. Shutdown" ) case_shutdown ;;
    "2. Reboot" ) case_reboot ;;
    "3. Lock" ) case_lock ;;
    * ) exit 1 ;;
esac
