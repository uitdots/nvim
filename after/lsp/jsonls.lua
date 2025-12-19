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
    },
  },
}
