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

info() {
	notify-send -t "$((5 * 1000))" -- \
		"$0" \
		"<span color='#57dafd' font='20px'>${1}</span>"
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

# Counters
total="$(find "${SRC}" -name '*.html' | wc -l)"
i=0

# Render .html into pdf
find "${SRC}" -name '*.html' |
	while read -r srcfile; do
		dstfile=".${srcfile#"${SRC}"}"
		dstfile="${dstfile%.html}.pdf"
		fullpath="file://$(realpath "${srcfile}")"

		((++i))
		info "${i} of ${total}"
		[[ -f ${dstfile} ]] && {
			continue
		}

		fetch "${fullpath}" tmp.pdf
		pdfcrop --margins '-5 -5 -5 -5' tmp.pdf "${dstfile}"
		rm -f tmp.pdf
	done
