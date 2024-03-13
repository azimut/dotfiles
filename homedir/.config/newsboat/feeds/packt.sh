#!/bin/bash
set -exuo pipefail

TITLE='Packt Releases'
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ID='packt:newreleases'

packtjson(){
    curl 'https://vivzzxfqg1-dsn.algolia.net/1/indexes/*/queries?x-algolia-agent=Algolia%20for%20vanilla%20JavaScript%20(lite)%203.27.0%3Binstantsearch.js%202.7.4%3BJS%20Helper%202.26.0&x-algolia-application-id=VIVZZXFQG1&x-algolia-api-key=945b46c99f0be80981c40d1fb3c7db74' \
         -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0' \
         -H 'Accept: application/json' \
         -H 'Accept-Language: en-US,en;q=0.5' \
         --compressed \
         -H 'content-type: application/x-www-form-urlencoded' \
         -H 'Origin: https://subscription.packtpub.com' \
         -H 'Connection: keep-alive' \
         -H 'Referer: https://subscription.packtpub.com/search' \
         --data-raw '{"requests":[{"indexName":"subs_search_prod_date_order","params":"query=&hitsPerPage=24&maxValuesPerFacet=100&page=0&attributesToHighlight=%5B%22*%22%5D&filters=product_type%3A%22Video%22%20OR%20product_type%3A%22Book%22%20OR%20product_type%3A%22Project%22%20OR%20product_type%3A%22Learning%20Path%22&ruleContexts=%5B%22subscriptions%22%5D&facets=%5B%22product_type%22%2C%22category%22%2C%22imprint%22%2C%22published_year%22%2C%22concept%22%2C%22primary_tool%22%2C%22primary_language%22%5D&tagFilters="}]}'
}

echo "<?xml version='1.0' encoding='utf-8'?>
<feed xmlns='http://www.w3.org/2005/Atom'>
  <title> ${TITLE} </title>
  <id> ${ID} </id>
  <link href=\"https://subscription.packtpub.com/search?products=Book\"></link>
  <updated>${DATE}</updated>"

packtjson \
    | jq -r '.results[0].hits[] as $e | "
<entry>
  <title>\($e["product_type"]): \($e.title)</title>
  <link href=\"\($e["maptSeoUrl"])\">\($e["maptSeoUrl"])</link>
  <published>\($e["published_on"] | strptime("%Y-%m-%d") | todate)</published>
  <id>\($e["maptSeoUrl"])</id>
  <author><name>\($e.author[0])</name></author>
  <content>\($e.description)</content>
</entry>"' | sed 's;<link href="/;<link href="https://subscription.packtpub.com/;'

echo
echo "</feed>"
