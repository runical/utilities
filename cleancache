#!/bin/sh

paccache -d -vuk 0

printf 'Clean out uninstalled packages? [Y/n] '
read answer

if [[ $answer != n ]] ; then
    sudo paccache -r -uk 0
fi

paccache -d -vk 2

printf 'Clean out old packages from the cache? [Y/n]\n'
read answer

if [[ $answer != n ]] ; then
    sudo paccache -r -k 2
fi
