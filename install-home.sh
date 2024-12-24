#!/bin/bash
cd homedir/ && {
    find . -type f -print0 |
        while IFS= read -rd '' file; do
            mkdir -p "${HOME}/${file%/*}"
            ln -sf "${PWD}/${file#./}" "${HOME}/${file#./}"
        done
}
