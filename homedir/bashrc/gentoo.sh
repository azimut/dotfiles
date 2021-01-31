#!/bin/bash

# Add Gentoo overlay to repos.conf/ and sync it
# Example usage: add_overlay musl https://anongit.gentoo.org/git/proj/musl.git
#
# Arguments:
#
# 1: repo_id - reference used in repos.conf
# 2: repo_url
# 3: repo_mode - optional, default: git
# 4: repo_priority - optional, default: 50
add_overlay() {
    local repo_id repo_url repo_mode repo_priority repo_path
    repo_id="$1"
    repo_url="$2"
    repo_mode="${3:-git}"
    repo_priority="${4:-50}"
    repo_path='/var/lib/repos'
    [ ! -d "${repo_path}" ] && sudo mkdir -p "${repo_path}"
    sudo tee /etc/portage/repos.conf/"${repo_id}".conf >/dev/null <<END
[${repo_id}]
priority = ${repo_priority}
location = ${repo_path}/${repo_id}
sync-type = ${repo_mode}
sync-uri = ${repo_url}
END
    sudo emaint sync -r "${repo_id}"
}


# Thin wrapper for app-portage/flaggie, a tool for managing portage keywords and use flags
#
# Examples:
#
# global use flags: update_use -readline +ncurses
# per package: update_use app-shells/bash +readline -ncurses
# same syntax for keywords: update_use app-shells/bash +~amd64
# target package versions as usual, remember to use quotes for < or >: update_use '>=app-text/docbook-sgml-utils-0.6.14-r1' +jadetex
# reset use/keyword to default: update_use app-shells/bash %readline %ncurses %~amd64
# reset all use flags: update_use app-shells/bash %
function update_use() {
    # shellcheck disable=SC2068
    sudo flaggie --strict --destructive-cleanup ${@}
}

