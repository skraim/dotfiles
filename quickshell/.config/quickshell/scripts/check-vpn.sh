#!/bin/bash

VIA=$(ip -j a | jq -r '.[] | select(.ifname == "via_vpn")')
TUN=$(ip -j a | jq -r '.[] | select(.ifname == "tun0")')

echo "$TUN$VIA"
