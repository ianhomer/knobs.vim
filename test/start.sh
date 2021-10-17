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
  FULL_COMMAND="$COMMAND"
else
  INIT_SCRIPT="test/init/start-nvim.vim"
  FULL_COMMAND="nvim --clean"
fi

BUILD_DIR=`realpath $_DIR/../build`
mkdir -p $BUILD_DIR

echo "Start up $COMMAND with knobs.vim : $COMMAND"

$FULL_COMMAND --startuptime "build/$COMMAND-startup.log" -Nu <(cat << EOF
execute "source $INIT_SCRIPT"
EOF
)
