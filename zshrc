source ~/.zprezto/init.zsh

export PATH=$PATH:$HOME/.config/powerline-github/scripts/

# Used by tmux and vim to determine theme
export TERMINAL_THEME=tomorrow-night
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export EDITOR=vi
export RCRC=$HOME/dot/rcrc

alias vi=vim
alias nvi=nvim

unsetopt CORRECT
zstyle ':completion:*:*:git:*' script ~/.git-completion.sh
