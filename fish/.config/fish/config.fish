if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Path
fish_add_path ~/.yarn/bin
fish_add_path ~/.cargo/bin

# Editor
set EDITOR 'nvim'
set GIT_EDITOR 'nvim'

# Aliases
alias v=nvim
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