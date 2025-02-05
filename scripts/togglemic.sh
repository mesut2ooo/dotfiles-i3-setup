#!/bin/bash

# Check the current mute state of the mic (returns 1 if muted, 0 if not)
mute_state=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o '[MUTED]')

# Toggle the mute state of the microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# If the mic is not muted, turn on the LED (replace with your LED control command)
if [ -z "$mute_state" ]; then
    # Mic was not muted, now it's muted, so turn the LED off
    brightnessctl -d platform::micmute set 0
    # Command to turn LED off (example)
    # echo 0 > /sys/class/leds/your_led_device/brightness
else
    # Mic was muted, now it's unmuted, so turn the LED on
    brightnessctl -d platform::micmute set 1
    # Command to turn LED on (example)
    # echo 1 > /sys/class/leds/your_led_device/brightness
fi
