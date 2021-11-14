vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
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
