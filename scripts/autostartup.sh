#!/bin/bash

HOME="/home/cit/"

root_check () {
	if [ ! ${EUID:-${UID}} = 0 ]; then
		echo 'Please run as root!!'
		exit 1
	fi
}

cpuon () {
	# CPU1 online
	sh -c "echo 1 > /sys/devices/system/cpu/cpu1/online"
	CPU1ERROR=$?
	# CPU2 online
	sh -c "echo 1 > /sys/devices/system/cpu/cpu2/online"
	CPU2ERROR=$?

	if [ ! ${CPU1ERROR} = 0 -a ! ${CPU2ERROR} = 0 ]; then
		echo "ERROR: Could not turn on CPU"
		exit 1
	fi
}

jetson_clock () {
	( /bin/sleep 60 && /usr/bin/jetson_clocks )&
}

time_setup () {
	( /usr/sbin/service ntp stop ; ntpd -gq ; /usr/sbin/service ntp start )&
	/bin/sleep 1
	( /usr/sbin/service ntp stop ; ntpd -gq ; /usr/sbin/service ntp start )&
}

wifi_setup () {
	# Power management OFF
	/sbin/iw dev wlan0 set power_save off

	# Retry set 1
	/sbin/iw phy0 set retry short 1
	/sbin/iw phy0 set retry long 1
}

b3m_setup () {
	modprobe ftdi_sio
	echo "165c 0009" > /sys/bus/usb-serial/drivers/ftdi_sio/new_id
}

HPLStatusUI () {
	/home/cit/robocup/for2050/src/pyfiles/pythonlauncher.sh &
}

root_check

# System startup wait time.
/bin/sleep 10

cpuon
#jetson_clock
time_setup &
wifi_setup &
b3m_setup
HPLStatusUI

exit 0
