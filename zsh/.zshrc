#!/bin/sh

# install zap if not installed
if [ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}/zap" ]; then
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi

# use starship propmpt if available
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# source zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

autoload -Uz compinit
compinit
