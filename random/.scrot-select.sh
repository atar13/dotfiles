#!/bin/sh

YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DAY=$(date +"%d")
TIME=$(date +"%H:%M:%S")

mkdir -p $HOME/Pictures/scrot/${YEAR}/${MONTH}/${DAY}

sleep 0.1 && scrot $HOME/Pictures/scrot/${YEAR}/${MONTH}/${DAY}/"screenshot_${TIME}.png" -s
