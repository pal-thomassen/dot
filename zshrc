if [[ -z $TMUX ]]; then
  tmux new-session -t main
fi

source ~/.zprezto/init.zsh
source ~/.config/z/z.sh

zstyle ':completion:*:*:git:*' script ~/.config/git-completion.bash

alias anon-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp --no-default-browser-check --no-first-run --disable-default-apps --disable-popup-blocking --disable-translate'

export EMAIL="andrewtjoslin@gmail.com"
export NAME="Andrew Joslin"

export TERM=xterm-256color
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR=vim
export RCRC=$HOME/dot/rcrc
export GOPATH=$HOME/gocode
export AWS_REGION=us-west-2
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.bin:/usr/local/bin:/opt/local/bin:$HOME/terraform:$GOPATH/bin:/usr/local/Cellar/logstash/2.3.2/bin:$PATH:$HOME/.rvm/bin"
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=$(/usr/libexec/java_home)

# GPG
# Remember to add `use-agent` to `~/.gnupg/gpg.conf`
# export GPG_TTY=$(tty)
# eval $(gpg-agent --daemon --sh)

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias gti=git
alias sll=/usr/local/Cellar/sl/5.02/bin/sl
alias ajpex="apex --profile andrewtjoslin"
alias ezpex="apex --profile eaze"
alias gitd='git daemon --base-path=. --export-all --enable=receive-pack --reuseaddr --informative-errors --verbose'

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

alias clocker="HOME=~/sync/andrew clocker"

setopt CLOBBER
# Disable zsh autocorrect
unsetopt CORRECT

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source /Users/andrew/.travis/travis.sh

# This file is not in source control
[ -f $HOME/.tokens ] && source ~/.tokens

export PATH="$HOME/.yarn/bin:$PATH"

vi () {
  FILE=${1:-.}

  # Make sure the socket ID has no slashes, emacs does not like that.
  EMACS_SOCKET="tmux$(tmux display -p '#{client_tty}' | sed 's|/|_|g')"

  ls $TMPDIR/emacs$UID | grep -q $EMACS_SOCKET || emacs -nw --daemon="$EMACS_SOCKET"
  emacsclient -nw -s "$EMACS_SOCKET" $FILE
}
