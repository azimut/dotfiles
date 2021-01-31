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


xhtml(){
    xmlpath="$1"
    xmllint --html --xpath "${xmlpath}" - 2>/dev/null
}


ferror(){
    printf "Error: %s\n" "$1" 1>&2
}


is_number(){
    local re='^[0-9]+$'
    [[ $1 =~ $re ]]
}

separator(){ printf '=%.0s' {0..30}; echo; }

intersection(){
    [[ $# -ne 2 ]] && { ferror "needs 2 arguments"; return 1; }
    [[ (-f $1 || -p $1) && (-f $2 || -p $2) ]] || { ferror "arguments need to be a file"; return 1; }
    local filea="$1"
    local fileb="$2"
    grep -F -xf "$filea" "$fileb"
}

complement(){
    [[ $# -ne 2 ]] && { ferror "needs 2 arguments"; return 1; }
    [[ (-f $1 || -p $1) && (-f $2 || -p $2) ]] || { ferror "arguments need to be a file"; return 1; }
    local filea="$1"
    local fileb="$2"
    grep -F -vxf "$filea" "$fileb"
}

prefix(){ sed 's#^#'"${1}"'#g'; }
suffix(){ sed 's#$#'"${1}"'#g'; }

greplinkdomain(){
    grep -Eo '(http|https)://[^/"]+' /dev/stdin | cut -f3 -d/
}

greplink(){
    grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" /dev/stdin
}

grepdomain(){
    egrep -I -h -o '[-_[:alnum:]\.]+\.'${1} -r . \
        | sed 's/^2F//g' \
        | sed 's/^32m//g' \
        | sed 's/^253A//g' \
        | sort | uniq
}
grepsubdomain(){
    local domain=${1}
    grepdomain | sed 's/.'${domain}'$//g'
}
printfnumber(){
    LC_NUMERIC=en_US printf "%'.f\n" "${1}"
}
upsert_in_file(){
    local file="${1}"
    shift
    local inserts=(${@})
    [[ ! -f ${file} ]] && return 1
    for insert in ${inserts[@]}; do
        grep -qxF "${insert}" "${file}" \
            || echo "${insert}" >> "${file}"
    done
}
grepip(){
    grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" /dev/stdin
}
highlight(){
    grep --color=always -e '^' -e
}
. `which env_parallel.bash`

