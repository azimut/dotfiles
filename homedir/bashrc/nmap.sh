#!/bin/bash

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


hint_nmap(){
    echo "Remeber flags:
  -sV -sU
  -D
  --ttl
  -f
  --data-length
  -sO
  -g"
}
nmap_up(){
    local host="$1"
    local SCRIPTS=(
        asn-query
        address-info
        fcrdns
        traceroute-geolocation
        resolveall
        whois-domain
        whois-ip
    )
    sudo nmap -n -sn \
         -PS 80 \
         --script-args="http.useragent='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0'" \
         --traceroute \
         --script $(printf '%s,' ${SCRIPTS[@]}) \
         --reason -v $host
}
nmap_port(){
    local host="$1"
    local port="$2"
    [[ $# -ne 2 ]] && { echo "nmap_port <HOST> <PORT>"; return 1; }
    nmap -sT \
         --reason --packet-trace \
         -n -Pn --max-retries=0 \
         -p $port \
         $host
}
nmap_ports(){
    local host="$@"
    sudo nmap -sT \
         --traceroute \
         --reason -v -d --open \
         -n -Pn --max-retries=0 \
         -F \
         "${host}"
}
nmap_uport(){
    local host="$1"
    local port="$2"
    sudo nmap -sUV \
         --packet-trace \ \
         -p "${port}" \
         --max-retries=0 \
         --reason -v \
         -n -Pn \
         "${host}"
}
nmap_uports(){
    local host="$@"
    sudo nmap -sUV \
         -F \
         --max-retries=0 \
         --reason -v \
         -n -Pn \
         "${host}"
}
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
