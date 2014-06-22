#!/bin/bash
cd homedir/ && {
   for f in $(find -type f); do
     echo mkdir -p ${HOME}/${f%/*}
     echo ln -sf ${PWD}/${f} ${HOME}/${f}
   done
}
