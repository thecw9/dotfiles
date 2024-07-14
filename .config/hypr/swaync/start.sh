#!/bin/bash

killall swaync
pkill swaync
sleep 0.1
swaync -c ~/.config/hypr/swaync/config.json -s ~/.config/hypr/swaync/style.css &
