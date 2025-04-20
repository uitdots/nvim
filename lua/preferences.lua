local g = vim.g
local is_executable = require("core.utils").is_executable
local M = {}

---Add line by line the lsp you want to enable manually here (Install yourself, or "mason lspconfig" doesn't provide it yet, but neovim must support that) (new API)
---Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
---@type string[]
M.lsps = {
  is_executable("postgrestools") and "postgres_ls" or "",
}

---For old lsp configurations (old nvim lsp way), and you want to enable manully
---For those LSP listed here with uncheck: https://github.com/neovim/nvim-lspconfig/issues/3705
---This option will be removed in the future when nvim-lspconfig support all lsp in new way
---@type string[]
M.old_lsps = {}

---Yes... Need mason-lspconfig support for this
---We don't support customise those old lsp way because they will be support in the new way soon :P
---Will remove this in the future
---@type string[]
M.old_lsps_mason = {
  "eslint",
  "texlab",
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
