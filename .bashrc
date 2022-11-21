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

eval "$(starship init bash)"
export PATH=$HOME/.cabal/bin:$PATH

