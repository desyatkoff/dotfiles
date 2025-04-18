#!/usr/bin/env bash


##############################################
#                                            #
#  INSTALLER SCRIPT FOR DESYATKOFF DOTFILES  #
#                                            #
##############################################


# 0. Before installation

# Warning!
# You can continue only if you already have Hyprland and all its dependencies installed


# 1. Install required packages (if you change something, you should edit all the configs as well)

sudo pacman -S --needed \
    grim \
    slurp \
    swappy \
    hyprpaper \
    cava \
    fastfetch \
    helix \
    kitty \
    mako \
    peaclock \
    wofi \
    cliphist \
    nnn \
    firefox


# 2. Rename old configs so you can restore your old settings if needed

if [ -d ~/.config/cava/ ]; then
    mv -v \
        ~/.config/cava/ \
        ~/.config/cava-old/
fi

if [ -d ~/.config/fastfetch/ ]; then
    mv -v \
        ~/.config/fastfetch/ \
        ~/.config/fastfetch-old/
fi

if [ -d ~/.config/helix/ ]; then
    mv -v \
        ~/.config/helix/ \
        ~/.config/helix-old/
fi

if [ -d ~/.config/hypr/ ]; then
    mv -v \
        ~/.config/hypr/ \
        ~/.config/hypr-old/
fi

if [ -d ~/.config/kitty/ ]; then
    mv -v \
        ~/.config/kitty/ \
        ~/.config/kitty-old/
fi

if [ -d ~/.config/mako/ ]; then
    mv -v \
        ~/.config/mako/ \
        ~/.config/mako-old/
fi

if [ -d ~/.config/peaclock/ ]; then
    mv -v \
        ~/.config/peaclock/ \
        ~/.config/peaclock-old/
fi

if [ -d ~/.config/wofi/ ]; then
    mv -v \
        ~/.config/wofi/ \
        ~/.config/wofi-old/
fi


# 3. Create special directories for the new configs

mkdir -v ~/.config/cava/

mkdir -v ~/.config/fastfetch/

mkdir -v ~/helix/

mkdir -v ~/.config/hypr/

mkdir -v ~/.config/kitty/

mkdir -v ~/.config/mako/

mkdir -v ~/.config/peaclock/

mkdir -v ~/.config/wofi/


# 4. Copy the new configs

cp -v \
    cava/* \
    ~/.config/cava/

cp -v \
    fastfetch/* \
    ~/.config/fastfetch/

cp -v \
    helix/* \
    ~/.config/helix/

cp -v \
    hypr/* \
    ~/.config/hypr/

cp -v \
    kitty/* \
    ~/.config/kitty/

cp -v \
    mako/* \
    ~/.config/mako/

cp -v \
    peaclock/* \
    ~/.config/peaclock/

cp -v \
    wofi/* \
    ~/.config/wofi/


# 5. After installation

# Success!
# Enjoy your new clean Hyprland setup with my personal dotfiles that I use every day

