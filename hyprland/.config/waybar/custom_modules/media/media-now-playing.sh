#!/usr/bin/env bash

zscroll \
    -l 40 \
    -d 0.3 \
    -p "  " \
    -u true \
    -e true \
    "playerctl metadata --format '{{title}} - {{artist}}'"
