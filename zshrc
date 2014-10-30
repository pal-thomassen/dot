source ~/.zprezto/init.zsh

export PATH=$PATH:$HOME/.config/powerline-github/scripts/

export TERMINAL_DARK=1
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR=vi
export RCRC=$HOME/dot/rcrc

alias vi=vim
alias nvi=nvim

export JOURNAL_DIR=~/Documents/journal
alias journal=$HOME/dev/ajoslin/journal/journal.sh

# Disable zsh autocorrect
unsetopt CORRECT
zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
