---@module 'snacks'

local M = {}
local map = vim.keymap.set
local is_executable = require("core.utils").is_executable
local no_setup_lsps = require("uitvimrc").no_setup_lsps
local lspconfig = require("lspconfig")
local uitvim_options = require("uitvimrc").options

function M._keymaps(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "gri", Snacks.picker.lsp_implementations, opts("Go to Implementations"))
  map("n", "grr", Snacks.picker.lsp_references, opts("Go to references"))
  map("n", "grn", vim.lsp.buf.rename, opts("Rename"))
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

  pcall(function()
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end)
end

M.on_init = require("nvchad.configs.lspconfig").on_init

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua For file rename capabilities
M.capabilities = vim.tbl_deep_extend("force", require("nvchad.configs.lspconfig").capabilities, {
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
})

M.opts = {
  capabilities = M.capabilities,
  on_init = M.on_init,
  on_attach = M.on_attach,
}

function M.old_lspconfig(server_name)
  local opts = M.opts
  local require_ok, custom_opts = pcall(require, "configs.lsp." .. server_name)
  if require_ok then
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
  end
  lspconfig[server_name].setup(opts)
end

function M._setup_old_lsp()
  local server_names = require("uitvimrc").old_lsps
  for _, server_name in pairs(server_names) do
    if is_executable(require("lspconfig.configs." .. server_name).default_config.cmd[1]) then
      M.old_lspconfig(server_name)
    end
  end
end

function M._setup_lsp()
  local server_names = require("uitvimrc").lsps
  for _, server_name in pairs(server_names) do
    if is_executable(require("lspconfig.configs." .. server_name).default_config.cmd[1]) then
      vim.lsp.config(server_name, M.opts)
      vim.lsp.enable(server_name)
    end
  end
end

function M.defaults()
  require("nvchad.lsp").diagnostic_config()

  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
      current_line = true,
    },
  })

  if uitvim_options.border_enabled then
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end

  M._setup_lsp()
  M._setup_old_lsp()
end

return M
