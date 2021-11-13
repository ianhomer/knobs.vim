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

-- vim.cmd "packadd packer.nvim" -- load the package manager
local dataDir = vim.g["knobs_test_data_dir"] or "~/.local/share/nvim"
local configDir = vim.g["knobs_test_config_dir"] or "~/.config/nvim/"

require("packer").startup {
    function(_use)
        local status, knobs = pcall("require","knobs")
        use = status and knobs.use(_use) or _use
        use "wbthomason/packer.nvim"
        if status and not knobs.has("local_knobs") then
          use {"ianhomer/knobs.vim", lock = true}
        else
          use "ianhomer/knobs.vim"
        end
        use {"tpope/vim-fugitive", cmd = {"G", "Git"}}
        use "tpope/vim-eunuch"
        use "tpope/vim-dispatch"
    end,
    config = {
        profile = {
            enable = true
        },
        log = {level = "DEBUG"},
        compile_path = configDir .. "/plugin/packer_compiled.lua",
        package_root = dataDir .. "/site/pack",
        plugin_package = "vendor"
    }
}
