#!/bin/bash

ID=`xinput --list | grep "Touchpad" | awk '{ print $6 }' | sed 's/id=//'`
status=`xinput list-props $ID | grep "Device Enabled" | awk '{ print $4 }'`

if [ $status == 1 ] ; then
	xinput set-prop $ID "Device Enabled" 0
else
	xinput set-prop $ID "Device Enabled" 1
fi
