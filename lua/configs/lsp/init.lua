local map = vim.keymap.set
local inlay_hint_enabled = require("preferences").options.inlay_hint.client
local semantic_tokens_enabled = require("preferences").options.semantic_tokens.client

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
  end, { desc = "LSP | Toggle Underline Diagnostic", silent = true })
  map("n", "<leader>lh", function()
    local enabled = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(enabled)
    vim.notify(enabled and "Enabled" or "Disabled", vim.log.levels.INFO, {
      title = "LSP Inlay Hint",
      id = "neovim_lsp_inlay_hint",
    })
  end, { desc = "LSP | Toggle InlayHint", silent = true })
end

---@type elem_or_list<fun(client: vim.lsp.Client, init_result: lsp.InitializeResult)>
function M.on_init(client)
  if not semantic_tokens_enabled and client:supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

---https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua For file rename capabilities
---@type lsp.ClientCapabilities
M.capabilities = {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
M.opts = {
  capabilities = M.capabilities,
  on_init = M.on_init,
}

---@private
function M.setup_auto_cmds() end

function M.setup()
  vim.lsp.inlay_hint.enable(inlay_hint_enabled)
  M.global_keymaps()
  require("configs.lsp.autocmds")
  vim.lsp.config("*", M.opts)
end

return M
