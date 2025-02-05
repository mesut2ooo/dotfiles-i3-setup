#!/bin/bash

# Get the current active connection name
active_connection=$(nmcli -t -f NAME connection show --active | head -n 1)

# Set the DNS server to 8.8.8.8
nmcli connection modify "$active_connection" ipv4.dns "10.202.10.202 8.8.8.8"

# Restart the network connection to apply the new DNS settings
nmcli connection down "$active_connection"
nmcli connection up "$active_connection"
