#!/bin/bash

set -exuo pipefail

tp="tmp.pdf"
td="data"

if [[ $# -eq 0 ]]; then
	files=(*.pdf)
else
	files=("${@}")
fi

for i in "${files[@]}"; do
	echo "Bookmarking $i"
	printf "BookmarkBegin\nBookmarkTitle: %s\nBookmarkLevel: 1\nBookmarkPageNumber: 1\n" "${i%.*}" >"$td"
	pdftk "$i" update_info "$td" output "$tp"
	mv "$tp" "$i"
done

pdftk "${files[@]}" cat output myBook.pdf
