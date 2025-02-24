#!/bin/sh

## PATH
export PATH="$HOME/.local/share/cargo/bin:$HOME/.local/bin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XINITRC="$XDG_CONFIG_HOME/X11/xinit/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xinit/xserverrc"
export HISTFILE="$XDG_STATE_HOME/history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

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
