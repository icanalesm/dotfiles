#!/bin/sh

## PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

## Default programs
export PAGER="less"
export EDITOR="vim"

## Configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export HISTFILE="$XDG_STATE_HOME/history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"

## Configuration for different shells
case $0 in
*bash*)
	# Read bashrc when bash is invoked as an interactive login shell with
	# the name bash
	case $- in
	*i*)
		script="$HOME/.config/bash/bashrc"
		[ -f "$script" ] && [ -r "$script" ] && . "$script"
		unset script
		;;
	esac
	;;
esac
