---@type vim.lsp.Config
return {
  filetypes = {
    "json",
    "jsonc",
  },
  init_options = {
    provideFormatter = false,
  },
  ---@module 'lspconfig'
  ---@type lspconfig.settings.jsonls
  settings = {
    json = {
      validate = {
        enable = true,
      },
      schemas = require("schemastore").json.schemas(),
    },
  },
}
