source ~/.zprezto/init.zsh
source ~/.config/z/z.sh

# This file contains github tokens etc, and is gitignore'd
source ~/.tokens

zstyle ':completion:*:*:git:*' script ~/.config/git-completion.bash

function gitdb() {
  git branch -D $1
  git push origin :$1
}

source ~/dev/make-module/module.sh
alias anon-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --disable-translate'

export TERMINAL_DARK=1
export TERM=xterm-256color
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR='emacsclient -nw'
export RCRC=$HOME/dot/rcrc

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias e="emacsclient -nw"
alias gti=git
alias vi='e'
alias sll=/usr/local/Cellar/sl/5.02/bin/sl
alias composer="php $HOME/dev/composer.phar"

export DAYBOOK_DIR=~/sync/journal
setopt CLOBBER

# Disable zsh autocorrect
unsetopt CORRECT

# Useful functions
function freeport() {
    PORT=${1:-9000}
    lsof -i TCP:$PORT | awk '/LISTEN/{print $2}' | xargs kill -9;
    if $PORT !== dev 2>null; then
        echo "Port $PORT found and killed.";
    fi;
}

alias gitd="git daemon --export-all --reuseaddr \
  --informative-errors  --verbose"

export PATH="/usr/local/bin:$PATH"
export ANDROID_HOME="$HOME/Documents/android-sdk-macosx"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# added by travis gem
[ -f /Users/andrew/.travis/travis.sh ] && source /Users/andrew/.travis/travis.sh
