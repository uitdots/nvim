-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/lsp.lua
local M = {}

M.action = setmetatable({}, {
  __index = function(tbl, action)
    local fn = function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { action },
          diagnostics = {},
        },
      })
    end
    rawset(tbl, action, fn)
    return fn
  end,
})

return M
