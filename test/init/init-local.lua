vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

vim.api.nvim_set_var(
    "knobs_layers",
    {
      foo = vim.env.VIM_KNOBS_FOO == "1" and 1 or 0
    }
)

vim.api.nvim_set_var(
    "knobs_layers_map",
    {
        foo = {
            compactcmd = 1
        }
    }
)

require("packer").startup {
    function(_use)
        use = require("knobs").use(_use)
        use "wbthomason/packer.nvim"
        use {"ianhomer/knobs.vim", lock = true}
        use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
        use "tpope/vim-eunuch"
        use "tpope/vim-dispatch"
        use "tweekmonster/startuptime.vim"
    end
}

vim.o.cmdheight = vim.g.knob_compactcmd and 1 or 2
