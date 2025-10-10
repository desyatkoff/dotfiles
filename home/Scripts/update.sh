#!/usr/bin/env bash

# General system cleanup script


if ! command -v yay &>/dev/null; then
    if ! command -v sudo &>/dev/null; then
        alias yay="doas pacman"
    else
        alias yay="sudo pacman"
    fi
fi

yay -Suy

for package in $(yay -Qdqtt); do
    yay -Rnsu "$package" --confirm
done

yay -Scc
