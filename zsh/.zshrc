export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda"

plugins=(git vi-mode yarn nvm thefuck)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# add hidden files to autocomplete
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# aliases
alias c=wl-copy
alias p=wl-paste
alias vi=nvim
alias vim=nvim
alias lite=lite-xl
alias df="cd $HOME/.dotfiles"

# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

export _JAVA_OPTIONS='-Djdk.gtk.version=2'

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

