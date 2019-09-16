#!/usr/bin/env bash

fg="$(~/bin/xres color0)"
light="$(~/bin/xres color8)"

date="%{F$light}time %{F$fg}$(date +%I:%M)"
time="%{F$light}date %{F$fg}$(date +"%a, %d %b" | tr A-Z a-z)"

while getopts dt options
do
	case $options in
		d)
			echo -ne "$date"
			;;
		t)
			echo -ne "$time"
	esac
done
