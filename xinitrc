xrandr --newmode "1920x1080_60.00" 172.80 1920 2040 2248 2576 1080 1081 1084 1118 -HSync +Vsync 
xrandr --addmode eDP1 "1920x1080_60.00" 
xrandr --output eDP1 --mode "1920x1080_60.00"

# Setup lxd
lxc stop dev

lxc config device remove dev X0

lxc config device add dev X0 disk path=/tmp/.X11-unix/X0 source=/tmp/.X11-unix/X0

lxc start dev &

dbus-run-session bspwm
