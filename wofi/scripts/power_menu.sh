#!/usr/bin/env bash

# Power menu script for Wofi


case $(printf "1. Shutdown\n2. Reboot\n3. Lock" | wofi --dmenu --insensitive --sort-order alphabetical) in
    "1. Shutdown" ) killall waybar && swww img --resize=fit --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111 && sleep 1 && systemctl poweroff ;;
    "2. Reboot" ) killall waybar && swww img --resize=fit --transition-type=outer --transition-step=30 --transition-duration=1 --transition-fps=60 0x111111 && sleep 1 && systemctl reboot ;;
    "3. Lock" ) hyprlock ;;
    * ) exit 1 ;;
esac
