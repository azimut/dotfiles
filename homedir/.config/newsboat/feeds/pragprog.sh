#!/bin/bash
set -exuo pipefail

TITLE='PragProg Releases'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ID='pragprog:newreleases'
URL=https://pragprog.com/titles/

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

torsocks curl "${URL}" \
    | pup 'div.cms-main div.category-title-container a json{}' \
    | jq -r '.[] as $a | "
<entry>
  <title>\($a.children[2].children[0].children[0].text)</title>
  <link href=\"\($a.href)\">\($a.href)</link>
  <published>'${DATE}'</published>
  <id>\($a.href)</id>
  <author><name>\($a.children[2].children[4].text)</name></author>
  <content>\($a.children[2].children[2].text)</content>
</entry>"' | sed 's;<link href="/;<link href="https://pragprog.com/;'

 echo
 echo "</feed>"
