#!/bin/bash


# https://stackoverflow.com/questions/44274194/how-do-i-remove-tput-color-from-log-file
# https://stackoverflow.com/questions/17998978/removing-colors-from-output
#sed -e 's#\x1B\[^m\]*m##g' /dev/stdin
grinch(){
    sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" /dev/stdin
}
lowercase(){
    tr '[[:upper:]]' '[[:lower:]]' < /dev/stdin
}
uppercase(){
    tr '[[:lower:]]' '[[:upper:]]' < /dev/stdin
}
trim(){ awk '{$1=$1};1' /dev/stdin; }
uncomment(){
    grep -v -e '^$' -e '^#' -e '^//' -e '^;' /dev/stdin \
        | sed -e 's/#.*$//g' \
        | sed -e 's/;;.*$//g'
}

xhtml(){
    xmlpath="$1"
    xmllint --html --xpath "${xmlpath}" - 2>/dev/null
}


# Add before/after

prefix(){ sed 's#^#'"${1}"'#g'; }
suffix(){ sed 's#$#'"${1}"'#g'; }

# Grep Highlight

highlight(){
    grep --color=always -e '^' -e
}

#
# Greppers
#
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
grepip(){
    grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" /dev/stdin
}
