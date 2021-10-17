set rtp=.
set rtp+=$VIMRUNTIME
set packpath+=~/.local/share/nvim-test/knobs-test/site
let $VIM_KNOBS_TEST=1
packadd plenary.nvim

source test/init/test.vim
