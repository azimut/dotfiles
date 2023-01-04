#!/bin/bash

set -exuo pipefail

fetch() {
	chromium-browser \
		--incognito \
		--headless \
		--disable-gpu \
		--print-to-pdf="${2}" \
		"${1}"
}

[[ -s ${1} ]] || exit 1

while read -r url; do
	path="$(echo "${url}" | sed -rn 's#http[s]?://[a-zA-Z0-9.-]+/(.*)#\1#p')"
	path="${path%/}"
	name="$(echo "${path}" | tr '/' '-' | tr -dc 'a-zA-Z0-9-_')"
	name=${name:-root}
	fetch "${url}" "${name}.pdf"
done <"${1}"
