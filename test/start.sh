#!/usr/bin/env bash

set -e
_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..

COMMAND=${VIM_COMMAND:-vim}

while getopts "c:" o; do case "$o" in
  c) COMMAND=$OPTARG ;;
esac done

if [[ "$COMMAND" == "vim" ]] ; then
  INIT_SCRIPT="test/init/common.vim"
else
  INIT_SCRIPT="test/init/init.lua"
fi

echo "Start up $COMMAND with knobs.vim : $COMMAND"

#
# Start up vim with just this plugin

$COMMAND -Nu <(cat << EOF
filetype off
set rtp+=.
execute "source $INIT_SCRIPT"
filetype plugin indent on
EOF
)
