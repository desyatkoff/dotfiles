export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin"

# if [[ $(tty) == "/dev/tty1" && -z "$DISPLAY" && "$(cut -d . -f 1 /proc/uptime)" -lt 60 ]]; then
if [[ $(tty) == "/dev/tty1" && -z "$DISPLAY" ]]; then
    exec dbus-run-session startplasma-wayland
fi

[[ $- != *i* ]] && return
