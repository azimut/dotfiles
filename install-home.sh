#!/bin/bash
cd homedir/ && {
    find . -type f -print0 |
        while IFS= read -r -d '' f; do
            mkdir -p "${HOME}/${f%/*}"
            ln -sf "${PWD}/${f}" "${HOME}/${f}"
        done
}
