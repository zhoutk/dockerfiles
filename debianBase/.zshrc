alias vi='vim'
alias vim='vim'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias py='python3'
alias pi='pip3'
alias grep="grep --color=auto"

alias javac="javac -J-Dfile.encoding=utf8"
alias s17="ssh root@47.93.253.17 -p 22"
alias s14="ssh root@u14.com -p 14"

PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=$PATH:/home/zhoutk/.yarn/bin

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

