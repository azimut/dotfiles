#!/bin/bash

set -exuo pipefail

tp="tmp.pdf"
td="data"

for i in *.pdf; do
	echo "Bookmarking $i"
	printf "BookmarkBegin\nBookmarkTitle: %s\nBookmarkLevel: 1\nBookmarkPageNumber: 1\n" "${i%.*}" >"$td"
	pdftk "$i" update_info "$td" output "$tp"
	mv "$tp" "$i"
done

pdftk ./*.pdf cat output myBook.pdf
