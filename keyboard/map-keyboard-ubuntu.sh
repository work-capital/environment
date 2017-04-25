#!/bin/bash
# x.613.ein..053
setxkbmap -option \
	-option caps:swapescape \
	-option ctrl:swap_lwin_lctl \
	-option ctrl:swap_rwin_rctl 
	#-option altwin:swap_alt_win

# configure tap to click in trackpad
# as described here: https://askubuntu.com/questions/403113/how-do-you-enable-tap-to-click-via-command-line-with-xmodmap
xinput set-prop "bcm5974" "libinput Tapping Enabled" 1
