#!/usr/bin/env bash

# Hydock toggle script


if pgrep -x "hydock" > /dev/null; then
    killall hydock
else
    hydock &
fi
