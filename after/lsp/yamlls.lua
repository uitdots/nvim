---@diagnostic disable: missing-fields
---@module 'neoconf'

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.yamlls
  settings = {
    yaml = {
      customTags = {
        "!reference sequence",
      },
    },
  },
}
