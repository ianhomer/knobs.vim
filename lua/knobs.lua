local M = {}

vim.cmd "call knobs#Init()"

function M.has(knob)
  return (vim.g["knob_" .. knob] or 0) > 0
end

return M
