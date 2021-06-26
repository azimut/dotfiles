#!/bin/bash
set -exuo pipefail

TITLE='Apress New Releases'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL='https://www.apress.com/la/product-search?dnc=true&facet-pdate=pdate__onemonth&query='
ID='apress:newreleases'

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

torsocks curl "${URL}" \
    | pup 'div#result-list div.result-item json{}' \
    | jq -r '.[] as $li | "
<entry>
  <title>\($li.children[2].children[0].text)</title>
  <id>\($li.children[0].href)</id>
  <published>'${DATE}'</published>
  <link href=\"\($li.children[0].href)\">\($li.children[0].href)</link>
  <author><name>\($li.children[3].text | gsub("\\s+";" ";"g"))</name></author>
</entry>"' | sed 's;<link href="/;<link href="https://www.apress.com/;'

    echo
    echo "</feed>"
