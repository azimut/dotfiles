#!/bin/bash

set -euo pipefail

find . -type f -not -name '#*' -printf "%T@ %Tc %p\n" |
	grep -Fv '/.git' |
	sort -n
