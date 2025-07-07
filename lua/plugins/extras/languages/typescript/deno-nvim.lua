local lspconfig = require("configs.lsp.lspconfig")

---@type LazySpec
return {
  "sigmaSd/deno-nvim",
  enabled = false, -- TODO: Check this when it support neovim 0.11 API
  opts = {
    ---@type vim.lsp.Config
    ---@diagnostic disable-next-line: missing-fields
    server = {
      on_attach = lspconfig.on_attach,
      capabilites = lspconfig.capabilities,
      on_init = lspconfig.on_init,
    },
  },
}
