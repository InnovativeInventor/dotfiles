#!/bin/sh
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --pos 3000x250 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 1080x622 --rotate normal --output DP-3 --off --output DP-4 --mode 1920x1080 --pos 0x0 --rotate normal
sleep 1
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --pos 3000x250 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 1080x622 --rotate normal --output DP-3 --off --output DP-4 --mode 1920x1080 --pos 0x0 --rotate left 
