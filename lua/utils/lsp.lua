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

---Source: https://github.com/AstroNvim/astrolsp/blob/main/lua/astrolsp/toggles.lua
---@private
---@param bufnr integer
function M.toggle_semantic_tokens(bufnr)
  vim.b[bufnr].semantic_tokens = not vim.b[bufnr].semantic_tokens
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client:supports_method("textDocument/semanticTokens/full", bufnr) then
      vim.lsp.semantic_tokens[vim.b[bufnr].semantic_tokens and "start" or "stop"](bufnr, client.id)
      vim.lsp.semantic_tokens.force_refresh(bufnr)
    end
  end
  vim.notify("Semantic tokens " .. (vim.b[bufnr].semantic_tokens and "enabled" or "disabled"), vim.log.levels.INFO, { title = "LSP" })
end

return M
