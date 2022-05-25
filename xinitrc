#!/bin/sh

# Get currently connected screens
SCREENS=$(xrandr | grep " connected " | awk '{ print$1 }')
LAPEEN=$(echo $SCREENS | grep -woE 'eDP-?1') # Laptop screen

# If extern monitor is connected
SCREEN=$(echo $SCREENS | grep -woE 'DP-?1')
if [ ! -z "$SCREEN" ]; then
	printf "Using %s\n" "$SCREEN"
	xrandr --output $LAPEEN --off
	xrandr --output $SCREEN --auto
else
	SCREEN=$LAPEEN
	printf "Using %s\n" "$SCREEN"
	xrandr --output $SCREEN --mode 1920x1080 --auto
fi

pkill -x pipewire;
pkill -x pipewire-pulse;

pipewire &
pipewire-pulse &
picom --vsync --experimental-backends --config $HOME/.config/picom/picom.conf &

exec dbus-run-session -- bspwm

