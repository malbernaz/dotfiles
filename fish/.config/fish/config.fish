# Path
fish_add_path ~/.yarn/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path /opt/homebrew/opt/rustup/bin

# Editor
set EDITOR nvim
set GIT_EDITOR nvim

set NVIMRC $HOME/.dotfiles/nvim/.config/nvim/init.lua
set KITTY_CONFIG_DIRECTORY $HOME/.dotfiles/kitty/.config/kitty

# Aliases
alias v=nvim
alias p=pnpm
alias :q=exit
function gpo
    git push -u origin (git_branch)
end

if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end

zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/malbernaz/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
