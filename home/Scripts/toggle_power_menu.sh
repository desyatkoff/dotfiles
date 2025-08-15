#!/usr/bin/env bash

# Power menu script


if pgrep -x "rofi" > /dev/null; then
    killall rofi
else
    OPTION=$(printf "Lock\nHibernate\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -p "  Power")
    case "$OPTION" in
    Lock)
        hyprlock
        ;;
    Hibernate)
        systemctl hibernate
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
    Suspend)
        systemctl suspend
        ;;
    Reboot)
        sh ~/Scripts/reboot.sh
        ;;
    Shutdown)
        sh ~/Scripts/shutdown.sh
        ;;
    esac
fi
