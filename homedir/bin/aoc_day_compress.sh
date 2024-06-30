#!/bin/bash

set -euo pipefail

fuzzing=${1:10}

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
echo -n "mogrifying..."
mogrify -fuzz ${fuzzing}% -trim +repage -format png ./*.png
echo -en "\nmaxing size"
for i in ./*.png; do
	[[ ! -f ${i} ]] && break
	printf '.'
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
