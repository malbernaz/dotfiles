# Path
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/Library/pnpm

# Variables
set EDITOR nvim
set GIT_EDITOR nvim
set NVIMRC $HOME/.dotfiles/.config/nvim/init.lua
set KITTY_CONFIG_DIRECTORY $HOME/.dotfiles/.config/kitty

# Aliases
alias ls="ls --color"
alias la="ls -la"
alias lg="lazygit"
alias v=nvim
alias p=pnpm
alias :q=exit
alias gpo="git push -u origin $(git_branch)"

# Homebrew
if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end
set -gx HOMEBREW_AUTO_UPDATE_SECS 604800 # one week

# Zoxide
zoxide init --cmd cd fish | source
