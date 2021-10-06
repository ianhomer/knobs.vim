# knobs.vim

Feature flags and conditional configurations. Vim with knobs.

Why?

- Different configuration for different environments.
- Toggle on and off experimental plugins.
- Spin up different configuration levels, light vs full.

## vim

### Installation

    mkdir -p ~/.vim/pack/ianhomer/start
    cd ~/.vim/pack/ianhomer/start
    git clone https://github.com/ianhomer/knobs.vim

### Usage

Set up feature flags in your .vimrc

```vim
" Levels at which features are enabled
let g:knobs_levels = {
  \   "fugitive":3,
  \   "eunuch":5
}

call plug#begin('~/.vim/plugged')

if knobs#("fugitive")
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
endif
IfKnob 'eunuch' Plug 'tpope/vim-eunuch'

call plug#end()
```

Start Vim at different configuration levels. For, with the `.vimrc` example
above,

    VIM_KNOBS=5 vim

would load `vim-eunuch` plugin, however (with knob level of 3 as default),

    vim

would only load `vim-fugitive` and `vim-rhubarb`.
