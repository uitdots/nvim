---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  filetypes = {
    "helm", -- helm vim set this
    "helmchart", -- Custom filetype
    "yaml.helm-values", -- This is set by helm vim
  },
}
