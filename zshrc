source ~/.zprezto/init.zsh
source ~/.config/z/z.sh

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
export EDITOR='emacsclient -nw'
export RCRC=$HOME/dot/rcrc
alias sll=/usr/local/Cellar/sl/5.02/bin/sl

alias e="emacsclient -nw"
alias vi='e'
alias nw=/Applications/node-webkit.app/Contents/MacOS/node-webkit
# alias sll=/usr/local/Cellar/sl/5.02/bin/sl
# alias cask=/usr/local/Cellar/cask/0.7.2/bin/cask

export JOURNAL_DIR=~/Documents/journal
alias journal=$HOME/dev/ajoslin/journal/journal.sh
setopt CLOBBER

# Disable zsh autocorrect
unsetopt CORRECT

# Useful functions
ionic-docs() {
  VERSION=${1:-nightly}
  open http://ionicframework.com/docs/$VERSION/api/
}
node-docs() {
  open https://nodejs.org/docs/v$1/api
}
function freeport() {
    PORT=${1:-9000}
    lsof -i TCP:$PORT | awk '/LISTEN/{print $2}' | xargs kill -9;
    if $PORT !== dev 2>null; then
        echo "Port $PORT found and killed.";
    fi;
}

alias gitd="git daemon --export-all --reuseaddr \
  --informative-errors  --verbose"

export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL="$HOME/dot/config/themes/base16/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
