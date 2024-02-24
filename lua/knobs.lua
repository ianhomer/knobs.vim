local M = {}
local KNOB_VIM_RE = "^[%w-]+/n?vim%-([%w-]+)"
local KNOB_VIM_AFTER_RE = "^[%w-]+/([%w-]+)-n?vim"
local KNOB_RE = "^[%w-]+/([%w-]+)"

function M.setup()
    vim.cmd("call knobs#Init()")
end

function M.refresh()
    vim.cmd("call knobs#Refresh()")
end

function M.has(knob)
    return (vim.g["knob_" .. knob] or 0) > 0
end

local function size(table)
  local count = 0
  for _ in pairs(table) do count = count + 1 end
  return count
end

function M.count()
    return size(vim.g["knobs"])
end

function M.fromPackage(package)
    local knob = package:match(KNOB_VIM_RE) or package:match(KNOB_VIM_AFTER_RE) or package:match(KNOB_RE)
    if (knob) then
        return knob:gsub("-", "_"):lower()
    else
        return nil
    end
end

function M.cond(args)
    if type(args) == "string" then
        args = {args}
    end
    local package = args[1]
    local knob = args.knob or M.fromPackage(package)
    if (knob) then
        local knobVariable = "knob_" .. knob
        if vim.g["knobs_levels"][knob] ~= nil then
            args.cond = 'vim.g.' .. knobVariable .. ' ~= nil'
            if (not vim.g[knobVariable]) then
              args.lock = true
            end
        end
    end
    return args
end

function M.use(use)
    M.setup()
    return function(args)
        return use(M.cond(args))
    end
end

return M
