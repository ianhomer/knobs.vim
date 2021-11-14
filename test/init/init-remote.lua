vim.api.nvim_set_var(
    "knobs_levels",
    {
        fugitive = 3,
        eunuch = 5
    }
)

local hasKnobs, _ = pcall(cmd, "packadd knobs.vim")
if hasKnobs then
  local knobs = require("knobs")
  knobs.setup()
end

require("packer").startup {
    function(_use)
        local hasKnobs, knobs = pcall(require, "knobs")
        use = hasKnobs and knobs.use(_use) or _use
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

