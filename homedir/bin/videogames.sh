#!/bin/bash

mpv --script=${HOME}/.config/mpv/autoload.lua \
    --mute=yes \
    --loop-playlist \
    --shuffle .
