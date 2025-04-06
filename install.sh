#!/usr/bin/env bash


if [ -d ~/.config/cava/ ]; then
    mv -v ~/.config/cava/ \
        ~/.config/cava-old/
fi

if [ -d ~/.config/fastfetch/ ]; then
    mv -v ~/.config/fastfetch/ \
        ~/.config/fastfetch-old/
fi

if [ -d ~/.config/hypr/ ]; then
    mv -v ~/.config/hypr/ \
        ~/.config/hypr-old/
fi

if [ -d ~/.config/kitty/ ]; then
    mv -v ~/.config/kitty/ \
        ~/.config/kitty-old/
fi

if [ -d ~/.config/peaclock/ ]; then
    mv -v ~/.config/peaclock/ \
        ~/.config/peaclock-old/
fi

if [ -d ~/.config/wofi/ ]; then
    mv -v ~/.config/wofi/ \
        ~/.config/wofi-old/
fi

mkdir -v ~/.config/cava/

mkdir -v ~/.config/fastfetch/

mkdir -v ~/.config/hypr/

mkdir -v ~/.config/kitty/

mkdir -v ~/.config/peaclock/

mkdir -v ~/.config/wofi/


cp -v cava/* \
    ~/.config/cava/

cp -v fastfetch/* \
    ~/.config/fastfetch/

cp -v hypr/* \
    ~/.config/hypr/

cp -v kitty/* \
    ~/.config/kitty/

cp -v peaclock/* \
    ~/.config/peaclock/

cp -v wofi/* \
    ~/.config/wofi/

