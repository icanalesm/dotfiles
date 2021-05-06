#!/bin/sh

# PATH - Update for Macports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export ENV="$HOME/.config/shell/shinit"
export LESSHISTFILE="-"

## Special configuration for some shells
case $0 in
*bash*)
	# When bash is invoked with the name bash as an interactive login shell,
	# it does not read ~/.bashrc after ~/.bash_profile, ~/.bash_login and
	# ~/.profile
	case $- in
	*i*) [ -f "$HOME/.bashrc" ] && [ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc" ;;
	esac
	;;
esac

