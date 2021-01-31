#!/bin/bash
addconda3(){
    unset PYTHONPATH
    export PATH=$HOME/miniconda3/bin:$PATH
    source activate $HOME/miniconda3/
}

addconda22(){
    unset PYTHONPATH
    export PATH=$HOME/miniconda22/bin:$PATH
    source activate $HOME/miniconda22/
}
addconda(){
    export PATH=$HOME/miniconda2/bin:$PATH
    source activate $HOME/miniconda2/
}
addconda27(){
    export PATH=$HOME/miniconda27/bin:$PATH
    source activate $HOME/miniconda27/
}
ansible_env(){
    addconda
    source activate $HOME/miniconda
    cd $HOME/projects/ansible
    source hacking/env-setup
    cd -
}

torchmedown(){
    . $HOME/projects/distro/install/bin/torch-activate
    export  CUDA_BIN_PATH=/opt/cuda
}
