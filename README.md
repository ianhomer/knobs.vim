# knobs.vim

Feature flags and conditional configurations. Vim with knobs.

Why?

- Different configuration for different environments.
- Toggle on and off experimental plugins.
- Spin up different configuration levels, light vs full.

## Installation

    mkdir -p ~/.vim/pack/ianhomer/start
    cd ~/.vim/pack/ianhomer/start
    git clone https://github.com/ianhomer/knobs.vim

## Usage

Start Vim at a higher configuration level

    VIM_KNOBS=5 vim
