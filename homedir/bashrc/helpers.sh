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
