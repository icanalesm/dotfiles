#!/bin/bash

export PAGER="less"
export EDITOR="vim"
case "$(uname -s)" in
Darwin*)
	export PATH=/opt/local/bin:/opt/local/sbin:$PATH;;
*)
	;;
esac

# Source $HOME/.bashrc
[ -r "${HOME}/.bashrc" ] && [ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc";
