---@type vim.lsp.Config
return {
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
