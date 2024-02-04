#!/bin/bash

set -exuo pipefail

# https://github.com/GoogleChrome/chrome-launcher/blob/main/docs/chrome-flags-for-tools.md
fetch() {
	chromium-browser \
		--incognito \
		--headless \
		--disable-gpu \
		--print-to-pdf-no-header \
		--print-to-pdf="${2}" \
		"${1}"
}

[[ $# -ne 1 ]] && {
	echo "ERROR: missing directory argument"
	exit 1
}

[[ ! -d ${1} ]] && {
	echo "ERROR: src does not exists"
	exit 1
}

SRC="$(realpath "${1}")"

# Create DST directories
find "${SRC}" -mindepth 1 -type d |
	while read -r dir; do
		mkdir -vp ".${dir#${SRC}}"
	done

# Render .html into pdf
find "${SRC}" -name '*.html' |
	while read -r srcfile; do
		dstfile=".${srcfile#"${SRC}"}"
		fullpath="file://$(realpath "${srcfile}")"
		fetch "${fullpath}" tmp.pdf
		pdfcrop --margins '-5 -5 -5 -5' tmp.pdf "${dstfile%.html}.pdf"
		rm -f tmp.pdf
	done
