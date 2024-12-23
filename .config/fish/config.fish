# Path
fish_add_path ~/.yarn/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path /opt/homebrew/opt/rustup/bin

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
function gpo
    git push -u origin (git_branch)
end

if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end

zoxide init --cmd cd fish | source

# pnpm
set -gx PNPM_HOME "/Users/malbernaz/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
