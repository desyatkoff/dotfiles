#!/usr/bin/env bash

# Dynamic wallpapers switcher script for SWWW


MORNING=6
DAY=10
EVENING=18
NIGHT=22

period="day"

update_period() {
    local current_hour=$(date +%H)

    if [ $current_hour -ge $MORNING ] && [ $current_hour -lt $DAY ]; then
        period="morning"
    elif [ $current_hour -ge $DAY ] && [ $current_hour -lt $EVENING ]; then
        period="day"
    elif [ $current_hour -ge $EVENING ] && [ $current_hour -lt $NIGHT ]; then
        period="evening"
    elif [ $current_hour -ge $NIGHT ] || [ $current_hour -lt $MORNING ]; then
        period="night"
    fi
}

if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1
fi

update_period

swww img --transition-type=center --transition-step=30 --transition-duration=1 --transition-fps=60 "$HOME/Wallpapers/$period.png"

while true; do
    old_period=$period

    update_period

    if [ "$old_period" != "$period" ]; then
        swww img --transition-type=fade --transition-step=60 --transition-duration=10 --transition-fps=60 "$HOME/Wallpapers/$period.png"
    fi

    sleep $(( (3600 - $(date +%M) * 60 - $(date +%S)) ))
done
