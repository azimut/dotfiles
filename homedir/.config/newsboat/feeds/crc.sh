#!/bin/bash
set -exuo pipefail

CATEGORY="$1"

TITLE="CRC Press - ${CATEGORY} - New Releases"
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL="https://www.routledge.com/search?sb=${CATEGORY}"
ID="manning:${CATEGORY,,}:newreleases"

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

curl "${URL}" \
    | pup 'div#booksGrid div.text-center json{}' \
    | jq -r '.[] as $div | "
<entry>
  <title>\($div.children[0].children[0].children[0].text)</title>
  <author><name>\($div.children[1].children[0].text)</name></author>
  <link href=\"\($div.children[0].children[0].href)\">\($div.children[0].children[0].href)</link>
  <id>\($div.children[0].children[0].href)</id>
  <published>\($div.children[2].text | sub("nd,";"") | sub("th,";"") | strptime("%b. %d %Y") | todate)</published>
</entry>"' | sed 's;<link href="/;<link href="https://www.routledge.com/;'

echo
echo "</feed>"
