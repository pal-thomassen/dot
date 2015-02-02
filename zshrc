source ~/.zprezto/init.zsh

# This file contains github tokens etc, and is gitignore'd
source ~/.tokens

zstyle ':completion:*:*:git:*' script ~/.config/git-completion.bash 

function gitdb() {
  git branch -D $1
  git push origin :$1
}

export TERMINAL_DARK=1
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR=vi
export RCRC=$HOME/dot/rcrc

alias vi=vim
alias nw=/Applications/node-webkit.app/Contents/MacOS/node-webkit

export JOURNAL_DIR=~/Documents/journal
alias journal=$HOME/dev/ajoslin/journal/journal.sh

# Disable zsh autocorrect
unsetopt CORRECT
zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
