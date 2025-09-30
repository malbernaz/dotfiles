#!/bin/sh

if ! command -v brew &> /dev/null; then
  echo "installing brew and basic packages..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  command brew install \
    stow \
    fish \
    wezterm \
    neovim \
    helix \
    zoxide \
    fzf
fi

command stow .
