#!/bin/bash

# Description:
# sync symlinks when images are moved between local and external storage

set -euo pipefail

STORAGE=${HOME}/disk2/insta

if [[ ! -d ${STORAGE} ]]; then
	echo "error: external storage is NOT mounted"
	exit 1
fi

for link in "${HOME}"/.coomer/*; do
	[[ ! -L $link ]] && continue
	fullpath=$(readlink ${link})
	IFS='/' read -ra components <<<"${fullpath}"
	username="${components[$((${#components[@]} - 2))]}"
	img="${components[$((${#components[@]} - 1))]}"
	if [[ ! -f $fullpath && $fullpath == *$HOME* ]]; then
		altpath=${STORAGE}/${username}/${img}
		if [[ -f ${altpath} ]]; then
			ln -sf ${altpath} ${link}
		fi
	fi
	echo -n "."
done

printf "\nDone!\n"
