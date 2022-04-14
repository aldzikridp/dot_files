#!/usr/bin/env bash

YTURL=$(wofi -id "Enter video url" --lines 1) && mpv $YTURL
