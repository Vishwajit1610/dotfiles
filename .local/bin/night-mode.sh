#!/usr/bin/env bash
# Script to use Night Mode

# Check if hyprsunset is already running
if pgrep -x "hyprsunset" > /dev/null; then
    # Kill hyprsunset if it's running (Switch to day mode)
    killall hyprsunset
    notify-send "Night Light" "Off" -u "low"
else
    # Start hyprsunset for Night Mode
    hyprsunset -t 3500 &
    notify-send "Night Light" "On" -u "low"
fi
