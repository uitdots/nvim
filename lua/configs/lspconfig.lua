---@module 'snacks'

local M = {}
local map = vim.keymap.set

M._keymaps = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "gri", Snacks.picker.lsp_implementations, opts("Go to definition"))
  map("n", "grr", Snacks.picker.lsp_references, opts("Go to references"))
  map("n", "grn", require("nvchad.lsp.renamer"), opts("Rename"))
  map("n", "gra", require("actions-preview").code_actions, opts("Rename"))
  map("n", "gl", vim.diagnostic.open_float, opts("Inline diagnostic"))
  map("n", "gD", Snacks.picker.lsp_definitions, opts("Go to declaration"))
  map("n", "gd", Snacks.picker.lsp_declarations, opts("Go to definition"))
  map("n", "g<C-d>", Snacks.picker.lsp_type_definitions, opts("Go to type definition"))
  map("n", "<leader>lw", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>lW", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "<leader>ls", Snacks.picker.lsp_symbols, opts("Symbols"))
  map("n", "<leader>ls", Snacks.picker.lsp_workspace_symbols, opts("Symbols"))
  map("n", "<leader>w<C-l>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, opts("Toggle Inlay Hints"))
end

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  M._keymaps(client, bufnr)

  if vim.g.use_lsp_workspace_diagnostic then
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end
end

-- disable semanticTokens
M.on_init = require("nvchad.configs.lspconfig").on_init

M.capabilities = require("nvchad.configs.lspconfig").capabilities

M.defaults = function()
  require("nvchad.lsp").diagnostic_config()

  vim.diagnostic.config({
    virtual_text = {
      current_line = true,
    },
  })

  if vim.g.border_enabled then
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end

  vim.lsp.config("*", {
    capabilities = M.capabilities,
    on_init = M.on_init,
    on_attach = M.on_attach,
  })
end

return M
