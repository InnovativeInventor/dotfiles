#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Editor stuff
alias vim='nvim'
export EDITOR="nvim"

export PATH=$HOME/.cargo/bin:$PATH
eval "$(starship init bash)"
export PATH=$HOME/.cabal/bin:$PATH
# export CARGO_NET_GIT_FETCH_WITH_CLI=true


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.shell
