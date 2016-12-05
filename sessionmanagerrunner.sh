#!/bin/sh

# Run the sessionmanager script with a runner

case $1 in
    dmenu)
	sessionmanager.sh $(sessionmanager.sh | dmenu) ;;
    rofi)
	sessionmanager.sh $(sessionmanager.sh | rofi -dmenu -mesg "What do you want to do?") ;;
    *)
	echo "Choose either rofi or dmenu" ;;
esac
