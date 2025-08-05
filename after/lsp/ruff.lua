---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
