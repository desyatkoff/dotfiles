#!/usr/bin/env bash

# Wofi calculator toggle script


if pgrep -x "wofi" > /dev/null; then
    killall wofi
fi

EXPRESSION=$(wofi --prompt "Calculator" --show dmenu --insensitive --sort-order default --columns 0)
RESULT=$(( EXPRESSION ))

if [ -n "$EXPRESSION" ]; then
    wl-copy "$RESULT"

    if [ "$(swaync-client -D)" == "true" ]; then
        swaync-client -df
    fi

    notify-send \
        -a "Calculator" \
        -i "calc" \
        -e \
        "Calculator" \
        "$EXPRESSION = $RESULT"
fi

exit
