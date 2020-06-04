#!/bin/bash
#set -ex

touchpad="SynPS/2 Synaptics TouchPad"
on_or_off=$(xinput list-props "$touchpad" | grep "Device Enabled" | cut -f3)
echo $on_or_off

if [ $on_or_off = "0" ]; then
xinput --enable "$touchpad" && echo "Touchpad Enabled"
else
xinput --disable "$touchpad" && echo "Touchpad Disabled"
fi
