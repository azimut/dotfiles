#!/bin/bash

TITLE='Discord Job Posts'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL='https://discord.com/channels/@me'
ID='discord:jobs'

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"${URL}\"></link>
  <updated>${DATE}</updated>"

psql -X --csv -U postgres -d irclogs -f sql-to-rss.sql \
    | csvjson \
    | jq -r '.[] as $li | "
<entry>
  <title>\($li.msg | gsub("<br/>";"";"g") | .[0:80])</title>
  <id>\($li.dt)</id>
  <published>\($li.dt)</published>
  <link href=\"'${URL}'\">'${URL}'</link>
  <author><name>\($li.win)</name></author>
  <content>\($li.msg)</content>
</entry>"'

echo
echo "</feed>"
