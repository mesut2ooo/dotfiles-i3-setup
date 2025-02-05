#!/bin/bash

# Set the device name for your touchpad (from xinput list)
TOUCHPAD_NAME="ASUE120C:00 04F3:31C1 Touchpad"

# Get the current state of the touchpad (enabled or disabled)
STATUS=$(xinput list-props "$TOUCHPAD_NAME" | grep "Device Enabled" | awk '{print $4}')

# Toggle the state based on its current status
if [ "$STATUS" -eq 1 ]; then
    xinput disable "$TOUCHPAD_NAME"
else
    xinput enable "$TOUCHPAD_NAME"
fi

