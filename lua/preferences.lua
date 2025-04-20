local g = vim.g
local M = {}

---New LSP setup. If that lsp isn't in your $PATH, no problem, it won't break. If installed by Mason, yes it will be setup.
---Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
---@type string[]
M.lsps = {
  "postgres_lsp",
}

---Like above, but for old LSP setup method.
---This option will be removed in the future when nvim-lspconfig support all lsp in new way
---@type string[]
M.old_lsps = {
  "texlab",
  "eslint",
}

---Useful for anyone who install using Mason but doesn't want to set them up.
---And, if you are using wrapper for LSP that require not to config it (let them handle), then put it in here.
---@type string[]
M.no_setup_lsps = {
  "dartls",
  "ts_ls",
  "rust_analyzer",
  "jdtls",
}

-- NOTE: Where you put our custom configurations
function M.setup()
  g.mapleader = " "
  g.maplocalleader = "\\"
  g.disable_autoformat = false
  g.border_enabled = true
  g.inlayhint_default = false
  g.use_lsp_file_operation = true
  g.use_lsp_workspace_diagnostic = false
end

return M
