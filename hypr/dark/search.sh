#!/bin/bash
query=$(rofi -dmenu -p "Search Firefox")
[ -n "$query" ] && firefox --new-window "https://duckduckgo.com/?q=$(echo $query | sed 's/ /+/g')"
