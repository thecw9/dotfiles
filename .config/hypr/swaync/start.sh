#!/bin/bash

# Terminate already running bar instances
killall -q swaync

# Wait until the processes have been shut down
while pgrep -x swaync >/dev/null; do sleep 1; done

swaync -c ~/.config/hypr/swaync/config.json -s ~/.config/hypr/swaync/style.css &
