#/bin/bash

# echo 'Xft.dpi: 120' | xrdb -merge

xrdb -merge <<<'Xft.dpi: 120'
xrdb -merge <<<'Xcursor.size: 34'

fcitx5 &

bash ~/.config/i3/picom/picom-toggle.sh &

kitty --name=scratchpad --class=scratchpad -e zsh -c "tmux new-session -A -s scratchpad" &

# feh sets wallpaper
feh --bg-fill ~/.config/i3/wallpaper/att-04.jpg

# Polybar
~/.config/polybar/launch.sh &

# network
nm-applet &

# notification
dunst &

# Authentication dialog
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# picom --config ~/.config/i3/picom.conf &
