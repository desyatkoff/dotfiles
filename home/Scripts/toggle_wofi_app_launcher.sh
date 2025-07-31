#!/usr/bin/env bash

# Wofi app launcher toggle script


if pgrep -x "wofi" > /dev/null; then
    killall wofi
fi

wofi --prompt "Applications" --show drun --sort-order alphabetical &
