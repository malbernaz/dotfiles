#!/bin/sh

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export TERMINAL="kitty"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.yarn/bin":$PATH
export PATH="$HOME/.cargo/bin":$PATH
export NVIMRC="$HOME/.dotfiles/nvim/.config/nvim/init.lua"
export KITTY_CONFIG_DIRECTORY="$HOME/.dotfiles/kitty/.config/kitty"
