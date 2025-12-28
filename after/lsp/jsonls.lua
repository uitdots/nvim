---@type vim.lsp.Config
return {
  filetypes = {
    "json",
    "json.openapi",
    "jsonc",
  },
  init_options = {
    provideFormatter = false,
  },
  ---@module 'codesettings'
  ---@type lsp.jsonls
  settings = {
    json = {
      validate = {
        enable = true,
      },
      schemas = require("schemastore").json.schemas({
        extra = {
          {
            name = "CodeCompanion Workspace Schema",
            description = "",
            fileMatch = "codecompanion-workspace.json",
            url = "https://raw.githubusercontent.com/olimorris/codecompanion.nvim/refs/heads/main/lua/codecompanion/workspace-schema.json",
          },
        },
      }),
    },
  },
}
