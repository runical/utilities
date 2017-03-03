#!/bin/bash

Dir="/home/pvdhurk/Pictures/Wallpapers"

if [ ! -d "$Dir" ]; then 
    echo "Not Exist $Dir"
    exit 1
fi

SetBG () {
    TotalFiles=$( ls -1 "$Dir" | wc -l )
    RandomNumber=$(( $RANDOM % $TotalFiles ))
    test ! $RandomNumber = 0 || RandomNumber=1

    RandomFile="$( ls -1 $Dir | head -n $RandomNumber | tail -n 1)"

    notify-send "Wallpaper changed to $RandomFile"
    feh --bg-fill "${Dir%/}/${RandomFile}"
}

SetBG
exit 0
