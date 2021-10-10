let s:path = resolve(expand('<sfile>:p:h'))

filetype off
set rtp=~/.vim/vendor/plugins/vim-plug
set rtp+=/usr/local/share/vim/vimfiles
set rtp+=/usr/local/share/vim/vim82
set rtp+=.
execute "source ".s:path."/common.vim"
filetype plugin indent on
