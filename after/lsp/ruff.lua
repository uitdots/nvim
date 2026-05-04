---@type vim.lsp.Config
return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
  ---@module 'lspconfig'
  ---@type lspconfig.settings.ruff_lsp
  settings = nil,
}
