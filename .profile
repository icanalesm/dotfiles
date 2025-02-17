#!/bin/sh

## PATH
export PATH="$HOME/.local/share/cargo/bin:$HOME/.local/bin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export ENV="$HOME/.config/shell/shinit"

export HISTFILE="$HOME/.local/state/bash/history"

export LESSHISTFILE="-"

export XINITRC="$HOME/.config/X11/xinit/xinitrc"
export XSERVERRC="$HOME/.config/X11/xinit/xserverrc"

export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"

export DOT_SAGE="$HOME/.config/sage"

export CUDA_CACHE_PATH="$HOME/.cache/nv"

# SSH_AUTH_SOCK, SSH_AGENT_PID
script="$HOME/.ssh/agent"
! pgrep -u "$USER" ssh-agent > /dev/null && { ssh-agent > "$script"; chmod 600 "$script"; }
[ -z "$SSH_AUTH_SOCK" ] && . "$script" > /dev/null

## Configuration for different shells
case $0 in
*bash*)
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
