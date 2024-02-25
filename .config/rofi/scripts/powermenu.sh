#!/usr/bin/env bash

## Author  : Sebastian Ruiz
## Github  : @sebasruiz09

dir="~/.config/rofi/menus"
uptime=$(uptime -p | sed -e 's/up //g')

# call rofi menu
rofi_command="rofi -no-config -theme  $dir/powermenu.rasi"

# Options
shutdown="⏻   Shutdown"
reboot="   Restart"
lock="   Lock"
suspend="󰒲   Sleep"
logout="󰿅   Logout"

# Message
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Case for select options
chosen="$(echo -e "$options" | $rofi_command -p "󰣇  Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in $shutdown)
			systemctl poweroff
          ;;
    $reboot)
			systemctl reboot
        ;;
    $lock)
			betterlockscreen -l
        ;;
    $suspend)
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        ;;
    $logout)
      bspc quit
        ;;
esac
