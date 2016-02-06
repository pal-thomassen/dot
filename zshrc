source ~/.zprezto/init.zsh
source ~/.config/z/z.sh

# This file contains github tokens etc, and is gitignore'd
source ~/.tokens

zstyle ':completion:*:*:git:*' script ~/.config/git-completion.bash

function gitdb() {
  git branch -D $1
  git push origin :$1
}

alias anon-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --disable-translate'

export EMAIL="andrewtjoslin@gmail.com"
export NAME="Andrew Joslin"
export SMTPSERVER="smtp.gmail.com"

export TERMINAL_DARK=1
export TERM=xterm-256color
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR='emacsclient -nw'
export RCRC=$HOME/dot/rcrc
export GOPATH=$HOME/gocode
export AWS_REGION=us-west-2

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias e="emacsclient -nw"
alias gti=git
alias vi='e'
alias sll=/usr/local/Cellar/sl/5.02/bin/sl
alias ajpex="apex --profile andrewtjoslin"
alias ezpex="apex --profile eaze"

function npmo() {
  open "https://www.npmjs.com/package/$1"
}

function npms() {
  open "https://www.npmjs.com/search?q=$1"
}

setopt CLOBBER

# Disable zsh autocorrect
unsetopt CORRECT

alias gitd="git daemon --export-all --reuseaddr \
  --informative-errors  --verbose"

export PATH="/usr/local/bin:$HOME/terraform:$GOPATH/bin:$PATH"
export ANDROID_HOME="$HOME/Documents/android-sdk-macosx"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function journal() {
  if [[ -z "$1" ]]; then
    DATE=$(date +"%Y-%m-%d")
  else
    DATE=$1
  fi
  vi $HOME/sync/journal/$DATE.txt
}

function module () {
  mkdir $1
  cd $1
  git init
  yo bd
  rm -rf travis.yml .travis.yml
  touch circle.yml
  hub create
  git add .
  git commit -am "Initial Commit"
}

# added by travis gem
[ -f /Users/andrew/.travis/travis.sh ] && source /Users/andrew/.travis/travis.sh
