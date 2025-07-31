#!/usr/bin/env bash

# Audio volume script


get_output_volume() {
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/front-left/ { gsub(/%/, "", $2); print $2 + 0 }')
    mute=$(pactl get-sink-mute @DEFAULT_SINK@)

    if [[ "$mute" == "Mute: yes" ]]; then
        echo "Muted"
    else
        echo "$volume"
    fi
}

get_output_icon() {
    current=$(get_output_volume)

    if [[ "$current" == "Muted" ]]; then
        echo "audio-volume-muted"
    elif [[ "$current" -ge 66 ]]; then
        echo "audio-volume-high"
    elif [[ "$current" -ge 33 ]]; then
        echo "audio-volume-medium"
    elif [[ "$current" -ge 1 ]]; then
        echo "audio-volume-low"
    else
        echo "audio-volume-muted"
    fi
}

send_output_osd() {
    text=$(get_output_volume)

    if [[ "$text" != "Muted" ]]; then
        text="$text%"
    fi

    notify-send \
        -u "low" \
        -t 2000 \
        -a "Output Volume" \
        -i "$(get_output_icon)" \
        -e \
        -h string:x-canonical-private-synchronous:volume-notif \
        "Output Volume" \
        "$text"
}

toggle_output_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle

    send_output_osd
}

raise_output() {
    if [[ "$(get_output_volume)" == "Muted" ]]; then
        toggle_output_mute
    fi

    pactl set-sink-volume @DEFAULT_SINK@ +5%

    if [[ "$(get_output_volume)" -gt 100 ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ 100%
    fi

    send_output_osd
}

lower_output() {
    if [[ "$(get_output_volume)" == "Muted" ]]; then
        toggle_output_mute
    fi

    pactl set-sink-volume @DEFAULT_SINK@ -5%

    send_output_osd
}

get_input_volume() {
    volume=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk -F'/' '/front-left/ { gsub(/%/, "", $2); print $2 + 0 }')
    mute=$(pactl get-source-mute @DEFAULT_SOURCE@)

    if [[ "$mute" == "Mute: yes" ]]; then
        echo "Muted"
    else
        echo "$volume"
    fi
}

get_input_icon() {
    current=$(get_input_volume)

    if [[ "$current" == "Muted" ]]; then
        echo "mic-volume-muted"
    elif [[ "$current" -ge 66 ]]; then
        echo "mic-volume-high"
    elif [[ "$current" -ge 33 ]]; then
        echo "mic-volume-medium"
    elif [[ "$current" -ge 1 ]]; then
        echo "mic-volume-low"
    else
        echo "mic-volume-muted"
    fi
}

send_input_osd() {
    text=$(get_input_volume)

    if [[ "$text" != "Muted" ]]; then
        text="$text%"
    fi

    notify-send \
        -u "low" \
        -t 2000 \
        -a "Input Volume" \
        -i "$(get_input_icon)" \
        -e \
        -h string:x-canonical-private-synchronous:volume-notif \
        "Input Volume" \
        "$text"
}

toggle_input_mute() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle

    send_input_osd
}

raise_input() {
    if [[ "$(get_input_volume)" == "Muted" ]]; then
        toggle_input_mute
    fi

    pactl set-source-volume @DEFAULT_SOURCE@ +5%

    if [[ "$(get_input_volume)" -gt 100 ]]; then
        pactl set-source-volume @DEFAULT_SOURCE@ 100%
    fi

    send_input_osd
}

lower_input() {
    if [[ "$(get_input_volume)" == "Muted" ]]; then
        toggle_input_mute
    fi

    pactl set-source-volume @DEFAULT_SOURCE@ -5%

    send_input_osd
}

if [[ "$1" == "--get-output-volume" ]]; then
    get_output_volume
elif [[ "$1" == "--get-output-icon" ]]; then
    get_output_icon
elif [[ "$1" == "--send-output-osd" ]]; then
    send_output_osd
elif [[ "$1" == "--toggle-output-mute" ]]; then
    toggle_output_mute
elif [[ "$1" == "--raise-output" ]]; then
    raise_output
elif [[ "$1" == "--lower-output" ]]; then
    lower_output
elif [[ "$1" == "--get-input-volume" ]]; then
    get_input_volume
elif [[ "$1" == "--get-input-icon" ]]; then
    get_input_icon
elif [[ "$1" == "--send-input-osd" ]]; then
    send_input_osd
elif [[ "$1" == "--toggle-input-mute" ]]; then
    toggle_input_mute
elif [[ "$1" == "--raise-input" ]]; then
    raise_input
elif [[ "$1" == "--lower-input" ]]; then
    lower_input
fi
