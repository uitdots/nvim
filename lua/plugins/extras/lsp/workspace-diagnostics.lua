---@type LazySpec
return {
  "artemave/workspace-diagnostics.nvim",
  enabled = false,
  init = function()
    local lspconfig = require("configs.lsp.lspconfig")

    local on_attach = function(client, bufnr)
      lspconfig.on_attach(client, bufnr)
      require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end

    lspconfig.on_attach = on_attach
  end,
}
