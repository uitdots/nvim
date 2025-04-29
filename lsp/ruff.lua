return {
  on_attach = function(client, bufnr)
    require("configs.lsp.lspconfig").on_attach(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}
