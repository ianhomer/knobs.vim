vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

vim.g["knobs_layers_map"] = {
  test = {
    local_knobs = 1
  }
}

require("packer").startup {
    function(_use)
        local status, knobs = pcall("require","knobs")
        use = status and knobs.use(_use) or _use
        use "wbthomason/packer.nvim"
        use "ianhomer/knobs.vim"
        use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
        use "tpope/vim-eunuch"
        use "tpope/vim-dispatch"
    end
}

