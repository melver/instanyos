#!/usr/bin/env bash

if [[ "$(id -u)" != "0" ]]; then
	echo "This program must be run as root."
	exit 1
fi

cd "${0%/*}"

case "$1" in
	armsoc)
		rm -f xorg.conf.d/10-chromebook.conf
		ln -sf xorg.conf.armsoc xorg.conf
		;;
	fbdev)
		ln -sf xorg.conf.fbdev xorg.conf
		ln -sf ../xorg.conf.d.avail/10-chromebook.conf xorg.conf.d/10-chromebook.conf
		;;
	*)
		echo "No such config!"
		exit 1
		;;
esac
