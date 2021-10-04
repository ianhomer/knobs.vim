#!/usr/bin/env bash

set -e

COMMAND=${VIM_COMMAND:-nvim}

while getopts "c:" o; do case "$o" in
  c) COMMAND=$OPTARG ;;
esac done

echo "Start up vim with knobs.vim : $COMMAND"

#
# Start up vim with just this plugin

$COMMAND -Nu <(cat << EOF
filetype off
set rtp+=.
filetype plugin indent on
EOF)
