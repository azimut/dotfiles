source ~/.bash_secret

# Put your fun stuff here.
export PATH=$PATH:~/.bin
export PATH=$PATH:~/projects/scripts/scripts

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

source ~/bashrc/go.sh
source ~/bashrc/python.sh
