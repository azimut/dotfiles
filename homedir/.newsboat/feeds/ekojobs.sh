#!/bin/bash

set -exuo pipefail

DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
URL=https://ekoparty.org/en_US/jobs

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ekoparty jobs </title>
  <id> ekoparty:jobs </id>
  <updated>${DATE}</updated>"

torsocks curl ${URL} \
    | pup 'div#jobs_grid ul li.mt-3 div json{}' \
    | jq -r '.[] as $li | "
<entry>
  <title>\($li.children[0].children[0].children[0].text)</title>
  <id>\($li.children[0].children[0].href)</id>
  <published>\($li.children[-1].children[1].text | strptime("%m/%d/%Y %H:%M:%S") | todate )</published>
  <link href=\"\($li.children[0].children[0].href)\">\($li.children[0].children[0].href)</link>
  <author><name> UESTC </name></author>
</entry>"' | sed 's;<link href="/;<link href="https://ekoparty.org/;'

echo
echo "</feed>"
