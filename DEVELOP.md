# Development

## Local test

Run unit tests

    make test

Spin up plugin in local install of vim with configuration isolated from your
local environment

    make start

Spin up in nvim

    make start-nvim

And see compiled packer script at
`~/.config/nvim-test/knobs-start/plugin/packer_compiled.lua` and packer log at
`~/.cache/nvim/packer.nvim.log`

Spin up local container to test in isolation

    make container
