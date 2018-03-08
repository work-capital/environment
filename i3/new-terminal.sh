#!/bin/bash
# open a new terminal "from here"
# add this in your config file:
# bindsym $mod+b exec ~/environment/i3/new-terminal.sh
ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 2))
if [ -e "/proc/$PID/cwd" ]
then
    urxvt -cd $(readlink /proc/$PID/cwd) &
else
    urxvt
fi
