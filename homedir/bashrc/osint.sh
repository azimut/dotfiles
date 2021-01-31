#!/bin/bash

topcompanies(){
    cat TOPSUBDOMAINTAKEOVER.md \
        | grep -E '\$[1-9][0-9][0-9]+' \
        | grep -E -o ') to [[:alnum:]]+ ' \
        | cut -f3 -d' ' \
        | sort | uniq -c | sort -n
}
revdomain() {
    while read -r domain; do
        echo $(echo $domain | tr '.' $'\n' | tac | paste -sd'.')
    done < /dev/stdin
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

toptr(){
    cat /dev/stdin | revdomain | sed 's/$/.in-addr.arpa./g'
}
