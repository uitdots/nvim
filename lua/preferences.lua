local g = vim.g
local M = {}

-- NOTE: Add line by line the lsp you want to enable manually here (Install yourself, or "mason lspconfig" doesn't provide it yet, but neovim must support that)
-- Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
M.lsps = {
  "postgres_ls",
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
