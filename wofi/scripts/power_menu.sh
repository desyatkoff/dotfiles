#!/usr/bin/env bash

# Power menu script for Wofi


case $(printf "1. Shutdown\n2. Reboot\n3. Lock" | wofi --dmenu --sort-order alphabetical) in
    "1. Shutdown" ) pkill -x waybar && swww img --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111 && sleep 1 && systemctl poweroff ;;
    "2. Reboot" ) pkill -x waybar && swww img --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111 && sleep 1 && systemctl reboot ;;
    "3. Lock" ) hyprlock ;;
    * ) exit 1 ;;
esac
