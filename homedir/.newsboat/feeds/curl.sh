#!/bin/bash

curl -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0' \
	-L -q -o - "$1"
