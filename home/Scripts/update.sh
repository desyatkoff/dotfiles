#!/usr/bin/env bash

# General system cleanup script


if ! command -v sudo &>/dev/null; then
    alias sudo="doas"
fi

sudo pacman -Suy

for package in $(pacman -Qdqtt); do
    sudo pacman -Rnsu "$package" --confirm
done

sudo pacman -Scc
