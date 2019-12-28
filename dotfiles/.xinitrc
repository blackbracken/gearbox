#!/bin/sh

[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xinput set-prop 'Synaptics TM3382-002' 'libinput Natural Scrolling Enabled' 1
xset r rate 260 32

exec openbox-session
