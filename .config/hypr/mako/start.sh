#!/bin/sh

# Terminate already running bar instances
killall -q mako

# Wait until the processes have been shut down
while pgrep -x mako >/dev/null; do sleep 1; done

# Launch main
mako -c ~/.config/hypr/mako/config &
