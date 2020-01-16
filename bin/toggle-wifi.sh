#!/bin/bash

if (nmcli r | grep "disabled") ; then
    nmcli r all on
    notify-send -i network-wireless-full "Wireless enabled" "Your wireless adaptor has been enabled."
else
    nmcli r all off
    notify-send -i network-wireless-disconnected "Wireless disabled" "Your wireless adaptor has been disabled."
fi
