let s:path = resolve(expand('<sfile>:p:h'))

let g:knobs_test_config_root = "~/.local/share/nvim-test"

filetype off
set rtp+=.
set rtp+=~/.local/share/nvim-test/site/pack/*/start/*
execute "source ".s:path."/init.lua"
filetype plugin indent on
