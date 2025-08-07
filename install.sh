#!/usr/bin/env bash


#########################################################
#                                                       #
#  INSTALLER SCRIPT FOR GITHUB.COM/DESYATKOFF DOTFILES  #
#                                                       #
#########################################################


# 0. Pre-installation preparations

clear

set -euo pipefail

IFS=$'\n\t'

REQUIRED_PACKAGES=(
    "btop"
    "catppuccin-gtk-theme-mocha"
    "cava"
    "cliphist"
    "fastfetch"
    "firefox"
    "fzf"
    "grim"
    "gvfs"
    "helix"
    "hyprland"
    "hyprlock"
    "hyprpicker"
    "hyprpolkitagent"
    "jq"
    "kitty"
    "lazygit"
    "lsd"
    "mpv"
    "noto-fonts"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "papirus-icon-theme"
    "peaclock"
    "rofi"
    "rofi-calc"
    "rofi-emoji"
    "satty"
    "swaync"
    "swww"
    "thunar"
    "ttf-jetbrains-mono-nerd"
    "tumbler"
    "waybar"
    "wf-recorder"
    "wl-clipboard"
    "xdg-desktop-portal-hyprland"
    "zsh"
)

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
RESET="\033[0m"

log_ok() {
    sleep 0.25

    echo -en "${GREEN}[ OK      ]${RESET} $*"
}

log_fail() {
    sleep 0.25

    echo -en "${RED}[ FAIL    ]${RESET} $*"
}

log_warn() {
    sleep 0.25

    echo -en "${YELLOW}[ WARNING ]${RESET} $*"
}

log_info() {
    sleep 0.25

    echo -en "${BLUE}[ INFO    ]${RESET} $*"
}

log_ask() {
    sleep 0.25

    echo -en "${CYAN}[ CONFIRM ]${RESET} $*"
}

wait_dots() {
    for i in 3 2 1; do
        echo -n "."

        sleep 0.33
    done

    echo ""
}

log_info "     _                       _   _          __  __ \n"
log_info "  __| | ___  ___ _   _  __ _| |_| | _____  / _|/ _|\n"
log_info " / _\` |/ _ \\/ __| | | |/ _\` | __| |/ / _ \\| |_| |_ \n"
log_info "| (_| |  __/\\__ \\ |_| | (_| | |_|   < (_) |  _|  _|\n"
log_info " \\__,_|\\___||___/\\__, |\\__,_|\\__|_|\\_\\___/|_| |_|  \n"
log_info "                 |___/                             \n"
log_info "             _       _    __ _ _                   \n"
log_info "          __| | ___ | |_ / _(_) | ___  ___         \n"
log_info " _____   / _\` |/ _ \\| __| |_| | |/ _ \\/ __|  _____ \n"
log_info "|_____| | (_| | (_) | |_|  _| | |  __/\\__ \ |_____|\n"
log_info "         \\__,_|\\___/ \\__|_| |_|_|\\___||___/        \n"
log_info "\n"

log_info "Welcome to desyatkoff/dotfiles auto-install script. Note that it was tested on Arch Linux only!\n"

log_ask "Continue? [Y/n] "

read -rp "" confirm

if [[ "$confirm" =~ ^[Nn]$ ]]; then
    log_info "Aborting installation process"

    wait_dots

    log_ok "Goodbye\n"

    exit 0
else
    if ! command -v sudo &>/dev/null; then
        if ! command -v doas &>/dev/null; then
            log_warn "Could not find 'sudo' or 'doas'\n"

            log_fail "Aborting installation process. Please install 'sudo' or 'doas' first and then run this script again\n"

            exit 1
        else
            alias sudo="doas"
        fi
    fi

    if [[ "$EUID" -eq 0 ]]; then
        log_warn "This script is launched by root\n"

        log_fail "Aborting installation process. Please do not run this script as root! Use a normal user account\n"

        exit 1
    fi

    if [[ ! -d ".git" && ! -f "install.sh" ]]; then
        if [[ ! -d "dotfiles" ]]; then
            if ! command -v git &>/dev/null; then
                sudo pacman -S git
            fi

            git clone https://github.com/desyatkoff/dotfiles.git
        fi

        cd dotfiles/
    fi

    CLONE_DIR=$(pwd)
fi


# 1. Packages installation

log_info "Installing required packages"

wait_dots

if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git "$CLONE_DIR/yay/"

    cd "$CLONE_DIR/yay/"

    makepkg -si

    cd "$CLONE_DIR"
fi

yay -S --noconfirm --needed "${REQUIRED_PACKAGES[@]}"

RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$CLONE_DIR/fast-syntax-highlighting/"
git clone https://github.com/Aloxaf/fzf-tab.git "$CLONE_DIR/fzf-tab/"
git clone https://github.com/catppuccin/papirus-folders.git "$CLONE_DIR/papirus-folders/"

curl -LO https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders

chmod +x ./papirus-folders

bash <(curl -fsSL https://raw.githubusercontent.com/desyatkoff/hydock/main/install.sh)

log_ok "Packages installed\n"


# 2. Old configs backup creation

log_info "Backing up existing configs"

wait_dots

for thing in $CLONE_DIR/home/*; do
    target="$HOME/$(basename $thing)"

    if [[ -f "$target" || -d "$target" ]]; then
        mv -v \
            "$target" \
            "${target}-old"
    fi
done

log_ok "Backups are done\n"


# 3. Config files copying

log_info "Copying configs"

wait_dots

for thing in $CLONE_DIR/home/*; do
    target="$HOME/$(basename $thing)"

    cp -rv "$thing" "$target" 2>/dev/null || true
done

gsettings set org.gnome.desktop.wm.preferences button-layout ":"

cp -rv \
    "$CLONE_DIR/fast-syntax-highlighting/" \
    "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/"

zsh fast-theme -v XDG:catppuccin-mocha || true

cp -rv \
    "$CLONE_DIR/fzf-tab/" \
    "$HOME/.oh-my-zsh/custom/plugins/fzf-tab/"

cd "$CLONE_DIR/papirus-folders/"

sudo cp -rv ./src/* /usr/share/icons/Papirus/

./papirus-folders -C cat-mocha-blue --theme Papirus-Dark

cd "$CLONE_DIR"

echo "[Service]" > "$CLONE_DIR/autologin.conf"
echo "ExecStart=" >> "$CLONE_DIR/autologin.conf"
echo "ExecStart=-/usr/bin/agetty --autologin $(logname) --noclear %I \$TERM" >> "$CLONE_DIR/autologin.conf"

sudo cp -v \
    "$CLONE_DIR/autologin.conf" \
    "/etc/systemd/system/getty@tty1.service.d/autologin.conf"

log_ok "Configs are done\n"


# 4. Cleanup

log_info "Cleaning up\n"

log_info "Synchronizing packages"

wait_dots

yay -Suy --noconfirm

log_ok "Synchronizing is done\n"

log_info "Checking orphans"

wait_dots

orphans=$(yay -Qttdq 2>/dev/null || true)

if [[ -n "$orphans" ]]; then
    log_info "Found orphaned packages\n"

    log_info "The following orphaned packages were found:"

    echo "$orphans"

    log_ask "Remove them? [y/N] "

    read -rp "" remove_orphans

    if [[ "$remove_orphans" =~ ^[Yy]$ ]]; then
        log_info "Removing orphans"

        wait_dots

        echo "$orphans" | xargs yay -Rns --noconfirm

        log_ok "Orphans removed\n"
    else
        log_info "Skipping orphans\n"
    fi
fi

log_ok "Done\n"

log_ask "Clear 'yay' cache completely? [y/N] "

read -rp "" clear_cache

if [[ "$clear_cache" =~ ^[Yy]$ ]]; then
    log_info "Clearing cache"

    wait_dots

    yay -Scc --noconfirm
else
    log_info "Skipping cache\n"
fi

log_ok "Done\n"


# 5. After installation

log_ok "Dotfiles installed successfully!\n"

log_ask "Remove this cloned repository? [y/N] "

read -rp "" remove_repo_confirm

if [[ "$remove_repo_confirm" =~ ^[Yy]$ ]]; then
    log_info "Removing repository"

    wait_dots

    cd "$CLONE_DIR/.."

    rm -rfv "$CLONE_DIR"

    log_ok "Repository removed\n"
else
    log_info "Skipping\n"
fi

cd ~

log_ok "Done\n"

log_ask "Reboot now? [Y/n] "

read -rp "" reboot_confirm

log_info "I hope you will like this Arch + Hyprland desktop experience, $(logname) :)\n"

if [[ ! "$reboot_confirm" =~ ^[Nn]$ ]]; then
    log_warn "Reboot in"

    for i in 3 2 1; do
        echo -n " $i"

        for j in 3 2 1; do
            echo -n "."

            sleep 0.33
        done
    done

    echo ""

    log_ok "Goodbye\n"

    systemctl reboot
else
    log_ok "Goodbye\n"
fi
