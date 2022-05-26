#!/bin/sh

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"

    ac=$(cat "$PATH_AC/online")
    battery_level=$(cat "$PATH_BATTERY_0/charge_now")
    battery_max=$(cat "$PATH_BATTERY_0/charge_full")

    battery_percent=$(("$battery_level * 100 / $battery_max"))

    if [ "$ac" -eq 1 ]; then
        icon="ﮣ"

        if [ "$battery_percent" -gt 97 ]; then
            echo "$icon"
        else
            echo "$icon $battery_percent %"
        fi
    else
        if [ "$battery_percent" -gt 85 ]; then
            icon=""
        elif [ "$battery_percent" -gt 60 ]; then
            icon=""
        elif [ "$battery_percent" -gt 35 ]; then
            icon=""
        elif [ "$battery_percent" -gt 10 ]; then
            icon=""
        else
            icon=""
        fi

        echo "$icon $battery_percent %"
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 5 &
            wait
        done
        ;;
esac
