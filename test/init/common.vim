" 
" Vim configuration for container test
"

let g:knobs_levels = {
  \   "fugitive":3,
  \   "eunuch":5
  \ }

call plug#begin('~/.vim/vendor/knobs.vim/plugged')

if knobs#("fugitive")
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
endif
IfKnob 'eunuch' Plug 'tpope/vim-eunuch'

call plug#end()
