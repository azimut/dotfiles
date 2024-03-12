#!/bin/bash

set -exuo pipefail

# https://github.com/GoogleChrome/chrome-launcher/blob/main/docs/chrome-flags-for-tools.md
getpdf() {
	chromium-browser \
		--incognito \
		--headless \
		--disable-gpu \
		--print-to-pdf-no-header \
		--print-to-pdf="${2}" \
		"${1}"
}

[[ $# -ne 1 ]] && {
	echo "ERROR: missing URL argument"
	exit 1
}

url="${1}"
path="$(echo "${url}" | sed -rn 's#http[s]?://[^/]+/(.*)#\1#Ip')" # remove proto/domain
path="${path%/}"                                                  # remove trailing slash
path="${path%.*}"                                                 # remove extension
name="$(echo "${path}" | tr '/' '-' | tr -dc 'a-zA-Z0-9-_')"
name=${name:-root}

getpdf "${url}" "${name}.withmargins.pdf"
pdfcrop --margins '-5 -5 -5 -5' "${name}.withmargins.pdf" "${name}.pdf"
rm -f "${name}.withmargins.pdf"
