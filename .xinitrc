#!/bin/sh

#[ -f "/etc/X11/xinit/.Xresources" ] xrdb -merge "/etc/X11/xinit/.Xresources"

#[ -f "/etc/X11/xinit/.Xmodmap" ] && xmodmap "/etc/X11/xinit/.Xmodmap"

[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"

#[ -f "$HOME/.Xmodmap" ] && xmodmap "$HOME/.Xmodmap"

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#		[ -x "$f" ] && . "$f"
#	done
#	unset f
#fi

[ -f "$HOME/.config/X11/xinit/default" ] && . "$HOME/.config/X11/xinit/default"

dunst &

[ ! -d "$HOME/.local/share/uictl" ] && mkdir -p "$HOME/.local/share/uictl"
echo "DISPLAY=$DISPLAY" > "$HOME/.local/share/uictl/env"
chmod 400 "$HOME/.local/share/uictl/env"

exec dwm

