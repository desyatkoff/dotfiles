#!/usr/bin/env bash


if [ -d ~/.config/alacritty/ ]; then
    mv -v ~/.config/alacritty/ \
        ~/.config/alacritty-old/
fi

if [ -d ~/.config/fastfetch/ ]; then
    mv -v ~/.config/fastfetch/ \
        ~/.config/fastfetch-old/
fi

if [ -d ~/.config/hypr/ ]; then
    mv -v ~/.config/hypr/ \
        ~/.config/hypr-old/
fi

if [ -d ~/.config/wofi/ ]; then
    mv -v ~/.config/wofi/ \
        ~/.config/wofi-old/
fi

mkdir -v ~/.config/alacritty/

mkdir -v ~/.config/fastfetch/

mkdir -v ~/.config/hypr/

mkdir -v ~/.config/wofi/

cp -v alacritty/* \
    ~/.config/alacritty/

cp -v fastfetch/* \
    ~/.config/fastfetch/

cp -v hypr/* \
    ~/.config/hypr/

cp -v wofi/* \
    ~/.config/wofi/

