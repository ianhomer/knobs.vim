let s:path = resolve(expand('<sfile>:p:h'))

let g:knobs_test_config_dir = "~/.config/nvim-test"
let g:knobs_test_data_dir = "~/.local/share/nvim-test"

filetype off
set rtp+=.
set rtp+=~/.local/share/nvim-test/site/pack/*/start/*
set packpath+=~/.local/share/nvim-test/site
execute "source ".s:path."/init.lua"
execute "source ".g:knobs_test_config_dir."/plugin/packer_compiled.lua"
filetype plugin indent on
