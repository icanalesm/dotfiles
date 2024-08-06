#!/bin/sh

## PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export ENV="$HOME/.config/shell/shinit"
export HISTFILE="$HOME/.cache/bash/bash_history"
export LESSHISTFILE="-"

## Special configuration for some shells
case $0 in
*bash*)
	# When bash is invoked with the name bash as an interactive login shell,
	# it does not read ~/.bashrc after ~/.bash_profile, ~/.bash_login and
	# ~/.profile
	case $- in
	*i*)
		script="$HOME/.config/bash/bashrc"
		[ -f "$script" ] && [ -r "$script" ] && . "$script"
		;;
	esac
	;;
esac

unset script
