if [[ $(tty) == "/dev/tty1" && -z "$DISPLAY" && "$(cut -d . -f 1 /proc/uptime)" -lt 60 ]]; then
    exec dbus-run-session Hyprland
fi

[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin"
