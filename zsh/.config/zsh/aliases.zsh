#!/bin/sh

alias v=nvim
alias :q=exit
alias p=pnpm
alias cd=__zoxide_z
if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"ansi\"" 
  alias catt="bat --theme \"ansi\"" 
fi
