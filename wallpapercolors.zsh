#!/bin/zsh
# Convert a wallpaper to png, get color codes and show them in html

convert $1 /tmp/wallpaper.png
colors -p /tmp/wallpaper.png | hex2html > /tmp/colors.html
exec $BROWSER /tmp/colors.html /tmp/wallpaper.png &
