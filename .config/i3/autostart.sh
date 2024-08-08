#/bin/bash

# echo 'Xft.dpi: 120' | xrdb -merge

xrdb -merge <<<'Xft.dpi: 120'
xrdb -merge <<<'Xcursor.size: 34'

# feh sets wallpaper
feh --bg-fill ~/.config/i3/wallpaper/att-04.jpg

# Polybar
~/.config/polybar/launch.sh &

# network
nm-applet &

# Authentication dialog
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

picom --config ~/.config/i3/picom.conf &
