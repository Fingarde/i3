#!/usr/bin/env bash

fg="$(~/bin/xres color0)"
light="$(~/bin/xres color8)"

while getopts idq options
do
	case $options in
		i)
			amixer sset Master 2%+
			;;

		d)
			amixer sset Master 2%-
			;;
		q)
			if [[ $(amixer get Master | grep 'Right' | awk -F'[][] ' '{ print $2 }' | tr -d '\n') = "[on]" ]]
			then
				cur_vol=$(amixer get Master | grep 'Right' | awk -F'[][]' '{ print $2 }' | tr -d '\n')
				echo -ne "%{F$light}vol %{F$fg}$cur_vol"
			else
				echo -ne "%{F$light}vol %{F$fg}muted"
			fi
			;;
	esac
done
