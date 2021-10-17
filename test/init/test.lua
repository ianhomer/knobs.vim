vim.api.nvim_set_var(
    "knobs_levels",
    {
        k1a = 1,
        k1b = 1,
        k2a = 2,
        k2b = 2,
        k3a = 3,
        k3b = 3,
        k4a = 4,
        k4b = 4,
        k5a = 5,
        k5b = 5
    }
)

vim.g["knobs_layers_map"] = {
  test = {
    test_a = 1
  }
}

local knobs = require("knobs")
knobs.setup()

if knobs.has("k1a") then
  vim.api.nvim_command("noremap <space>a ak1a<ESC>")
end

vim.api.nvim_command("noremap <space>b ak1b<ESC>")
