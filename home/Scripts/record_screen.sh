#!/usr/bin/env bash

# Record screen script


pactl load-module module-null-sink sink_name=Combined
pactl load-module module-loopback sink=Combined source=alsa_output.pci-0000_00_1f.3.analog-stereo.monitor
pactl load-module module-loopback sink=Combined source=alsa_input.pci-0000_00_1f.3.analog-stereo

WF_RECORDER_OPTS="--audio=Combined.monitor -c libx264rgb"
output_file=""
output_dir=""

check_recording() {
    pgrep -f "wf-recorder" >/dev/null
}

start_recording() {
    if check_recording; then
        echo "A recording is already in progress"

        exit 1
    fi

    target="$2"

    if [ "$target" == "screen" ]; then
        monitor_name="$3"
        output_dir="$4"
    elif [ "$target" == "region" ]; then
        output_dir="$3"
    else
        echo "Usage: $0 start {screen <monitor_name> | region} <output_directory>"

        exit 1
    fi

    output_dir="${output_dir:-$HOME/Videos}"

    output_dir="${output_dir/#\~/$HOME}"

    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"

        echo "Created output directory: $output_dir"
    fi

    output_file="$(date +%Y-%m-%d_%H-%M-%S).mp4"
    output_path="$output_dir$output_file"

    echo "Target: $target"
    echo "Monitor: ${monitor_name:-N/A}"
    echo "Output dir: $output_dir"
    echo "Output file: $output_path"

    if [ "$target" == "screen" ]; then
        if [ -z "$monitor_name" ]; then
            echo "Error: Monitor name is required for screen recording"

            exit 1
        fi

        monitor_info=$(hyprctl -j monitors | jq -r ".[] | select(.name == \"$monitor_name\")")

        if [ -z "$monitor_info" ]; then
            echo "Error: Monitor '$monitor_name' not found"

            exit 1
        fi

        w=$(echo "$monitor_info" | jq -r '.width')
        h=$(echo "$monitor_info" | jq -r '.height')
        scale=$(echo "$monitor_info" | jq -r '.scale')
        x=$(echo "$monitor_info" | jq -r '.x')
        y=$(echo "$monitor_info" | jq -r '.y')

        transform=$(echo "$monitor_info" | jq -r '.transform')
        rotation_filter=""

        if [ "$transform" -eq 1 ] || [ "$transform" -eq 3 ]; then
            scaled_width=$(awk "BEGIN { print $h / $scale }")
            scaled_height=$(awk "BEGIN { print $w / $scale }")
        else
            scaled_width=$(awk "BEGIN { print $w / $scale }")
            scaled_height=$(awk "BEGIN { print $h / $scale }")
        fi

        case "$transform" in
        1)
            rotation_filter="-F transpose=1"
            ;;
        3)
            rotation_filter="-F transpose=2"
            ;;
        esac

        wf-recorder $WF_RECORDER_OPTS $rotation_filter --geometry "${x},${y} ${scaled_width}x${scaled_height}" --file "$output_path" &
    elif [ "$target" == "region" ]; then
        wf-recorder $WF_RECORDER_OPTS --geometry "$(slurp)" --file "$output_path" &
    fi

    disown "$(jobs -p | tail -n 1)"

    echo "Recording started. Saving to $output_path"
    echo "$output_path" >/tmp/last_recording_path
}

stop_recording() {
    if ! check_recording; then
        echo "No recording in progress"

        exit 1
    fi

    pkill -SIGINT -f wf-recorder

    pactl unload-module module-null-sink
    pactl unload-module module-loopback

    sleep 1

    output_path=$(cat /tmp/last_recording_path 2>/dev/null)

    notify-send \
        -a "Screen Recorder" \
        -i "video-x-generic" \
        "Screen Recorder" \
        "$output_path"

    exit
}

case "$1" in
toggle)
    if check_recording; then
        stop_recording
    else
        start_recording "$@"
    fi
    ;;
start)
    start_recording "$@"
    ;;
stop)
    stop_recording
    ;;
status)
    if check_recording; then
        echo "recording"
    else
        echo "not recording"
    fi
    ;;
*)
    echo "Usage: $0 {toggle | start [screen <monitor_name> | region] <output_directory> | stop | status}"

    exit 1
    ;;
esac
