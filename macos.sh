#!/bin/sh

if ! command -v brew &> /dev/null; then
  echo "installing brew and basic packages..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  command brew install stow neovim starship zoxide exa node zsh-completions
  command chmod go-w '/opt/homebrew/share'
  command chmod -R go-w '/opt/homebrew/share/zsh'
fi

command stow --ignore=\.git/ */
