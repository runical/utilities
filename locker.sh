#!/bin/sh
# Gets the current wallpaper from nitrogen, converts it to png and locks using i3lock
# intended to be set as the locker for xautolock

if [ ! -f /tmp/locker.png ];
then
    eval $(cat ~/.config/nitrogen/bg-saved.cfg | grep file=)
    convert $file /tmp/locker.png
fi

i3lock -e -f -i /tmp/locker.png
