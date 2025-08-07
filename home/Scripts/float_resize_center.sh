#!/usr/bin/env bash

# Resize and center new floating windows script


declare -A floating_state=()

while true; do
    mapfile -t windows < <(hyprctl -j clients | jq -c '.[] | {address, floating, class}')

    for info in "${windows[@]}"; do
        address=$(jq -r '.address' <<< "$info")
        floating=$(jq -r '.floating' <<< "$info")
        class=$(jq -r '.class' <<< "$info")

        previous_state=${floating_state[$address]:-false}

        if [[ "$floating" == "true" && "$previous_state" != "true" && "$class" != "Rofi" ]]; then
            hyprctl dispatch resizeactive exact 50% 50%
        fi

        if [[ "$floating" == "true" && "$previous_state" != "true" ]]; then
            hyprctl dispatch centerwindow
        fi

        floating_state[$address]=$floating
    done

    sleep 0.1
done
