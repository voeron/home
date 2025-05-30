#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

(sleep 2; polybar bar) &
