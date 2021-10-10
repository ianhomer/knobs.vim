vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

-- vim.cmd "packadd packer.nvim" -- load the package manager
local configDir = vim.g["knobs_test_config_root"] or "~/.local/share/nvim" 

return require("packer").startup {
    function(_use)
        local use = require "knobs".use(_use)
        use "wbthomason/packer.nvim"
        use {"ianhomer/knobs.vim", lock = true}
        use "tpope/vim-fugitive"
        use "tpope/vim-eunuch"
    end,
    config = {
        package_root = configDir .. "/site/pack",
        plugin_package = "vendor"
    }
}
