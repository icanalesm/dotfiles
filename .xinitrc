#!/bin/sh

#[ -f "/etc/X11/xinit/.Xresources" ] xrdb -merge "/etc/X11/xinit/.Xresources"

#[ -f "/etc/X11/xinit/.Xmodmap" ] && xmodmap "/etc/X11/xinit/.Xmodmap"

[ -f "${HOME}/.Xresources" ] && xrdb -merge "${HOME}/.Xresources"

#[ -f "${HOME}/.Xmodmap" ] && xmodmap "${HOME}/.Xmodmap"

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#		[ -x "$f" ] && . "$f"
#	done
#	unset f
#fi

xcalib ${HOME}/.config/color/icc/ColorLCD-CB5A19E1-6C20-C98E-BB2D-70FC3BB550B4.icc

setxkbmap -layout es -model apple_laptop

exec dwm
