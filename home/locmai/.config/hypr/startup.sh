#!/usr/bin/env bash
nm-applet --indicator &
waybar &
hyprpaper &
avizo-service &
brave --new-window --class=landing-brave &
kitty --title landing-kitty & 
ibus-daemon -d
dunst
