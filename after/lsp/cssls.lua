---@diagnostic disable: missing-fields
---@module 'neoconf'

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.cssls
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
