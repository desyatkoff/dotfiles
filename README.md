# Dotfiles

## Description

This repository stores my dotfiles that I personally use

> [!NOTE]
> **If you don't use display manager (GDM, SDDM, etc):** move `autologin.conf` to the `/etc/systemd/system/getty@tty1.service.d/` directory and edit this file, you should change "YOUR_USERNAME" to your actual username
>
> **If you do:** remove Hyprlock from Hyprland autostart (`hypr/hyprland/autostart.sh`) to avoid being asked for the password even after logging in using display manager

Please, check the `install.sh` script before launching it

## Features

* Simple & lightweight
* Smooth animations
* Modular structure (all settings are split into many different config files)
* Configurations for:
    + Cava
    + Fastfetch
    + Helix
    + Hypr things (Hyprland, Hyprlock)
    + Kitty
    + Peaclock
    + Superfile
    + Waybar
        - Application launcher
        - Workspaces
        - Clock
        - System tray
        - Sound volume
        - Temperature
        - CPU usage
        - RAM usage
        - Power menu button
            - Shutdown
            - Reboot
            - Lock
    + SWWW + Waypaper
    + Wofi
* Useful shortcuts:
    + `Super` + `Enter` -> Launch Kitty
    + `Super` + `Q` -> Close current window
    + `Super` + `L` -> Lock
    + `Super` + `X` -> Power menu
    + `Super` + `E` -> Launch Superfile
    + `Super` + `B` -> Launch Firefox
    + `Super` + `F` -> Toggle floating mode
    + `Super` + `SHIFT` + `F` -> Toggle fullscreen mode
    + `Super` + `A` -> Open application launcher
    + `Super` + `V` -> Open clipboard
    + `Super` + `.` -> Open emoji picker
    + `Super` + `W` -> Toggle Waybar
    + `Print Screen` -> Take a screenshot
    + `Shift` + `Print Screen` -> Take a screenshot and edit before saving (crop, draw, blur, etc...)
    + And much more convenient things. Other shortcuts you can see in `hypr/hyprland/binds.conf`
* Also the best feature is... The excellence of minimalistic Arch Linux Hyprland :)

## Preview

![](preview.png)
