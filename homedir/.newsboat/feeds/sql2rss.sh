#!/bin/bash

set -euo pipefail

TITLE='New Discord Jobs'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL='https://discord.com/channels/@me'
ID='discord:job'

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

psql -X --csv -U postgres -d irclogs -f "$(dirname "${BASH_SOURCE[0]}")"/sql2rss.sql \
    | csvjson \
    | jq -r '.[] as $li | "
<entry>
  <title>\($li.msg | gsub("<br/>";"";"g") | .[0:80])</title>
  <id>\($li.msg | .[0:30] )</id>
  <published>\($li.dt)</published>
  <link href=\"'${URL}'\">'${URL}'</link>
  <author><name>\($li.win)</name></author>
  <content>\($li.msg)</content>
</entry>"'

echo
echo "</feed>"
