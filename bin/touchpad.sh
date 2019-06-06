#!/bin/bash
#set -ex

touchpad="SynPS/2 Synaptics TouchPad"
on_or_off=$(xinput list-props "$touchpad" | grep Enabled | cut -f3)
echo $on_or_off

if [ $on_or_off = "1" ]; then
xinput --disable "$touchpad"
else
xinput --enable "$touchpad"
fi
