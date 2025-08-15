#!/usr/bin/env bash

# Float, resize, center script


hyprctl dispatch togglefloating
hyprctl dispatch resizeactive exact 50% 50%
hyprctl dispatch centerwindow
