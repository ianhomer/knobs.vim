local M = {}
local KNOB_VIM_RE = "^[%w-]+/n?vim%-([%w-]+)"
local KNOB_VIM_AFTER_RE = "^[%w-]+/([%w-]+)-n?vim"
local KNOB_RE = "^[%w-]+/([%w-]+)"

function M.setup()
  vim.cmd "call knobs#Init()"
end

function M.has(knob)
    return (vim.g["knob_" .. knob] or 0) > 0
end

function M.fromPackage(package)
    knob = package:match(KNOB_VIM_RE) 
      or package:match(KNOB_VIM_AFTER_RE) 
      or package:match(KNOB_RE)
    if (knob) then
      return knob:gsub("-", "_"):lower()
    else
      return nil
    end
end

function M.use(use)
    return function(args)
        if type(args) == "string" then
            args = {args}
        end
        local package = args[1]
        knob = args.knob or M.fromPackage(package)
        if (knob) then
          local knobVariable = "knob_" .. knob
          if vim.g["knobs_levels"][knob] ~= nil then
              args.cond = 'vim.g["' .. knobVariable .. '"]'
          end
        end
        return use(args)
    end
end

return M
