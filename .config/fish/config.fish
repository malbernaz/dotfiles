# Path
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/Library/pnpm

# Variables
set EDITOR hx
set GIT_EDITOR hx
set NVIMRC $HOME/.dotfiles/.config/nvim/init.lua
set --global nvm_default_version latest

# Aliases
alias ls="ls --color"
alias la="ls -la"
alias lg="lazygit"
alias v=nvim
alias p=pnpm
alias :q=exit
function gpo
    git push -u origin (git_branch)
end

# Homebrew
if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end
set -gx HOMEBREW_AUTO_UPDATE_SECS 604800 # one week
set -gx HOMEBREW_NO_ENV_HINTS "" # disable hints

# Zoxide
zoxide init --cmd cd fish | source
