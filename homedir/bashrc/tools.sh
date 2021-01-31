#!/bin/bash

ferror(){
    printf "Error: %s\n" "$1" 1>&2
}


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

separator(){ printf '=%.0s' {0..30}; echo; }



printfnumber(){
    LC_NUMERIC=en_US printf "%'.f\n" "${1}"
}



# Copies a .srt to the correct name on dir
srt_anchor(){
    shopt -s nullglob
    {
        local srts=(./*.srt)
        local mp4s=(./*.mp4 ./*.mkv)
        [[ ${#mp4s[@]} -ne 1 ]] &&
            { ferror "video not found or more than 1 found"; return 1; }
        [[ ${#srts[@]} -ne 1 ]] &&
            { ferror "subtitle not found or more than 1 found"; return 1; }
        local srt="${srts[0]}"
        local mp4="${mp4s[0]}"
        # do it!
        mv -iv "${srt}" "${mp4%.*}.srt"
    }
    shopt -u nullglob
    return 0
}

# Downloads .zip archive from github url
gh-download(){
    set -x
    local url="${1}"
    local branch="${2:-master}"
    local rate="${3:-2000k}"

    local user_repo="${url#*github.com/}"    # cbaggers/cepl/
    local repo="${user_repo#*/}"             # cepl
    local repo_directory="${repo}-${branch}" # cepl-master
    local zip_url="${url}/archive/${branch}.zip"

    [[ ! -d $repo_directory ]] &&
        {
            wget --limit-rate="${rate}" -c "${zip_url}";
            unzip -e "${branch}.zip" &&
                echo "$url" > "$repo_directory"/GITHUB_URL &&
                date        > "$repo_directory"/GITHUB_DATE &&
                rm -f "${branch}.zip"
        }
    set +x
}

# Keeps watching the file until it dissapears...
watchman(){
    local FILE="$1"
    [[ -f $FILE ]] || { echo "File does not exists!"; return 1; }
    while :; do
        sleep 1
        echo -n "."
        [[ -f $FILE ]] || { echo "... file dissapeared"; break; }
    done
    echo -e "\n"
    return 0
}

# https://gist.github.com/cmlewis/f950d876171a11703f89
ffmpeg_rotate(){
    [[ $# -ne 2 ]] && { ferror "needs two params, 1st is file, 2nd rotation in deg"; return 1; }
    [[ ! -f $1 ]] && { ferror "file does not exists"; return 1; }
    local video="$1"
    local opts=""
    case $2 in
        90)   opts="transpose=1" ;;
        90f)  opts="transpose=3" ;;
        180)  opts="transpose=2,transpose=2" ;;
        270)  opts="transpose=2" ;;
        270f) opts="transpose=0" ;;
        *) ferror "should have been a value among 90, 180 or 270"
    esac
    [[ -z $opts ]] && return 1
    set -x
    ffmpeg -i "${video}" -vf "${opts}" -codec:a copy out.mp4
    set +x
    return 0
}


