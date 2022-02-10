#!/bin/bash
set -exuo pipefail

TITLE='Manning New Releases'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL=https://www.manning.com/
ID='manning:newreleases'

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

w3m -dump_source "${URL}" \
    | gunzip - \
    | pup 'div.recently-published-box a[data-edition=""]' \
    | pup 'a[href^="/books/"] json{}' \
    | jq -r '.[] as $a | "
<entry>
  <title>\($a["data-name"])</title>
  <author><name>\($a["data-category"])</name></author>
  <link href=\"\($a.href)\">\($a.href)</link>
  <id>\($a.href)</id>
  <published>'${DATE}'</published>
</entry>"' | sed 's;<link href="/;<link href="https://www.manning.com/;'

echo
echo "</feed>"
