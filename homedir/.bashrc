#!/bin/bash

export PAGER=less
export LESS="-SR"
export GREP_COLOR='1;30;42'

# Ref: https://wiki.archlinux.org/index.php/GTK_(Espa%C3%B1ol)
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

alias rm='rm -i'
alias ls='ls -p --color'
alias cp='cp -i'

# --no-playlist
alias ytmp3='youtube-dl --no-post-overwrites -x -f bestaudio -i -k --audio-format mp3'

alias emacs='XMODIFIERS= emacs'
alias sshdev='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $HOME/.ssh/id_rsa'
alias sssh="ssh -o ControlMaster=auto -o ControlPersist=8h -o ControlPath=/home/sendai/.ssh/ansible-ssh-%h-%p-%r"

alias git-fsless='GIT_LFS_SKIP_SMUDGE=1 git clone'
alias git-grep='git rev-list --all | xargs git grep'
alias grep-code='grep -I -r --color=always'
alias g1='git clone --depth=1'
alias columnt='column -t'


alias j=journalctl
alias s="sudo systemctl"


export UA="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0"

xhtml(){
    xmlpath="$1"
    xmllint --html --xpath "${xmlpath}" - 2>/dev/null
}


rand_play(){
    ( a=(*.mp3); IFS=$'\n' a=( $(printf '%s\n' "${a[@]}" | shuf) ) ; mpv -no-video "${a[@]}"; )
}
find_rand_play(){
    find $PWD -type f -iname '*mp3' | shuf | while read -r track; do mpv -no-video "$track"; done
}

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth



PS1='[\[\033[36m\]\w\[\033[0m\]] > '

export PATH=$PATH:~/projects/scripts/scripts
export PATH=$PATH:/usr/local/bro/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

LS_COLORS='bd=39;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=38;5;253:ln=target:mh=38;5;220;1:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;234;38;5;100;1:su=38;5;137:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*README=38;5;220;1:*.log=38;5;190:*.txt=38;5;253:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;5;184:*.nfo=38;5;184:*.tex=38;5;184:*.textile=38;5;184:*.xml=38;5;199:*.json=38;5;199:*.yml=38;5;199:*.cbr=38;5;141:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.docm=38;5;111;4:*.docx=38;5;111:*.eps=38;5;111:*.odb=38;5;111:*.odt=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.ppt=38;5;166:*.csv=38;5;78:*.ods=38;5;112:*.xla=38;5;76:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.cfg=1:*.conf=1:*.ini=1:*.rc=1:*.vim=1:*.viminfo=1:*.pcf=1:*.psf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5;172:*.sh=38;5;172:*.zsh=38;5;172:*.ahk=38;5;29;1:*.py=38;5;41:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.asm=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.lua=38;5;81:*.c=38;5;81:*.C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:*.hpp=38;5;110:*.hxx=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.f=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.s=38;5;110:*.S=38;5;110:*.sx=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.PL=38;5;160:*.pyc=38;5;240:*.css=38;5;125;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;1:*.jsm=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.php=38;5;81:*.ctp=38;5;81:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.am=38;5;242:*.in=38;5;242:*.old=38;5;242:*.out=38;5;46;1:*.SKIP=38;5;244:*.diff=48;5;197;38;5;232:*.patch=48;5;197;38;5;232;1:*.bmp=38;5;97:*.cdr=38;5;97:*.gif=38;5;97:*.go=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97:*.png=38;5;97:*.svg=38;5;97:*.xpm=38;5;97:*.avi=38;5;114:*.divx=38;5;114:*.IFO=38;5;114:*.m2v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;115:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.ogv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.3ga=38;5;137;1:*.S3M=38;5;137;1:*.aac=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mid=38;5;137;1:*.midi=38;5;137;1:*.mod=38;5;137;1:*.mp3=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.ape=38;5;136;1:*.flac=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.afm=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.gz=38;5;40:*.rar=38;5;40:*.tar=38;5;40:*.tgz=38;5;40:*.xz=38;5;40:*.zip=38;5;40:*.apk=38;5;215:*.deb=38;5;215:*.jad=38;5;215:*.jar=38;5;215:*.cab=38;5;215:*.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.r00=38;5;239:*.r01=38;5;239:*.r02=38;5;239:*.r03=38;5;239:*.r04=38;5;239:*.r05=38;5;239:*.r06=38;5;239:*.r07=38;5;239:*.r08=38;5;239:*.r09=38;5;239:*.r10=38;5;239:*.r100=38;5;239:*.r101=38;5;239:*.r102=38;5;239:*.r103=38;5;239:*.r104=38;5;239:*.r105=38;5;239:*.r106=38;5;239:*.r107=38;5;239:*.r108=38;5;239:*.r109=38;5;239:*.r11=38;5;239:*.r110=38;5;239:*.r111=38;5;239:*.r112=38;5;239:*.r113=38;5;239:*.r114=38;5;239:*.r115=38;5;239:*.r116=38;5;239:*.r12=38;5;239:*.r13=38;5;239:*.r14=38;5;239:*.r15=38;5;239:*.r16=38;5;239:*.r17=38;5;239:*.r18=38;5;239:*.r19=38;5;239:*.r20=38;5;239:*.r21=38;5;239:*.r22=38;5;239:*.r25=38;5;239:*.r26=38;5;239:*.r27=38;5;239:*.r28=38;5;239:*.r29=38;5;239:*.r30=38;5;239:*.r31=38;5;239:*.r32=38;5;239:*.r33=38;5;239:*.r34=38;5;239:*.r35=38;5;239:*.r36=38;5;239:*.r37=38;5;239:*.r38=38;5;239:*.r39=38;5;239:*.r40=38;5;239:*.r41=38;5;239:*.r42=38;5;239:*.r43=38;5;239:*.r44=38;5;239:*.r45=38;5;239:*.r46=38;5;239:*.r47=38;5;239:*.r48=38;5;239:*.r49=38;5;239:*.r50=38;5;239:*.r51=38;5;239:*.r52=38;5;239:*.r53=38;5;239:*.r54=38;5;239:*.r55=38;5;239:*.r56=38;5;239:*.r57=38;5;239:*.r58=38;5;239:*.r59=38;5;239:*.r60=38;5;239:*.r61=38;5;239:*.r62=38;5;239:*.r63=38;5;239:*.r64=38;5;239:*.r65=38;5;239:*.r66=38;5;239:*.r67=38;5;239:*.r68=38;5;239:*.r69=38;5;239:*.r69=38;5;239:*.r70=38;5;239:*.r71=38;5;239:*.r72=38;5;239:*.r73=38;5;239:*.r74=38;5;239:*.r75=38;5;239:*.r76=38;5;239:*.r77=38;5;239:*.r78=38;5;239:*.r79=38;5;239:*.r80=38;5;239:*.r81=38;5;239:*.r82=38;5;239:*.r83=38;5;239:*.r84=38;5;239:*.r85=38;5;239:*.r86=38;5;239:*.r87=38;5;239:*.r88=38;5;239:*.r89=38;5;239:*.r90=38;5;239:*.r91=38;5;239:*.r92=38;5;239:*.r93=38;5;239:*.r94=38;5;239:*.r95=38;5;239:*.r96=38;5;239:*.r97=38;5;239:*.r98=38;5;239:*.r99=38;5;239:*.part=38;5;239:*.iso=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.localstorage=38;5;60:*.sqlite=38;5;60:*.typelib=38;5;60:*.pacnew=38;5;33:*.un~=38;5;241:*.BUP=38;5;241:*.bak=38;5;241:*.o=38;5;241:*.swp=38;5;244:*.swo=38;5;244:*.tmp=38;5;244:*.pid=38;5;248:*.state=38;5;248:*.dump=38;5;241:*.err=38;5;160;1:*.error=38;5;160;1:*.zcompdump=38;5;241:*.zwc=38;5;241:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.allow=38;5;112:*.deny=38;5;196:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=38;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.timer=38;5;45:*.snapshot=38;5;45:*.application=38;5;116:*.cue=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:*.m3u8=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.srt=38;5;116:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;192;3:*.pgp=38;5;192;3:*.asc=38;5;192;3:*.enc=38;5;192;3:*.32x=38;5;137:*.cdi=38;5;124:*.fm2=38;5;35:*.rom=38;5;59;1:*.sav=38;5;220:*.st=38;5;208;1:*.a00=38;5;11:*.a52=38;5;112:*.A64=38;5;82:*.a64=38;5;82:*.a78=38;5;112:*.adf=38;5;35:*.atr=38;5;213:*.gb=38;5;203:*.gba=38;5;205:*.gbc=38;5;204:*.gel=38;5;83:*.gg=38;5;138:*.ggl=38;5;83:*.ipk=38;5;117:*.j64=38;5;102:*.nds=38;5;193:*.nes=38;5;160:*.sms=38;5;33:*.pot=38;5;166:*.pcb=38;5;28:*.mm=38;5;130;3:*.pod=38;5;172;1:*.gbr=38;5;2:*.pl=38;5;214:*.spl=38;5;2:*.1p=38;5;160:*.3p=38;5;160:*.cnc=38;5;37:*.def=38;5;136:*.ex=38;5;148;1:*.example=38;5;225;1:*.ger=38;5;2:*.map=38;5;58;3:*.mf=38;5;220;3:*.mfasl=38;5;73:*.mht=38;5;129:*.mi=38;5;124:*.mtx=38;5;36;3:*.pc=38;5;100:*.pi=38;5;126:*.plt=38;5;204;1:*.pm=38;5;197;1:*.rb=38;5;192:*.rdf=38;5;144:*.rst=38;5;67:*.ru=38;5;142:*.sch=38;5;34:*.sis=38;5;39:*.sty=38;5;58:*.sug=38;5;44:*.t=38;5;28;1:*.tdy=38;5;214:*.tfm=38;5;64:*.tfnt=38;5;140:*.tg=38;5;99:*.xln=38;5;37:*.scm=38;5;204;1:';
export LS_COLORS

ansible_env(){
    addconda
    source activate $HOME/miniconda
    cd $HOME/projects/ansible
    source hacking/env-setup
    cd -
}
# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Golang
export GOPATH=$HOME/go
#export GOROOT=$HOME/go
#export GOPATH=/usr/lib64/go
#export GOROOT=/usr/lib64/go

torchmedown(){
    . $HOME/projects/distro/install/bin/torch-activate
    export  CUDA_BIN_PATH=/opt/cuda
}

screen_name(){
    printf "\033k%s\033\\" "$@"
}

export TERM=xterm-256color




# Put your fun stuff here.
export PATH=$PATH:~/.bin

ferror(){
    printf "Error: %s\n" "$1" 1>&2
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

is_number(){
    local re='^[0-9]+$'
    [[ $1 =~ $re ]]
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

# Erlang
export PATH=$HOME/.cache/rebar3/bin:$PATH
export PATH=$HOME/.kerl/builds/22.1/release_22.1/bin/:$PATH

# LUA
export PATH=$HOME/.luarocks/bin:$PATH

# Ruby
export PATH=$HOME/bin:$PATH

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# https://stackoverflow.com/questions/44274194/how-do-i-remove-tput-color-from-log-file
# https://stackoverflow.com/questions/17998978/removing-colors-from-output
#sed -e 's#\x1B\[^m\]*m##g' /dev/stdin
grinch(){
    sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" /dev/stdin
}
lowercase(){
    tr '[[:upper:]]' '[[:lower:]]' < /dev/stdin
}
alias uppercase="tr '[[:lower:]]' '[[:upper:]]'"
trim(){ awk '{$1=$1};1' /dev/stdin; }
uncomment(){
    grep -v -e '^$' -e '^#' -e '^//' -e '^;' /dev/stdin \
        | sed -e 's/#.*$//g' \
        | sed -e 's/;;.*$//g'
}
revdomain() {
    while read -r domain; do
        echo $(echo $domain | tr '.' $'\n' | tac | paste -sd'.')
    done < /dev/stdin
}
separator(){ printf '=%.0s' {0..30}; echo; }
worker_rmwildcard(){
    local original="${1}"
    local tld="${1#*.}"
    local check="moiuoxncw.${tld}"
    if output="$(dig +short A ${check} | wc -l)"; then
        if [[ $output -eq 0 ]]; then
            echo "${original}"
        fi
    fi
}
export -f worker_rmwildcard
rmwildcarddns(){
    mapfile -t domains < /dev/stdin
    parallel worker_rmwildcard ::: "${domains[@]}"
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

prefix(){ sed 's#^#'"${1}"'#g'; }
suffix(){ sed 's#$#'"${1}"'#g'; }

source ~/.bash_secret

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
# python2 cidrize
cidrpipe(){
    while read -r ip; do
        cidr $ip
    done < /dev/stdin
}

alias sortip='sort -V'
printfnumber(){
    LC_NUMERIC=en_US printf "%'.f\n" "${1}"
}
explode_domain(){
    local domain="${1}"
    local regex_dot='\.'
    echo ${domain}
    if [[ $domain =~ $regex_dot ]]; then
        explode_domain "${domain#*.}"
    fi
}
explode_domains(){
    local domains=(${@})
    for domain in ${domains[@]}; do
        explode_domain ${domain}
    done | sort | uniq
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
toptr(){
    cat /dev/stdin | revdomain | sed 's/$/.in-addr.arpa./g'
}
grepip(){
    grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" /dev/stdin
}
alias highlight="grep --color=always -e '^' -e"
topcompanies(){
    cat TOPSUBDOMAINTAKEOVER.md \
        | grep -E '\$[1-9][0-9][0-9]+' \
        | grep -E -o ') to [[:alnum:]]+ ' \
        | cut -f3 -d' ' \
        | sort | uniq -c | sort -n
}


. `which env_parallel.bash`

#mkdir "${HOME}/.npm-packages"
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
