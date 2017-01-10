#!/bin/zsh
# Script to manage a session.

function lockimage {
    # Gets the current wallpaper from nitrogen, converts it to png
    # Intended to be run before the locker function

    rm /tmp/locker.png
    eval $(cat ~/.config/nitrogen/bg-saved.cfg | grep file=)
    convert $file /tmp/locker.png
}

function locker {
    # Gets the current wallpaper from nitrogen, converts it to png and locks using i3lock
    # intended to be set as the locker for xautolock

    if [ ! -f /tmp/locker.png ];
    then
	lockimage
    fi
        
    i3lock -n -e -f -i /tmp/locker.png
}

function killWM {
    # Kill the Window manager
    case $SELSESSION in
	openbox )
	    openbox --exit ;;
	i3|i3wm )
	    i3-msg exit ;;
	*       )
	    notify-send -u critical "Unknown session" ;;
    esac
}

#echo $SELSESSION
#echo $1

case $1 in
    exit )
	killWM ;;
    lock )
	locker ;;
    suspend )
	lockimage
	systemctl suspend
	locker ;;
    shutdown|poweroff )
	systemctl poweroff ;;
    reboot )
	systemctl reboot ;;
    interactive )
	if command -v rofi > /dev/null 2>&1; then
	    sessionmanager.sh $(sessionmanager.sh | rofi -dmenu -mesg "What do you want to do?")
	else
	    sessionmanager.sh $(sessionmanager.sh | dmenu)
	fi
	;;
    close) ;;
    help|usage )
	echo "Usage:"
	printf "exit: Exit current WM \n lock: Lock session \n suspend: Suspend session \n shutdown or poweroff: Shutdown system \n reboot: Reboot system \n help: This message\n";;
    *)   
	printf "close prompt\nlock session\nsuspend session\nshutdown computer\nreboot computer\nexit WM" ;;
esac
