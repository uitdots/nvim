---@module 'neoconf'

---@type LazySpec
return {
  "b0o/schemastore.nvim",
  opts = function()
    vim.lsp.config("yamlls", {
      ---@type lspconfig.settings.yamlls
      ---@diagnostic disable-next-line: missing-fields
      settings = {
        ---@diagnostic disable-next-line: missing-fields
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
