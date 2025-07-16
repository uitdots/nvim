---@diagnostic disable: missing-fields
---@module 'neoconf'

---@type vim.lsp.Config
return {
  init_options = {
    provideFormatter = false,
  },
  ---@type lspconfig.settings.jsonls
  settings = {
    json = {
      schemas = require("schemastore").json.schemas({
        extra = {
          {
            name = "CodeCompanion Workspace Schema",
            fileMatch = "codecompanion-workspace.json",
            url = "https://raw.githubusercontent.com/olimorris/codecompanion.nvim/refs/heads/main/lua/codecompanion/workspace-schema.json",
          },
        },
      }),
      validate = { enable = true },
    },
  },
}
