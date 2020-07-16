#!/bin/bash
echo 'hello you too!'
echo hostname:$(hostname -f)
source ~/.bashrc &&\
echo ${BASH_ALIASES[sequence]} &&\
tmux new-session -d -s jupyterlabSession 'jupyter-lab --ip=$(hostname -f) --no-browser --port=8999' &&\
sleep 3d
