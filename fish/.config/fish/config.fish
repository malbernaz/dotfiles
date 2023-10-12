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
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcl="git clone"
alias gpu="git pull"
alias gp="git push"
function gpo
  git push -u origin (git_branch) 
end

if [ -f /opt/homebrew/bin/brew ]
  eval (/opt/homebrew/bin/brew shellenv)
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
