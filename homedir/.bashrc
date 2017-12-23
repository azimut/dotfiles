# HTTP
# ----

# Generic discovery
# =================

# Fast: http-title,http-shellshock,whois*,http-vuln-cve2012-1823,http-vuln-cve2011-3368,http-robots.txt,http-methods,http-date,http-server-header,http-cors,http-headers,http-git,http-malware-host,http-mobileversion-checker,http-generator,http-php-version

# Apache: http-apache-negotiation,http-userdir-enum

# Fast: 

# Meh: http-exif-spider,http-backup-finder,http-auth-finder,http-enum,http-sitemap-generator,http-feed,http-comments-displayer,http-config-backup,http-default-accounts

# Slow: 

# Vulns: http-stored-xss,http-dombased-xss,http-phpself-xss
#        http-sql-injection
#        http-csrf
#        http-rfi-spider

# Brute: 

# FTP
# ---

# * banner,ftp-anon
# * ftp-brute --script-args='ftp.brute='ftp-brute.timeout=10s'
# * ftp-proftpd-backdoor,ftp-vuln-cve2010-4221
# * ftp-vsftpd-backdoor

alias rm='rm -i'

nmap_pupil(){
    local target="$@"
    set -x
    sudo proxychains nmap \
        -vvvvv \
        --send-ip \
        -sS \
        -Pn \
        -n \
        --ttl 69 \
        --reason \
        --open \
        -F \
        -oA "${target}".fast \
        "${target}"
    { set +x ;} &>/dev/null
}
nmap_iris(){
    local ports="$1"
    local target="$2"
    set -x
    sudo proxychains nmap \
        -vvvvv \
        --send-ip \
        -sS \
        -Pn \
        -n \
        --ttl 69 \
        --reason \
        --open \
        --top-ports "$ports" \
        -oA "${target}".top"${ports}" \
        "${target}"
    { set +x ;} &>/dev/null
}
nmap_limbus(){
    local target="$@"
    set -x
    sudo proxychains nmap \
        -vvvvv \
        --send-ip \
        -sS \
        -Pn \
        -n \
        --ttl 69 \
        --reason \
        --open \
        -p- \
        -oA "${target}".topall \
        "${target}"
    { set +x ;} &>/dev/null
}

addconda3(){
unset PYTHONPATH
export PATH=/home/sendai/miniconda3/bin:$PATH
source activate /home/sendai/miniconda3/
}

addconda22(){
unset PYTHONPATH
export PATH=/home/sendai/miniconda22/bin:$PATH
source activate /home/sendai/miniconda22/
}
addconda(){
export PATH=/home/sendai/miniconda2/bin:$PATH
source activate /home/sendai/miniconda2/
}
addconda27(){
export PATH=/home/sendai/miniconda27/bin:$PATH
source activate /home/sendai/miniconda27/
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

alias sshdev='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $HOME/.ssh/id_rsa'

PS1='[\[\033[36m\]\w\[\033[0m\]] > '

export PATH=$PATH:~/projects/scripts/scripts
export PATH=$PATH:/usr/local/bro/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

LS_COLORS='bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=38;5;253:ln=target:mh=38;5;220;1:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;234;38;5;100;1:su=38;5;137:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*README=38;5;220;1:*.log=38;5;190:*.txt=38;5;253:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;5;184:*.nfo=38;5;184:*.tex=38;5;184:*.textile=38;5;184:*.xml=38;5;199:*.json=38;5;199:*.yml=38;5;199:*.cbr=38;5;141:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.docm=38;5;111;4:*.docx=38;5;111:*.eps=38;5;111:*.odb=38;5;111:*.odt=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.ppt=38;5;166:*.csv=38;5;78:*.ods=38;5;112:*.xla=38;5;76:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.cfg=1:*.conf=1:*.ini=1:*.rc=1:*.vim=1:*.viminfo=1:*.pcf=1:*.psf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5;172:*.sh=38;5;172:*.zsh=38;5;172:*.ahk=38;5;29;1:*.py=38;5;41:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.asm=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.lua=38;5;81:*.c=38;5;81:*.C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:*.hpp=38;5;110:*.hxx=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.f=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.s=38;5;110:*.S=38;5;110:*.sx=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.PL=38;5;160:*.pyc=38;5;240:*.css=38;5;125;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;1:*.jsm=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.php=38;5;81:*.ctp=38;5;81:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.am=38;5;242:*.in=38;5;242:*.old=38;5;242:*.out=38;5;46;1:*.SKIP=38;5;244:*.diff=48;5;197;38;5;232:*.patch=48;5;197;38;5;232;1:*.bmp=38;5;97:*.cdr=38;5;97:*.gif=38;5;97:*.go=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97:*.png=38;5;97:*.svg=38;5;97:*.xpm=38;5;97:*.avi=38;5;114:*.divx=38;5;114:*.IFO=38;5;114:*.m2v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;115:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.ogv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.3ga=38;5;137;1:*.S3M=38;5;137;1:*.aac=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mid=38;5;137;1:*.midi=38;5;137;1:*.mod=38;5;137;1:*.mp3=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.ape=38;5;136;1:*.flac=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.afm=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.gz=38;5;40:*.rar=38;5;40:*.tar=38;5;40:*.tgz=38;5;40:*.xz=38;5;40:*.zip=38;5;40:*.apk=38;5;215:*.deb=38;5;215:*.jad=38;5;215:*.jar=38;5;215:*.cab=38;5;215:*.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.r00=38;5;239:*.r01=38;5;239:*.r02=38;5;239:*.r03=38;5;239:*.r04=38;5;239:*.r05=38;5;239:*.r06=38;5;239:*.r07=38;5;239:*.r08=38;5;239:*.r09=38;5;239:*.r10=38;5;239:*.r100=38;5;239:*.r101=38;5;239:*.r102=38;5;239:*.r103=38;5;239:*.r104=38;5;239:*.r105=38;5;239:*.r106=38;5;239:*.r107=38;5;239:*.r108=38;5;239:*.r109=38;5;239:*.r11=38;5;239:*.r110=38;5;239:*.r111=38;5;239:*.r112=38;5;239:*.r113=38;5;239:*.r114=38;5;239:*.r115=38;5;239:*.r116=38;5;239:*.r12=38;5;239:*.r13=38;5;239:*.r14=38;5;239:*.r15=38;5;239:*.r16=38;5;239:*.r17=38;5;239:*.r18=38;5;239:*.r19=38;5;239:*.r20=38;5;239:*.r21=38;5;239:*.r22=38;5;239:*.r25=38;5;239:*.r26=38;5;239:*.r27=38;5;239:*.r28=38;5;239:*.r29=38;5;239:*.r30=38;5;239:*.r31=38;5;239:*.r32=38;5;239:*.r33=38;5;239:*.r34=38;5;239:*.r35=38;5;239:*.r36=38;5;239:*.r37=38;5;239:*.r38=38;5;239:*.r39=38;5;239:*.r40=38;5;239:*.r41=38;5;239:*.r42=38;5;239:*.r43=38;5;239:*.r44=38;5;239:*.r45=38;5;239:*.r46=38;5;239:*.r47=38;5;239:*.r48=38;5;239:*.r49=38;5;239:*.r50=38;5;239:*.r51=38;5;239:*.r52=38;5;239:*.r53=38;5;239:*.r54=38;5;239:*.r55=38;5;239:*.r56=38;5;239:*.r57=38;5;239:*.r58=38;5;239:*.r59=38;5;239:*.r60=38;5;239:*.r61=38;5;239:*.r62=38;5;239:*.r63=38;5;239:*.r64=38;5;239:*.r65=38;5;239:*.r66=38;5;239:*.r67=38;5;239:*.r68=38;5;239:*.r69=38;5;239:*.r69=38;5;239:*.r70=38;5;239:*.r71=38;5;239:*.r72=38;5;239:*.r73=38;5;239:*.r74=38;5;239:*.r75=38;5;239:*.r76=38;5;239:*.r77=38;5;239:*.r78=38;5;239:*.r79=38;5;239:*.r80=38;5;239:*.r81=38;5;239:*.r82=38;5;239:*.r83=38;5;239:*.r84=38;5;239:*.r85=38;5;239:*.r86=38;5;239:*.r87=38;5;239:*.r88=38;5;239:*.r89=38;5;239:*.r90=38;5;239:*.r91=38;5;239:*.r92=38;5;239:*.r93=38;5;239:*.r94=38;5;239:*.r95=38;5;239:*.r96=38;5;239:*.r97=38;5;239:*.r98=38;5;239:*.r99=38;5;239:*.part=38;5;239:*.iso=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.localstorage=38;5;60:*.sqlite=38;5;60:*.typelib=38;5;60:*.pacnew=38;5;33:*.un~=38;5;241:*.BUP=38;5;241:*.bak=38;5;241:*.o=38;5;241:*.swp=38;5;244:*.swo=38;5;244:*.tmp=38;5;244:*.pid=38;5;248:*.state=38;5;248:*.dump=38;5;241:*.err=38;5;160;1:*.error=38;5;160;1:*.zcompdump=38;5;241:*.zwc=38;5;241:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.allow=38;5;112:*.deny=38;5;196:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=38;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.timer=38;5;45:*.snapshot=38;5;45:*.application=38;5;116:*.cue=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:*.m3u8=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.srt=38;5;116:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;192;3:*.pgp=38;5;192;3:*.asc=38;5;192;3:*.enc=38;5;192;3:*.32x=38;5;137:*.cdi=38;5;124:*.fm2=38;5;35:*.rom=38;5;59;1:*.sav=38;5;220:*.st=38;5;208;1:*.a00=38;5;11:*.a52=38;5;112:*.A64=38;5;82:*.a64=38;5;82:*.a78=38;5;112:*.adf=38;5;35:*.atr=38;5;213:*.gb=38;5;203:*.gba=38;5;205:*.gbc=38;5;204:*.gel=38;5;83:*.gg=38;5;138:*.ggl=38;5;83:*.ipk=38;5;117:*.j64=38;5;102:*.nds=38;5;193:*.nes=38;5;160:*.sms=38;5;33:*.pot=38;5;166:*.pcb=38;5;28:*.mm=38;5;130;3:*.pod=38;5;172;1:*.gbr=38;5;2:*.pl=38;5;214:*.spl=38;5;2:*.1p=38;5;160:*.3p=38;5;160:*.cnc=38;5;37:*.def=38;5;136:*.ex=38;5;148;1:*.example=38;5;225;1:*.ger=38;5;2:*.map=38;5;58;3:*.mf=38;5;220;3:*.mfasl=38;5;73:*.mht=38;5;129:*.mi=38;5;124:*.mtx=38;5;36;3:*.pc=38;5;100:*.pi=38;5;126:*.plt=38;5;204;1:*.pm=38;5;197;1:*.rb=38;5;192:*.rdf=38;5;144:*.rst=38;5;67:*.ru=38;5;142:*.sch=38;5;34:*.sis=38;5;39:*.sty=38;5;58:*.sug=38;5;44:*.t=38;5;28;1:*.tdy=38;5;214:*.tfm=38;5;64:*.tfnt=38;5;140:*.tg=38;5;99:*.xln=38;5;37:*.scm=38;5;204;1:';
export LS_COLORS

ansible_env(){
    addconda
    source activate $HOME/miniconda
    cd $HOME/projects/ansible
    source hacking/env-setup
    cd -
}

export GOPATH=$HOME/go
#export GOROOT=$HOME/go
#export GOPATH=/usr/lib64/go
#export GOROOT=/usr/lib64/go

torchmedown(){
. /home/sendai/projects/distro/install/bin/torch-activate
export  CUDA_BIN_PATH=/opt/cuda
}

export TERM=xterm

d_jweechat(){
    # sudo docker network create --subnet=10.0.43.1/24 redazul
    set -x
    sudo docker rm weechat
    sudo docker run \
                    --dns 208.67.220.220 \
                    --name weechat \
                    --hostname weechat \
                    --network redazul \
                    --rm \
                    -ti \
                    -v $HOME/weechat:/home/user/.weechat \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/weechat
    set +x
}
d_jbitlbee(){
    # -p 127.0.0.1:6667:6667 \
    # sudo docker network create --subnet=10.0.43.1/24 redazul
    set -x
    sudo docker rm bitlbee
    sudo docker run \
                    --cap-drop=ALL \
                    --dns 208.67.220.220 \
                    --name bitlbee --hostname bitlbee \
                    --network redazul \
                    --read-only \
                    --rm \
                    -ti \
                    -v $HOME/bitlbee:/var/lib/bitlbee \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/bitlbee
    set +x
}

d_dnscrypt(){
    #-p 127.0.0.1:53:5353/udp \
                    #--dns 208.67.220.220 \
    set -x
    sudo docker rm dnscrypt-proxy
    sudo docker run \
                    --cap-add=IPC_LOCK \
                    --cap-drop=ALL \
                    --name dnscrypt-proxy --hostname dnscrypt-proxy \
                    --network redverde \
                    --rm \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/dnscrypt-proxy 
    set +x
}

d_dnsmasq(){
    set -x
    echo 'nameserver 127.0.0.1' | sudo tee /etc/resolv.conf
    sudo docker rm dnsmasq
    sudo docker run \
                    -p 127.0.0.1:53:5353/udp \
                    --name dnsmasq --hostname dnsmasq \
                    --network redverde \
                    --rm \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/dnsmasq
    set +x
}

d_ddnsmasq(){
    # sudo iptables -t nat -I PREROUTING -p tcp --dport 53- -j REDIRECT --to-ports 5353
    # -e SERVER='--server=127.0.0.1#5354'
    set -x
                    #-ti \
    sudo docker rm dnsmasq
    sudo docker run \
                    -p 127.0.0.1:53:5353/udp \
                    --name dnsmasq --hostname dnsmasq \
                    --network redverde \
                    --rm \
                    -e SERVER='--server=8.8.8.8#53' \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/dnsmasq
    set +x
}
d_dnsmasqtor(){
    set -x
    sudo docker rm dnsmasq
    sudo docker run \
                    -ti \
                    --name dnsmasq \
                    -u root \
                    --network redvioleta \
                    --entrypoint=/bin/sh \
                    --rm \
                    -e SERVER='--server=8.8.8.8#53' \
                    -v /etc/localtime:/etc/localtime:ro \
                    kubler-spin/dnsmasq
    set +x
}

d_davmail(){
    set -x
    sudo docker rm davmail
    sudo docker run \
                    --name davmail --hostname davmail \
                    --network redvioleta \
                    --rm \
                    -v /etc/localtime:/etc/localtime:ro \
                    -v $HOME/davmail.properties:/opt/davmail/conf/davmail.properties:ro \
                    kubler-spin/davmail
    set +x
}

d_neomutt(){
    set -x
    sudo docker rm neomutt
    sudo docker run \
        --name neomutt \
        --hostname neomutt \
        --entrypoint=neomutt \
        --rm \
        -ti \
        -v /etc/localtime:/etc/localtime:ro \
        -v /home/sendai/.muttrc:/home/user/.muttrc \
        --net=redvioleta \
        kubler-spin/neomutt
    set +x
}

d_newsbeuter(){
    set -x
    sudo docker rm newsbeuter2
    sudo docker run \
                    --name newsbeuter2 --hostname newsbeuter2 \
                    --dns 208.67.220.220 \
                    --network redazul \
                    --rm \
                    -ti \
                    -v $HOME/newsbeuter:/home/user/.newsbeuter \
                    kubler-spin/newsbeuter-python3
                    #kubler-spin/newsbeuter
    set +x
}
d_torproxy(){
    # READONLY
    set -x
    sudo docker rm tor-proxy
    sudo docker run --name tor-proxy \
                    --net=redvioleta \
                    --rm \
                    -ti \
                    --entrypoint=/bin/sh \
                    -v /etc/localtime:/etc/localtime:ro kubler-spin/tor
    set +x
}
d_tor(){
    # READONLY
    set -x
    sudo docker rm tor
    sudo docker run --name tor --hostname tor \
                    -p 127.0.0.1:9050:9050 --rm -ti -v /etc/localtime:/etc/localtime:ro kubler-spin/tor
    set +x
}
d_kibana(){
    set -x
    sudo docker rm kibana
    #sudo docker run --name kibana --hostname kibana --add-host=elasticsearch:192.168.1.101 -p 127.0.0.1:5601:5601 --rm -ti --entrypoint=/bin/sh docker.elastic.co/kibana/kibana:5.4.2
    sudo docker run --name kibana --hostname kibana --net=host --rm -ti --entrypoint=/bin/sh kubler-spin/kibana
    set +x
}
d_flexget(){
    set -x
    sudo docker rm flexget
    sudo docker run --add-host=rtorrent:192.168.1.101 --rm -ti --name flexget --tmpfs /tmp --tmpfs /var/tmp -v /home/sendai/flexget/:/root/.config/flexget --net=host --read-only  -v /etc/localtime:/etc/localtime:ro kubler-spin/flexget:20170423
    set +x
}
d_rss(){
    set -x
    sudo docker rm rss-bridge
    # Detach due httpd doesn't handle resize of windows
    #sudo docker run --net=host --tmpfs /run --name rss-bridge  -d kubler-spin/rss-bridge
    #  sudo docker run --net=host --tmpfs /run --tmpfs /var/run --tmpfs /var/www/localhost/htdocs/rss-bridge/cache:uid=81 --tmpfs /tmp:mode=1777 --read-only --name rss-bridge  -d kubler-spin/rss-bridg
    sudo docker run --tmpfs /run --name rss-bridge --hostname rss-bridge -d -p 127.0.0.1:8080:80 kubler-spin/rss-bridge

    set +x
}
d_logstash(){
    set -x
    sudo docker rm logstash
    sudo docker run --net=host -v /home/sendai/logstash/:/data -v /home/sendai/logstash-logs:/opt/logstash/logs  --rm  --entrypoint=/opt/logstash/bin/logstash  kubler-spin/logstash -f /data/rss.conf -r -w 2
    set +x
}
d_elasticsearch(){
    set -x
    sudo docker rm elasticsearch
    sudo docker run -ti --rm --entrypoint=/etc/service/elasticsearch/run --net=host -v /home/sendai/elasticsearch/:/etc/elasticsearch -v /home/sendai/elasticsearch-data/:/var/lib/elasticsearch  -v /home/sendai/elasticsearch-log/:/var/log/elasticsearch kubler-spin/elasticsearch
    set +x
}
d_rtorrent(){
    set -x
    sudo docker rm rtorrent
    sudo docker run --name rtorrent --hostname rtorrent --net=host -v $HOME/anime:/opt --rm -ti kubler-spin/rtorrent-git:latest
    set +x
}
d_fluentd(){
    set -x
    sudo docker rm fluentd
    sudo docker run --net=host --name fluentd --hostname fluentd -v /etc/localtime:/etc/localtime:ro --rm -ti -v /home/sendai/fluentd/:/data  --entrypoint=/bin/sh kubler-spin/fluentd
    set +x
}
d_headphones(){
     set -x
     sudo docker rm headphones
     sudo docker run --name headphones --hostname headphones \
         -p 5000:5000 -p 8181:8181 \
         -v /etc/localtime:/etc/localtime:ro  \
         --rm -ti \
         -v /home/sendai/headphones:/home/user/data \
         -v /home/sendai/headphones-blackhole:/home/user/blackhole \
         kubler-spin/headphones 
     set +x
}
d_pychess(){
    set -x
    sudo docker rm pychess
    sudo docker run \
        --net=none \
        --rm \
        --name pychess \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $HOME/pychess/.local:/root/.local \
        -v $HOME/pychess/.cache:/root/.cache \
        -v $HOME/pychess/.config:/root/.config \
        -e "DISPLAY=unix${DISPLAY}" \
        kubler-spin/pychess
        #4e30c7aeb565
    set +x
}
d_cutechess(){
    set -x
    sudo docker rm cutechess
    sudo docker run \
        --net=none \
        --rm \
        --entrypoint=/opt/cutechess \
        -v $HOME/cutechess:/root/.config/cutechess \
        --name cutechess \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e "DISPLAY=unix${DISPLAY}"  \
        kubler-spin/cutechess
    set +x
}
d_firefox(){
    set -x
    sudo docker stop firefox
	if [[ 'foo' == 'bar' ]]; then
		docker run --detach \
				   --publish 30000:14500 \
				   --user "$(id -u):1000" \
				   --volume "${HOME}"/firefox-storage:/home/user:rw \
			       --env XPRA_EXTRA_ARGS="--tcp-auth= --tcp-encryption=" \
				   --env HOME=/home \
				   --env CUPS_SERVER="${docker_address}" \
				   --env SOCKS_SERVER="${docker_address}:5080" \
				   --env SOCKS_VERSION=5 \
				   "${dri_devices[@]}" \
				   --volume /etc/localtime:/etc/localtimeXX:ro \
				   --volume /etc/timezone:/etc/timezoneXX:ro \
					devurandom/firefox "$@"
	fi
    sudo docker run --net=host \
                    --rm \
                    --name firefox \
                    --entrypoint=firefox-bin \
                    --device /dev/snd \
                    --device /dev/dri \
                    --cpuset-cpus 0 \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v /etc/localtime:/etc/localtime:ro \
                    -e GDK_SCALE \
                    -e GDK_DPI_SCALE \
                    -e "DISPLAY=unix${DISPLAY}" \
                    kubler-spin/firefox-bin
    set +x
}
d_torfirefox(){
    set -x
    sudo docker stop firefox
	if [[ 'foo' == 'bar' ]]; then
		docker run --detach \
				   --publish 30000:14500 \
				   --user "$(id -u):1000" \
				   --volume "${HOME}"/firefox-storage:/home/user:rw \
			       --env XPRA_EXTRA_ARGS="--tcp-auth= --tcp-encryption=" \
				   --env HOME=/home \
				   --env CUPS_SERVER="${docker_address}" \
				   --env SOCKS_SERVER="${docker_address}:5080" \
				   --env SOCKS_VERSION=5 \
				   "${dri_devices[@]}" \
				   --volume /etc/localtime:/etc/localtimeXX:ro \
				   --volume /etc/timezone:/etc/timezoneXX:ro \
					devurandom/firefox "$@"
	fi
    sudo docker run --net=redvioleta \
                    --rm \
                    --name firefox \
                    --entrypoint=firefox-bin \
                    -v /tmp/.X11-unix:/tmp/.X11-unix -e "DISPLAY=unix${DISPLAY}" \
                    kubler-spin/ffmpeg
    set +x
}


# Put your fun stuff here.
export PATH=$PATH:~/.bin
