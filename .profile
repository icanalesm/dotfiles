#!/bin/sh

## PATH and variables for ssh
case $(uname -s) in
Darwin*)
	# PATH - Update for Macports
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	# SSH_AUTH_SOCK - Automatically set by macOS
	;;
Linux*)
	# PATH
	export PATH="$HOME/.local/bin:$PATH"
	# SSH_AUTH_SOCK, SSH_AGENT_PID
	file="$HOME/.ssh/agent"
	! pgrep -u "$USER" ssh-agent > /dev/null && { ssh-agent > "$file"; chmod 600 "$file"; }
	[ -z "$SSH_AUTH_SOCK" ] && . "$file" > /dev/null
	;;
*)
	;;
esac

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export LESSHISTFILE="-"

# Source $HOME/.bashrc
[ -r "$HOME/.bashrc" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

