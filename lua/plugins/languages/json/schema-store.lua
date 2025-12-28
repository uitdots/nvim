---@type LazySpec
return {
  "b0o/schemastore.nvim",
  event = {
    "BufReadPre *.json,*.jsonc",
    "BufNewFile *.json,*.jsonc",
  },
  opts = function()
    vim.lsp.config("jsonls", {
      ---@module 'codesettings'
      ---@type lsp.jsonls
      settings = {
        json = {
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
    })
  end,
}
