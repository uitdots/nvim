---@type vim.lsp.Config
return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
  ---@module 'codesettings'
  ---@type lsp.ruff_lsp
  settings = nil,
}
