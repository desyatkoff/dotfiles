#!/usr/bin/env bash

# Resize and center new floating windows script


declare -A floating_state=()

while true; do
    mapfile -t windows < <(hyprctl -j clients | jq -c '.[] | {address, floating}')

    for info in "${windows[@]}"; do
        address=$(jq -r '.address' <<< "$info")
        is_floating=$(jq -r '.floating' <<< "$info")

        previous_state=${floating_state[$address]:-false}

        if [[ "$is_floating" == "true" && "$previous_state" != "true" ]]; then
            hyprctl dispatch resizeactive exact 50% 50%
            hyprctl dispatch centerwindow
        fi

        floating_state[$address]=$is_floating
    done

    sleep 0.1
done
