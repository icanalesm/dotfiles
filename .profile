#!/bin/sh

## PATH
export PATH="$HOME/.local/bin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export ENV="$HOME/.config/shell/shinit"
export LESSHISTFILE="-"

# SSH_AUTH_SOCK, SSH_AGENT_PID
script="$HOME/.ssh/agent"
! pgrep -u "$USER" ssh-agent > /dev/null && { ssh-agent > "$script"; chmod 600 "$script"; }
[ -z "$SSH_AUTH_SOCK" ] && . "$script" > /dev/null

## Configuration for different shells
case $0 in
*bash*)
	export HISTFILE="$HOME/.cache/bash/bash_history"
	# Read bashrc when bash is invoked as an interactive login shell with
	# the name bash
	case $- in
	*i*)
		script="$HOME/.config/bash/bashrc"
		[ -f "$script" ] && [ -r "$script" ] && . "$script"
		;;
	esac
	;;
esac

unset script
