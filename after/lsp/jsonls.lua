---@type vim.lsp.ClientConfig
---@diagnostic disable-next-line: missing-fields
return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
