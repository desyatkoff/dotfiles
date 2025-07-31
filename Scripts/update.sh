#!/usr/bin/env bash

# General system cleanup script


yay -Suy

for package in $(yay -Qdtt); do
    yay -Rns "$package" --confirm
done

yay -Scc

sudo rm -rf /var/cache/pacman/pkg/*
sudo rm -rf /var/cache/yay/*
