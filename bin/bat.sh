#!/usr/bin/env bash

fg="$(~/bin/xres color0)"
light="$(~/bin/xres color8)"

cap=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$status" = "Charging" ]]
then
	echo -ne "%{F$light}+bat %{F$fg}$cap%"
else
	echo -ne "%{F$light}bat %{F$fg}$cap%"
fi
