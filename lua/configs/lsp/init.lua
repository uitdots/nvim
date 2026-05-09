local map = vim.keymap.set
local inlay_hint_enabled = require("preferences").options.inlay_hint.client
local lsp = vim.lsp

local M = {}

---@private
function M.global_keymaps()
  map("n", "<leader>lu", function()
    local enabled = not vim.diagnostic.config().underline
    vim.diagnostic.config({ underline = enabled })
    vim.notify(enabled and "Enabled" or "Disabled", vim.log.levels.INFO, {
      title = "LSP Diagnostic Underline",
      id = "neovim_lsp_diagnostic_underline",
    })
  end, { desc = "LSP | Toggle Underline", silent = true })
  map("n", "<leader>lh", function()
    local enabled = not lsp.inlay_hint.is_enabled()
    lsp.inlay_hint.enable(enabled)
    vim.notify(enabled and "Enabled" or "Disabled", vim.log.levels.INFO, {
      title = "LSP Inlay Hint",
      id = "neovim_lsp_inlay_hint",
    })
  end, { desc = "LSP | Toggle InlayHint", silent = true })
end

function M.setup()
  lsp.inlay_hint.enable(inlay_hint_enabled)
  M.global_keymaps()
  require("configs.lsp.autocmds").setup()
end

return M
