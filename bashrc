#!/bin/bash

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return;

# Color scheme
[ -r "${HOME}/.bash.d/base16-shell" ] && [ -f "${HOME}/.bash.d/base16-shell" ] && source "${HOME}/.bash.d/base16-shell";

# Prompt
[ -r "${HOME}/.bash.d/prompt" ] && [ -f "${HOME}/.bash.d/prompt" ] && source "${HOME}/.bash.d/prompt";

# Aliases
[ -r "${HOME}/.bash.d/aliases" ] && [ -f "${HOME}/.bash.d/aliases" ] && source "${HOME}/.bash.d/aliases";
