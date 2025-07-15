#!/usr/bin/env bash

if [ "$button" = "1" ]; then
	wpctl set-mute @DEFAULT_SINK@ toggle > /dev/null
	wpctl get-volume @DEFAULT_SINK@
elif [ "$button" = "4" ]; then
	wpctl set-volume @DEFAULT_SINK@ 1%+ > /dev/null
	wpctl get-volume @DEFAULT_SINK@
elif [ "$button" = "5" ]; then
	wpctl set-volume @DEFAULT_SINK@ 1%- > /dev/null
	wpctl get-volume @DEFAULT_SINK@
elif [ "$1" = "query" ]; then
	wpctl get-volume @DEFAULT_SINK@
elif [ "$1" = "increase" ]; then
	wpctl set-volume @DEFAULT_SINK@ 1%+
	pkill -SIGRTMIN+1 i3blocks
elif [ "$1" = "decrease" ]; then
	wpctl set-volume @DEFAULT_SINK@ 1%-
	pkill -SIGRTMIN+1 i3blocks
elif [ "$1" = "mute" ]; then
	wpctl set-mute @DEFAULT_SINK@ toggle
	pkill -SIGRTMIN+1 i3blocks
fi
