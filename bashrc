#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load configuration scripts
for file in $HOME/.config/bash/{colours,aliases,prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done;
unset file;

