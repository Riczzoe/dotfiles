#!/usr/bin/env zsh

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias g="git"

# List all files colorized in long format
alias l="ls -lF --color=auto"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF --color=auto"

# List only directories
alias lsd="ls -lF --color=auto | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls --color=auto"

alias gms='git commit -S -m'
alias pok='python ok --local'
alias pdoc='python -m doctest -v'

alias gpgsign='echo "test" | gpg --sign'
alias emacs='emacs -nw'
