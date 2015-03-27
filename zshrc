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
export EDITOR=/usr/local/bin/vim
export RCRC=$HOME/dot/rcrc

alias vi=/usr/local/bin/vim
alias nw=/Applications/node-webkit.app/Contents/MacOS/node-webkit

export JOURNAL_DIR=~/Documents/journal
alias journal=$HOME/dev/ajoslin/journal/journal.sh
setopt CLOBBER

# Disable zsh autocorrect
unsetopt CORRECT

ionic-docs() {
  open http://ionicframework.com/docs/$1/api/
}
node-docs() { open https://nodejs.org/docs/v$1/api }
