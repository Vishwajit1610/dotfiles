#!/usr/bin/env bash
# Script to reload Waybar

# Kill Waybar
killall -9 waybar

# Launch Waybar
waybar &
