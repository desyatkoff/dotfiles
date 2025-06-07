#!/usr/bin/env bash

# Dynamic wallpapers switcher script for SWWW


MORNING=6
DAY=12
EVENING=18
NIGHT=0

while true; do
    current_hour=$(date +%H)

    if [ $current_hour -ge $MORNING ] && [ $current_hour -lt $DAY ]; then
        period="morning"
    elif [ $current_hour -ge $DAY ] && [ $current_hour -lt $EVENING ]; then
        period="day"
    elif [ $current_hour -ge $EVENING ] && [ $current_hour -lt $NIGHT ]; then
        period="evening"
    elif [ $current_hour -ge $NIGHT ] || [ $current_hour -lt $MORNING ]; then
        period="night"
    fi

    swww img --resize=fit --transition-type=center --transition-step=30 --transition-duration=1 --transition-fps=60 "$HOME/Wallpapers/$period.png"

    sleep 3600
done
