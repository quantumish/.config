#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
power_off=" "
reboot=" "
lock=" "
suspend=" 鈴"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        promptmenu --yes-command "systemctl poweroff" --query "Shutdown?"
        ;;
    $reboot)
        promptmenu --yes-command "systemctl reboot" --query "Reboot?"
        ;;
    $lock)
        light-locker-command -l
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
esac

