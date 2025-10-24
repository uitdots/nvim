---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.yamlls
  settings = {
    yaml = {
      customTags = {
        "!reference sequence",
      },
    },
  },
}
