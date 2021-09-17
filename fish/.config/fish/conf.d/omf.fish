# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Editor
set EDITOR 'nvim'

# Aliases
set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpo="git push -u origin $git_branch"
alias v=nvim
