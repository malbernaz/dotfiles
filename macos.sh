#!/bin/sh

if ! command -v brew &> /dev/null; then
  echo "installing brew..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v stow &> /dev/null; then
  echo "installing stow..."
  command brew install stow
fi

if ! command -v nvim &> /dev/null; then
  echo "installing neovim..."
  command brew install neovim
fi

command stow --ignore=\.git/ */
