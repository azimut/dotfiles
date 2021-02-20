#!/bin/bash
set -exuo pipefail

TITLE='Manning New Releases'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL=https://www.manning.com/catalog/sort/sort-by-date
ID='manning:newreleases'

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

curl -A Mozilla "${URL}" \
    | pup 'div[data-section-title="2015 - present"] div.item-list a json{}' \
    | jq -r '.[] as $li | "
<entry>
  <title>\($li["data-name"])</title>
  <author><name>\($li.children[1].children[0].children[1].text)</name></author>
  <link href=\"\($li.href)\">\($li.href)</link>
  <id>\($li.href)</id>
  <published>\($li.children[1].children[1].text | strptime("%B %Y") | todate)</published>
</entry>"' | sed 's;<link href="/;<link href="https://www.manning.com/;'

echo
echo "</feed>"
