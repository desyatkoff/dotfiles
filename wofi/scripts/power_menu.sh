#!/usr/bin/env bash

# Power menu script for Wofi


case $(printf "1. Shutdown\n2. Reboot\n3. Lock" | wofi --dmenu --insensitive --sort-order alphabetical) in
    "1. Shutdown" ) systemctl poweroff ;;
    "2. Reboot" ) systemctl reboot ;;
    "3. Lock" ) hyprlock ;;
    * ) exit 1 ;;
esac
