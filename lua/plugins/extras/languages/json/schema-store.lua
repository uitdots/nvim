---@module 'neoconf'

---@type LazySpec
return {
  "b0o/schemastore.nvim",
  opts = function()
    vim.lsp.config("yamlls", {
      ---@type lspconfig.settings.jsonls
      ---@diagnostic disable-next-line: missing-fields
      settings = {
        ---@diagnostic disable-next-line: missing-fields
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
