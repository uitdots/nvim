---@module 'snacks'

local M = {}
local map = vim.keymap.set

M._keymaps = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "gri", Snacks.picker.lsp_implementations, opts("Go to Implementations"))
  map("n", "grr", Snacks.picker.lsp_references, opts("Go to references"))
  map("n", "grn", require("nvchad.lsp.renamer"), opts("Rename"))
  map("n", "gra", require("actions-preview").code_actions, opts("Code Action"))
  map("n", "gl", vim.diagnostic.open_float, opts("Inline Diagnostic"))
  map("n", "gD", Snacks.picker.lsp_definitions, opts("Go to Declaration"))
  map("n", "gd", Snacks.picker.lsp_declarations, opts("Go to Definition"))
  map("n", "g<C-d>", Snacks.picker.lsp_type_definitions, opts("Go to Type Definition"))
  map("n", "grs", Snacks.picker.lsp_symbols, opts("Symbols"))
  map("n", "grS", Snacks.picker.lsp_workspace_symbols, opts("Workspace Symbols"))
  map("n", "grw", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "grW", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "gr<C-w>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, opts("Toggle Inlay Hints"))
end

M.on_attach = function(client, bufnr)
  M._keymaps(client, bufnr)

  if vim.g.use_lsp_workspace_diagnostic then
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end
end

M.on_init = require("nvchad.configs.lspconfig").on_init

M.capabilities = require("nvchad.configs.lspconfig").capabilities

M.opts = {
  capabilities = M.capabilities,
  on_init = M.on_init,
  on_attach = M.on_attach,
}

M.old_lspconfig = function(server_name)
  require("lspconfig")[server_name].setup(M.opts)
end

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

  vim.lsp.config("*", M.opts)

  vim.lsp.enable(require("preferences").lsps)
end

return M
