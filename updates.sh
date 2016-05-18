#!/bin/sh

printf "Updates in the AUR:\n"
cower -u

printf "\nUpdates for runical:\n"
aurcheck -q runical

printf "\nUpdates for runical-git:\n"
aurcheck -q runical-git

printf "\nUpdates in repositories:\n"
checkupdates

printf "\n"
