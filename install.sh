#!/usr/bin/env bash


#########################################################
#                                                       #
#  INSTALLER SCRIPT FOR GITHUB.COM/DESYATKOFF DOTFILES  #
#                                                       #
#########################################################


# 0. Before installation

# Warning!
# You can continue only if you already have Hyprland and all its dependencies installed


# 1. Install required packages (if you remove or change something, you should edit all the configs as well)

sudo pacman -S --needed \
    cava \
    cliphist \
    fastfetch \
    firefox \
    grim \
    helix \
    hyprlock \
    hyprpicker \
    peaclock \
    satty \
    superfile \
    swww \
    wl-clipboard \
    waybar \
    waypaper \
    wofi \
    wofi-emoji


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

if [ -d ~/.config/peaclock/ ]; then
    mv -v \
        ~/.config/peaclock/ \
        ~/.config/peaclock-old/
fi

if [ -d ~/.config/superfile/ ]; then
    mv -v \
        ~/.config/superfile/
        ~/.config/superfile-old/
fi

if [ -d ~/.config/waybar/ ] then
    mv -v \
        ~/.config/waybar/ \
        ~/.config/waybar-old/
fi

if [ -d ~/.config/waypaper/ ] then
    mv -v \
        ~/.config/waypaper/ \
        ~/.config/waypaper-old/
fi

if [ -d ~/.config/wofi/ ]; then
    mv -v \
        ~/.config/wofi/ \
        ~/.config/wofi-old/
fi

if [ -f ~/.bash_profile ]; then
    mv -v \
        ~/.bash_profile \
        ~/.bash_profile-old
fi

# 3. Create special directories for the new configs

mkdir -v ~/.config/cava/

mkdir -v ~/.config/fastfetch/

mkdir -v ~/helix/

mkdir -v ~/.config/hypr/

mkdir -v ~/.config/kitty/

mkdir -v ~/.config/peaclock/

mkdir -v ~/.config/superfile/

mkdir -v ~/.config/waybar/

mkdir -v ~/.config/waypaper/

mkdir -v ~/.config/wofi/

mkdir -v ~/Wallpapers/

sudo mkdir -v -p /etc/systemd/system/getty@tty1.service.d/


# 4. Copy the new configs

cp -v \
    ./cava/* \
    ~/.config/cava/

cp -v \
    ./fastfetch/* \
    ~/.config/fastfetch/

cp -v \
    ./helix/* \
    ~/.config/helix/

cp -v \
    ./hypr/* \
    ~/.config/hypr/

cp -v \
    ./kitty/* \
    ~/.config/kitty/

cp -v \
    ./peaclock/* \
    ~/.config/peaclock/

cp -v \
    ./superfile/* \
    ~/.config/superfile/

cp -v \
    ./waybar/* \
    ~/.config/waybar/

cp -v \
    ./waypaper/* \
    ~/.config/waypaper/

cp -v \
    ./wofi/* \
    ~/.config/wofi/

cp -v \
    ./Wallpapers/* \
    ~/Wallpapers/

cp -v \
    ./.bash_profile \
    ~/.bash_profile

sudo cp -v \
    ./autologin.conf \
    /etc/systemd/system/getty@tty1.service.d/


# 5. After installation

systemctl reboot

# Success!
# Enjoy your new clean Hyprland setup with my personal dotfiles that I use every day
