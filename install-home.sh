#!/bin/bash
cd homedir/ && {
   for f in $(find -type f); do
     mkdir -p ${HOME}/${f%/*}
     ln -sf ${PWD}/${f} ${HOME}/${f}
   done
}
