#!/bin/sh
NEW_BG=$( ls ~/.config/sway/lib/img/ | shuf -n 1 )
NEW_BG_PATH="~/.config/sway/lib/img/$NEW_BG"
swaymsg -s $SWAYSOCK "output * bg $NEW_BG_PATH fill"
