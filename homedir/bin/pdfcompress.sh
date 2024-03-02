#!/bin/bash

set -euo pipefail

err() { echo "ERROR: $1" >&2; }
usage() {
	echo "Reduces size of input pdf file. Not optimizing."
	echo "Usage:"
	echo -e "\t$ $(basename $0) <PDF_FILE> [screen|ebook|prepress|printer|default]"
}

(($# == 0)) && usage && exit
[[ ! -s $1 ]] && err "file does not exists" && usage && exit

filename="$1"

case "${2:-screen}" in
screen) setting="screen" ;;
ebook) setting="ebook" ;;
prepress) setting="prepress" ;;
printer) setting="printer" ;;
default) setting="default" ;;
*) err "invalid pdfsetting" && usage && exit 1 ;;
esac

echo -n "Converting \`${filename}\`..."
gs -sDEVICE=pdfwrite \
	-dPDFSETTINGS=/"${setting}" \
	-dCompatibilityLevel=1.4 \
	-sOutputFile=out.pdf \
	-dNOPAUSE -dQUIET -dBATCH \
	"${filename}"

old_size="$(($(stat -c '%s' "${filename}") / 1024 / 1024))"
new_size="$(($(stat -c '%s' out.pdf) / 1024 / 1024))"

mv out.pdf "${filename}"

echo
echo "Old size: ${old_size}"
echo "New size: ${new_size}"
