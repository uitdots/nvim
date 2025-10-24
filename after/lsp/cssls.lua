---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.cssls
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
