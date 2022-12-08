#!/bin/bash

set -euo pipefail

get_orientation() {
	local width height
	read -r width height < <(identify -format "%w %h" "${1}")
	if [[ ${width} -gt ${height} ]]; then
		echo 'horizontal'
	else
		echo 'vertical'
	fi
}

before="$(du -sh)"
echo "mogrifying..."
mogrify -fuzz 25% -trim +repage -format png ./*.png
for i in ./*.png; do
	[[ ! -f ${i} ]] && break
	echo "maxing size of ${i}"
	if [[ $(get_orientation "${i}") == 'horizontal' ]]; then
		convert "${i}" -resize 1920x1080\> "${i/png/jpg}"
	else
		convert "${i}" -resize 1080x1920\> "${i/png/jpg}"
	fi
	rm -f "${i}"
done
after="$(du -sh)"

printf "\n\nBefore:\t%s\nAfter:\t%s\n" "${before}" "${after}"
echo "Done!"
