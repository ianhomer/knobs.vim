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
        use "ianhomer/knobs.vim"
        use "wbthomason/packer.nvim"
        if not hasKnobs then
          print("Knobs not loaded")
          return
        end
        use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
        use "tpope/vim-eunuch"
        use "tpope/vim-dispatch"
        use "tweekmonster/startuptime.vim"
    end
}

