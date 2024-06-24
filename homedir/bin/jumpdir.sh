#!/bin/sh

{
	find ~/Downloads -mindepth 1 -maxdepth 1 -type d
	find ~/projects -mindepth 1 -maxdepth 2 -type d
} | fzf
