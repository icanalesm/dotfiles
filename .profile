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

