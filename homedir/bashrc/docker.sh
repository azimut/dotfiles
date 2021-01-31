#!/bin/bash

d_weechat(){
    # sudo docker network create --subnet=10.0.43.1/24 redazul
    set -x
    screen_name "weechat"
    sudo docker rm weechat
    sudo docker run \
         --name weechat \
         --hostname weechat \
         --device=/dev/input/mice \
         --net=host \
         --rm \
         -ti \
         -v $HOME/weechat:/home/user/.weechat \
         -v /etc/localtime:/etc/localtime:ro \
         -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro \
         kubler-spin/weechat
    set +x
}
d_bitlbee(){
    # -p 127.0.0.1:6667:6667 \
        # sudo docker network create --subnet=10.0.43.1/24 redazul
    set -x
    screen_name "bitlbee"
    sudo docker rm bitlbee
    sudo docker run \
         --cap-drop=ALL \
         --name bitlbee --hostname bitlbee \
         --network host \
         --read-only \
         --rm \
         -ti \
         -v $HOME/bitlbee:/var/lib/bitlbee \
         -v /etc/localtime:/etc/localtime:ro \
         -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro \
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
    screen_name "davmail"
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
    screen_name "neomutt"
    sudo docker rm neomutt
    sudo docker run \
         --name neomutt \
         --hostname neomutt \
         --entrypoint=neomutt \
         --rm \
         -ti \
         -v /etc/localtime:/etc/localtime:ro \
         -v $HOME/.muttrc:/home/user/.muttrc:ro \
         --net=redvioleta \
         kubler-spin/neomutt
    set +x
}

d_newsbeuter(){
    set -x
    screen_name "newsbeuter"
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
    screen_name flexget
    sudo docker rm flexget
    sudo rm -f flexget/.config-lock
    sudo docker run --add-host=rtorrent:192.168.1.101 --rm -ti --name flexget --tmpfs /tmp --tmpfs /var/tmp -v $HOME/flexget/:/root/.config/flexget --net=host --read-only  -v /etc/localtime:/etc/localtime:ro kubler-spin/flexget:20170423
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
    sudo docker run --net=host -v $HOME/logstash/:/data -v $HOME/logstash-logs:/opt/logstash/logs  --rm  --entrypoint=/opt/logstash/bin/logstash  kubler-spin/logstash -f /data/rss.conf -r -w 2
    set +x
}
d_elasticsearch(){
    set -x
    sudo docker rm elasticsearch
    sudo docker run -ti --rm --entrypoint=/etc/service/elasticsearch/run --net=host -v $HOME/elasticsearch/:/etc/elasticsearch -v $HOME/elasticsearch-data/:/var/lib/elasticsearch  -v $HOME/elasticsearch-log/:/var/log/elasticsearch kubler-tresdos/elasticsearch
    set +x
}
d_rtorrent(){
    set -x
    screen_name rtorrent
    sudo docker rm rtorrent
    sudo docker run --name rtorrent --hostname rtorrent --net=host -v $HOME/anime:/opt --rm -ti kubler-spin/rtorrent-git:latest
    set +x
}
d_fluentd(){
    set -x
    sudo docker rm fluentd
    sudo docker run --net=host --name fluentd --hostname fluentd -v /etc/localtime:/etc/localtime:ro --rm -ti -v $HOME/fluentd/:/data  --entrypoint=/bin/sh kubler-spin/fluentd
    set +x
}
d_headphones(){
    set -x
    sudo docker rm headphones
    sudo docker run --name headphones --hostname headphones \
         -p 5000:5000 -p 8181:8181 \
         -v /etc/localtime:/etc/localtime:ro  \
         --rm -ti \
         -v $HOME/headphones:/home/user/data \
         -v $HOME/headphones-blackhole:/home/user/blackhole \
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
         -v $HOME/pychess/.local:/home/user/.local \
         -v $HOME/pychess/.cache:/home/user/.cache \
         -v $HOME/pychess/.config:/home/user/.config \
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

d_postgres(){
    set -x
    sudo docker run --rm \
         -ti \
         -e POSTGRES_PASSWORD=secret \
         -e POSTGRES_USER=fluentd \
         -e POSTGRES_DB=rss \
         --entrypoint=/etc/service/postgres/run \
         --net=host \
         --name postgres \
         -v $HOME/postgres/:/var/lib/postgresql/data \
         -v /etc/localtime:/etc/localtime:ro \
         kubler-spin/postgres
    set +x
}

d_citus(){
    set -x
    sudo docker rm citusdb
    sudo docker run --rm \
         -ti \
         -e POSTGRES_PASSWORD=secret \
         -e POSTGRES_USER=fluentd \
         -e POSTGRES_DB=rss \
         --entrypoint=/etc/service/postgres/run \
         --net=host \
         --name citusdb \
         -v $HOME/postgres/:/var/lib/postgresql/data \
         -v /etc/localtime:/etc/localtime:ro \
         kubler-spin/citusdb
    set +x
}
d_flood(){
    set -x
    sudo docker stop flood
    sudo docker run --rm \
         --add-host=flood:192.168.1.101 \
         --add-host=rtorrent:192.168.1.101 \
         -p 3000:3000 \
         --net=host \
         --name flood --hostname flood \
         --read-only \
         --tmpfs=/opt/flood/server/temp \
         -v $HOME/flood/config.js:/opt/flood/config.js:ro \
         -v $HOME/flood/db:/opt/flood/server/db \
         -v /etc/localtime:/etc/localtime:ro \
         kubler-spin/flood
    set +x
}
d_dnscrypt2(){
    set -x
    screen_name "dnscrypt"
    sudo docker stop dnscrypt2
    sudo docker run --rm \
         --net=host \
         --name dnscrypt2 \
         -v /etc/localtime:/etc/localtime:ro \
         -u root \
         -ti \
         kubler-spin/dnscrypt-proxy2:latest -config /opt/dnscrypt-proxy2/proxy53.toml
    set +x
}
d_gci(){
    set -x
    sudo docker images | grep none | awk '{print $3;}' | xargs -r sudo docker rmi
    set +x
}
d_gc(){
    set -x
    sudo docker ps -a | grep -v -e Up -e portage | tail -n+2 | cut -f1 -d' ' | xargs -r sudo docker rm 
    set +x
}

# NON KUBLER

d_wireshark(){
    set -x
    sudo docker rm wireshark
    sudo docker run --net=none \
         --rm -ti --name wireshark \
         -v /tmp/.X11-unix:/tmp/.X11-unix\
         -v /etc/localtime:/etc/localtime:ro \
         -e GDK_SCALE -e GDK_DPI_SCALE \
         -e DISPLAY=unix:0 \
         jess/wireshark
    set +x
}

d_plex(){
    set -x
    [[ -z $X_PLEX_TOKEN ]] && return 1
    screen_name "plex"
    sudo docker run -e X_PLEX_TOKEN=${X_PLEX_TOKEN} \
         -v /etc/localtime:/etc/localtime:ro \
         -v $HOME/disks/:/opt \
         -d \
         --net=host --name plex \
         kubler-spin/plex-media-server
    set +x
}
d_redis(){
    set -x
    mkdir -p $HOME/redis
    chmod 777 $HOME/redis
    screen_name "redis"
    sudo docker rm redis
    sudo docker run \
         --name redis \
         --net=host \
         -v /etc/localtime:/etc/localtime:ro \
         -v $HOME/redis:/var/lib/redis \
         kubler-spin/redis
    set +x
}
d_znc(){
    set -x
    screen_name "znc"
    sudo chown -R 101:247 $HOME/znc
    sudo docker rm znc
    sudo docker run \
         --name znc \
         --net=host \
         -v /etc/localtime:/etc/localtime:ro \
         -v $HOME/znc/users:/var/lib/znc/.znc/users \
         -v $HOME/znc/configs:/var/lib/znc/.znc/configs \
         kubler-spin/znc
    set +x
}
d_minidlna(){
    set -x
    mkdir -p $HOME/minidlna
    chmod 777 $HOME/minidlna

    screen_name "minidlna"
    sudo docker run --net=host \
         -v $HOME/minidlna:/var/lib/minidlna \
         -v $HOME/disks/edisk-phil/funandmedia/human/movies/:/opt:ro \
         --rm \
         --name minidlna \
         kubler-spin/minidlna
    set +x
}
d_server(){
    sudo systemctl start docker
    # d_rtorrent
    # d_flexget
    # d_postgres
    # d_bitlbee
    # d_znc
    # d_weechat
}
