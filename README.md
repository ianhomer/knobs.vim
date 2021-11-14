# knobs.vim

Feature flags and conditional configurations. Vim with knobs.

Why?

- Different configurations for different environments.
- Toggle on and off experimental plugins.
- Spin up different configuration levels, light vs full.

## nvim with packer

```lua
vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

require("packer").startup {
    function(_use)
        local ok, knobs = pcall(require, "knobs")
        use = ok and knobs.use(_use) or _use

        use "wbthomason/packer.nvim"
        use "ianhomer/knobs.vim"
        use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
        use "tpope/vim-eunuch"
        use "tpope/vim-dispatch"
    end
}
```

## vim with plug

### Installation

    mkdir -p ~/.vim/pack/ianhomer/start
    cd ~/.vim/pack/ianhomer/start
    git clone https://github.com/ianhomer/knobs.vim

### Usage

Set up feature flags in your `.vimrc`

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

Start Vim at different configuration levels. For example, with the `.vimrc`
above,

    VIM_KNOBS=5 vim

would load `vim-fugitive`, `vim-rhubarb` and `vim-eunuch` plugins. With the
default knob level of 3,

    vim

would only load `vim-fugitive` and `vim-rhubarb`.

```vim
if !exists("g:knob_fugitive")
   " Do something if knob is set
endif
```

