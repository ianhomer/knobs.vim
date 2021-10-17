#!/usr/bin/env bash

set -e
_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..

COMMAND=${VIM_COMMAND:-vim}

while getopts "c:i" o; do case "$o" in
  c) COMMAND=$OPTARG ;;
  i) INTERACTIVE=y ;;
esac done

echo "Running tests with : $COMMAND"

PLUGIN_DIR=~/.vim/vendor/plugins
BUILD_DIR=`realpath $_DIR/../build`
mkdir -p $BUILD_DIR

# use local plugin directory if it exists, otherwise assume it's relative to
# home.
if [[ ! -d $PLUGIN_DIR ]] ; then
  PLUGIN_DIR=$HOME/$PLUGIN_DIR
fi

if [[ "$COMMAND" == "vim" ]] ; then
  INIT_SCRIPT="test/init/test.vim"
else
  INIT_SCRIPT="test/init/test.lua"
fi
echo "... with init script : $INIT_SCRIPT"

export VIM_KNOBS_TEST=1

if [[ "$INTERACTIVE" == "y" ]] ; then
$COMMAND --clean -Nu <(cat << EOF
set rtp=.
set rtp+=\$VIMRUNTIME
filetype plugin indent on
execute "source $INIT_SCRIPT"
EOF
)
  exit
fi

#
# Run vim (or neovim) with the given configuration
# Note that we redirect output with redir since directing nvim output to
# /dev/null as per vader documentation leads to a core dump in Github actions.
# We also capture stderr into a file and cat that because without it
# we don't see the output when run locally.
#

set -e
$COMMAND -es --clean -Nu <(cat << EOF
filetype off
set rtp=.
set rtp+=$PLUGIN_DIR/vader.vim
filetype plugin indent on
execute "source $INIT_SCRIPT"
EOF
) -c 'Vader! test/*.vader'

# 2>$BUILD_DIR/vim-error.log
# result=$?
# [[ -f $BUILD_DIR/vim-out.log ]] && cat $BUILD_DIR/vim-out.log
# cat $BUILD_DIR/vim-error.log
# if [[ "$result" == "1" ]] ; then
#   exit 1
# fi
