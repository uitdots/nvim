---@type vim.lsp.Config
return {
  filetypes = {
    "json",
    "json*",
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
      schemas = require("schemastore").json.schemas(),
    },
  },
}
