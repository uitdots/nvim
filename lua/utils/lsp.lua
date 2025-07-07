local inlay_hint = require("preferences").options.inlay_hint
local semantic_tokens = require("preferences").options.semantic_tokens

local M = {}

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/lsp.lua
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
  vim.notify(string.format("Semantic tokens %s", vim.b[bufnr].semantic_tokens and "enabled" or "disabled"), vim.log.levels.INFO, { title = "LSP" })
end

---Check if inlay hints should be enabled for a specific server
---@param server_name Lsp
---@return boolean
function M.is_inlay_hint_enabled(server_name)
  if inlay_hint.servers == true then
    return true
  end

  local server_setting = inlay_hint.servers[server_name]
  if server_setting ~= nil then
    return server_setting
  end

  return inlay_hint.server_default or false
end

---Check if semantic tokens should be enabled for a specific server
---@param server_name Lsp
---@return boolean
function M.is_semantic_tokens_enabled(server_name)
  if semantic_tokens.servers == true then
    return true
  end

  local server_setting = semantic_tokens.servers[server_name]
  if server_setting ~= nil then
    return server_setting
  end

  return semantic_tokens.server_default or false
end

return M
