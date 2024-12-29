#!/usr/bin/env bash

echo 'Xft.dpi: 120' | xrdb -merge

source ~/.config/hypr/lib.sh

run_hook pre &

swww init

set_wallpaper ~/.config/hypr/wallpaper.jpg

~/.config/hypr/waybar/start.sh
~/.config/hypr/swaync/start.sh
# ~/.config/hypr/mako/start.sh
~/.config/hypr/eww/start.sh

nm-applet &
blueman-applet &

lxsession &

brightnessctl --restore

eval "sleep 2; hyprctl reload" &

eval "sleep 0.5; killall flameshot; pkill flameshot" &
eval "sleep 1; killall flameshot; pkill flameshot" &
eval "sleep 2; killall flameshot; pkill flameshot" &

run_hook post &
