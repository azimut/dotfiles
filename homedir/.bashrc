#!/bin/bash

source ~/.bash_secret

PS1='[\[\033[36m\]\w\[\033[0m\]] > '

# Put your fun stuff here.
export PATH=$PATH:~/.bin
export PATH=$PATH:~/projects/scripts/scripts
export PATH=$PATH:/usr/local/bro/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

export UA="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0"

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

export PAGER=less
export LESS="-SR"
export GREP_COLOR='1;30;42'

# Ref: https://wiki.archlinux.org/index.php/GTK_(Espa%C3%B1ol)
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export TERM=xterm-256color

alias rm='rm -i'
alias ls='ls -p --color'
alias cp='cp -i'

# --no-playlist
alias ytmp3='youtube-dl --no-post-overwrites -x -f bestaudio -i -k --audio-format mp3'

alias emacs='XMODIFIERS= emacs'

alias git-fsless='GIT_LFS_SKIP_SMUDGE=1 git clone'
alias git-grep='git rev-list --all | xargs git grep'
alias grep-code='grep -I -r --color=always'
alias g1='git clone --depth=1'
alias columnt='column -t'

alias j=journalctl
alias s="sudo systemctl"

# gnu-parallel
. `which env_parallel.bash`

