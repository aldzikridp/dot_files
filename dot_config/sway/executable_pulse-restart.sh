#!/bin/bash
sleep 1
rm -rf ~/.config/pulse
pulseaudio -k
sleep 1
swaymsg reload
