# Path
fish_add_path ~/.yarn/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

# Editor
set EDITOR 'nvim'
set GIT_EDITOR 'nvim'

set NVIMRC $HOME/.dotfiles/nvim/.config/nvim/init.lua
set KITTY_CONFIG_DIRECTORY $HOME/.dotfiles/kitty/.config/kitty

# Aliases
alias v=nvim
alias p=pnpm
alias z=zed
function gpo
  git push -u origin (git_branch)
end

if [ -f /opt/homebrew/bin/brew ]
  eval (/opt/homebrew/bin/brew shellenv)
end
