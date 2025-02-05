#!/bin/bash

state=$(nmcli radio wifi)
if [ "$state" = "enabled" ]; then
    nmcli radio wifi off
    echo "Wi-Fi turned off."
else
    nmcli radio wifi on
    echo "Wi-Fi turned on."
fi

