#!/usr/bin/env bash

echo 'Xft.dpi: 120' | xrdb -merge

source ~/.config/hypr/lib.sh

run_hook pre &

swww init

set_wallpaper ~/.config/hypr/wallpaper.jpg

~/.config/hypr/waybar/start
~/.config/hypr/swaync/start
~/.config/hypr/eww/start

nm-applet &
blueman-applet &

lxsession &

brightnessctl --restore

eval "sleep 2; hyprctl reload" &

eval "sleep 0.5; killall flameshot; pkill flameshot" &
eval "sleep 1; killall flameshot; pkill flameshot" &
eval "sleep 2; killall flameshot; pkill flameshot" &

run_hook post &
