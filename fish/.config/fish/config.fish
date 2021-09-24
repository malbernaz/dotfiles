if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source

# Editor
set EDITOR 'nvim'
set GIT_EDITOR 'nvim'

# Aliases
set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpo="git push -u origin $git_branch"
alias v=nvim

