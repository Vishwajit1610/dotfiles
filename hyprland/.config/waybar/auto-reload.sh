#!/usr/bin/env bash

while inotifywait -r -e close_write,create,delete ~/.config/waybar; do
    killall -SIGUSR2 waybar
done
