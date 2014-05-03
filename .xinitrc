#!/bin/bash

xrandr -s 0

# Load resources
xrdb -merge $HOME/.Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

xscreensaver -no-splash &

exec xmonad
