#!/bin/sh

# Environment variables
export PAGER="less"
export EDITOR="vim"
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
	if ! pgrep -u "$USER" ssh-agent > /dev/null; then
		ssh-agent > "$HOME/.ssh/agent"
		chmod 600 "$HOME/.ssh/agent"
	fi
	if [ -z "$SSH_AUTH_SOCK" ]; then
		. "$HOME/.ssh/agent" > /dev/null
	fi
	;;
*)
	;;
esac

# Source $HOME/.bashrc
[ -r "$HOME/.bashrc" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

