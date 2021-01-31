#!/bin/bash

board_dl(){
    set -x
    local domain="${1}"
    local url="${2}"
    local result=()
    if result=($(torsocks wget -O - "${domain}/${url}" | tr '"' $'\n' | grep media | grep jpg)); then
        result=(${result[@]/#/${domain}})
        printf "%s\n" "${result[@]}" | sort | uniq | torsocks aria2c -i - --async-dns=false --max-concurrent-downloads=2 --continue=true
    fi
    set +x
}

board_dl_webm(){
    set -x
    local domain="${1}"
    local url="${2}"
    local result=()
    if result=($(torsocks wget -O - "${domain}/${url}" | tr '"' $'\n' | grep media | fgrep -e .webm -e .mp4)); then
        result=(${result[@]/#/${domain}})
        printf "%s\n" "${result[@]}" | sort | uniq | torsocks aria2c -i - --async-dns=false --max-concurrent-downloads=2 --continue=true
    fi
    set +x
}

xv(){
    local user=$1
    local page=$2
    export burl=$(echo -n 'aHR0cHM6Ly93d3cueHZpZGVvcy5jb20=' | base64 -d)
    local links=($(wget -O - -q ${burl}/profiles/${user}/videos/new/${page} \
                       | xhtml '//div[@class="thumb-block "]/div[@class="thumb-inside"]/div[@class="thumb"]/a/@href' \
                       | tr ' ' $'\n' \
                       | sed 's#THUMBNUM/##g' \
                       | cut -f2 -d'"'))
    mkdir -p "${user}"
    cd "${user}" && {
        for link in ${links[@]}; do
            youtube-dl -c ${burl}${link}
        done
    }
}

