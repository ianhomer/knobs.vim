#!/usr/bin/env bash

set -e
_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..

COMMAND=${VIM_COMMAND:-vim}

while getopts "c:" o; do case "$o" in
  c) COMMAND=$OPTARG ;;
esac done

echo "Start up vim with knobs.vim : $COMMAND"

#
# Start up vim with just this plugin

$COMMAND -Nu <(cat << EOF
filetype off
set rtp=.
execute "source test/.vimrc"
filetype plugin indent on
EOF
)
