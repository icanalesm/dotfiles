#!/bin/sh

## PATH
export PATH="$HOME/.local/bin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export ENV="$HOME/.config/shell/shinit"
export HISTFILE="$HOME/.cache/bash/bash_history"
export LESSHISTFILE="-"

# SSH_AUTH_SOCK, SSH_AGENT_PID
script="$HOME/.ssh/agent"
! pgrep -u "$USER" ssh-agent > /dev/null && { ssh-agent > "$script"; chmod 600 "$script"; }
[ -z "$SSH_AUTH_SOCK" ] && . "$script" > /dev/null

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
