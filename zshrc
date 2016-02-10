source ~/.zprezto/init.zsh
source ~/.config/z/z.sh

# This file is not in source control
source ~/.tokens

zstyle ':completion:*:*:git:*' script ~/.config/git-completion.bash

alias anon-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --disable-translate'

export EMAIL="andrewtjoslin@gmail.com"
export NAME="Andrew Joslin"

export TERM=xterm-256color
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR='emacsclient -nw'
export RCRC=$HOME/dot/rcrc
export GOPATH=$HOME/gocode
export AWS_REGION=us-west-2
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.bin:/usr/local/bin:$HOME/terraform:$GOPATH/bin:$PATH"
export ANDROID_HOME="$HOME/Documents/android-sdk-macosx"

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias vi="emacsclient -nw"
alias gti=git
alias sll=/usr/local/Cellar/sl/5.02/bin/sl
alias ajpex="apex --profile andrewtjoslin"
alias ezpex="apex --profile eaze"
alias gitd="git daemon --export-all --reuseaddr --informative-errors  --verbose"

setopt CLOBBER
# Disable zsh autocorrect
unsetopt CORRECT

# added by travis gem
[ -f /Users/andrew/.travis/travis.sh ] && source /Users/andrew/.travis/travis.sh
