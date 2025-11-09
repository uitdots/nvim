---@type LazySpec
return {
  "b0o/schemastore.nvim",
  opts = function()
    vim.lsp.config("yamlls", {
      ---@module 'codesettings'
      ---@type lsp.yamlls
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    })
  end,
}
