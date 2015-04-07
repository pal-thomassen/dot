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

alias vim='emacsclient -nw'
alias vi=vim
alias nw=/Applications/node-webkit.app/Contents/MacOS/node-webkit
# alias sll=/usr/local/Cellar/sl/5.02/bin/sl
# alias cask=/usr/local/Cellar/cask/0.7.2/bin/cask

export JOURNAL_DIR=~/Documents/journal
alias journal=$HOME/dev/ajoslin/journal/journal.sh
setopt CLOBBER

# Disable zsh autocorrect
unsetopt CORRECT
ionic-docs() {
  open http://ionicframework.com/docs/$1/api/
}
node-docs() { open https://nodejs.org/docs/v$1/api }

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [[ -n ${EMACS} ]]; then
    zstyle ':prezto:module:terminal' auto-title 'no'
fi

tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
