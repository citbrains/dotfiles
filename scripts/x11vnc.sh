#!/bin/bash

display_resolution () {
	# System startup wait time.
	/bin/sleep 5
	# Specify display
	export DISPLAY=:0

	/usr/bin/xrandr --fb 1650x950
}

x11vnc_startup () {
	# x11vnc kill all
	sudo killall -KILL x11vnc

	# x11vnc start
	/usr/bin/x11vnc -nopw -display :0 -rfbport 5900 -geometry 1650x950 -forever -loop100 -xdamage -repeat -nevershared
	#/usr/bin/x11vnc -nopw -display :0 -rfbport 5900 -forever -loop100 -xdamage -repeat -nevershared
}

#display_resolution
x11vnc_startup

exit 0
