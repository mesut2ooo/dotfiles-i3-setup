#!/bin/bash

# Function to smoothly adjust brightness
smooth_brightness_change() {
    current_brightness=$(brightnessctl get)
    max_brightness=$(brightnessctl max)

    # Convert current brightness to percentage
    current_brightness_percentage=$((100 * current_brightness / max_brightness))

    target_brightness_percentage=$1

    step=1  # Step size for smooth transition in percentage
    sleep_interval=0.05  # Adjust sleep time for smoother transitions

    if [ "$current_brightness_percentage" -lt "$target_brightness_percentage" ]; then
        for ((b = current_brightness_percentage; b <= target_brightness_percentage; b += step)); do
            brightnessctl set ${b}% > /dev/null 2>&1
            sleep $sleep_interval
        done
    else
        for ((b = current_brightness_percentage; b >= target_brightness_percentage; b -= step)); do
            brightnessctl set ${b}% > /dev/null 2>&1
            sleep $sleep_interval
        done
    fi
}

# Function to calculate brightness percentage based on sensor value
calculate_brightness_percentage() {
    light_value=$1

    if [ "$light_value" -le 50 ]; then
        # Map light values from 0-50 to brightness percentages from 5%-30%
        echo $((5 + (light_value * (30 - 5) / 50)))
    elif [ "$light_value" -le 100 ]; then
        # Map light values from 50-100 to brightness percentages from 30%-50%
        echo $((30 + ((light_value - 50) * (50 - 30) / (100 - 50))))
    elif [ "$light_value" -le 250 ]; then
        # Map light values from 100-250 to brightness percentages from 50%-70% (dimmer)
        echo $((50 + ((light_value - 100) * (70 - 50) / (250 - 100))))
    elif [ "$light_value" -le 600 ]; then
        # Map light values from 250-600 to brightness percentages from 70%-85% (dimmer)
        echo $((70 + ((light_value - 250) * (85 - 70) / (600 - 250))))
    else
        # If light value is above 600, set brightness to 90% (dimmer than original 98%)
        echo 90
    fi
}

# Read the light sensor value from the specified file
if [ -f /sys/bus/iio/devices/iio:device0/in_illuminance_raw ]; then
    light_value=$(cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw)
else
    exit 1  # Exit if the light sensor file is not found
fi

# Calculate target brightness percentage based on sensor value
target_brightness_percentage=$(calculate_brightness_percentage "$light_value")

# Smoothly adjust brightness to target level
smooth_brightness_change "$target_brightness_percentage"

