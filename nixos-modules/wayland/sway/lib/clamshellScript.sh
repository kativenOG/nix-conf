#!/bin/sh
# [ -z $(grep -q open /proc/acpi/button/lid/LID0/state) ] && swaymsg output eDP-1 enable || swaymsg output eDP-1 disable
# if grep -q open /proc/acpi/button/lid/LID0/state 
# then
#     echo 'Si';
#     swaymsg output eDP-1 enable 
# else
#     echo 'No';
#     swaymsg output eDP-1 disable
# fi
