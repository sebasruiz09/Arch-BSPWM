#!/usr/bin/env bash
#
get_total_updates() { UPDATES=$(~/.config/polybar/scripts/checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo " $UPDATES"
        elif (( UPDATES > 1 )); then
            echo " $UPDATES"
        else
            echo " "
        fi
        sleep 10
        get_total_updates
    done

    while (( UPDATES == 0 )); do
        echo " "
        sleep 1800
        get_total_updates
    done
done
