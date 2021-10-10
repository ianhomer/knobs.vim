#!/usr/bin/env bash

#
# Start up vim or nvim in isolation of local install and with just enough
# to test this plugin
#

set -e
_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $_DIR/..

COMMAND=${VIM_COMMAND:-vim}
EXTRA=""

while getopts "c:k" o; do case "$o" in
  c) COMMAND=$OPTARG ;;
  k) EXTRA=" +redir>>/dev/stdout|Knobs +qa";;
esac done

if [[ "$COMMAND" == "vim" ]] ; then
  INIT_SCRIPT="test/init/start.vim"
else
  INIT_SCRIPT="test/init/start-nvim.vim"
  COMMAND="nvim --clean"
fi

BUILD_DIR=`realpath $_DIR/../build`
mkdir -p $BUILD_DIR

PLUGIN_DIR=~/.vim/vendor/plugins

echo "Start up $COMMAND with knobs.vim : $COMMAND"

$COMMAND -Nu <(cat << EOF
execute "source $INIT_SCRIPT"
EOF
)$EXTRA > $BUILD_DIR/start.log
