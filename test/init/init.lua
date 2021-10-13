vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

-- vim.cmd "packadd packer.nvim" -- load the package manager
local dataDir = vim.g["knobs_test_data_dir"] or "~/.local/share/nvim" 
local configDir = vim.g["knobs_test_config_dir"] or "~/.config/nvim/" 

return require("packer").startup {
    function(_use)
        local knobs = require"knobs"
        knobs.setup()
        local use = require "knobs".use(_use)
        use "wbthomason/packer.nvim"
        use {"ianhomer/knobs.vim", lock = true}
        use "tpope/vim-fugitive"
        use "tpope/vim-eunuch"
    end,
    config = {
        profile = {
          enable = true,
        },
        compile_path = configDir .. "/plugin/packer_compiled.lua",
        package_root = dataDir .. "/site/pack",
        plugin_package = "vendor"
    }
}
