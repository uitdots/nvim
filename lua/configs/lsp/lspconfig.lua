---@module 'snacks'

local map = vim.keymap.set
local is_executable = require("utils.executable").is_executable
local lspconfig = require("lspconfig")
local uitvim_options = require("uitvim").options
local telescope_builtin = require("telescope.builtin")
local lsp_action = require("utils.lsp").action
local filter_availabled_external = require("uitvim").options.filter_availabled_external

local M = {}

---@private
function M._keymaps(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "<leader>lo", lsp_action["source.organizeImports"], opts("Organise Imports"))
  map("n", "<leader>ls", lsp_action["source.sortImports"], opts("Sort Imports"))
  map("n", "<leader>lr", lsp_action["source.removeUnusedImports"], opts("Remove Unused Imports"))

  map("n", "gri", telescope_builtin.lsp_outgoing_calls, opts("Outgoing Calls"))
  map("n", "grI", telescope_builtin.lsp_incoming_calls, opts("Incoming Calls"))
  map("n", "gri", telescope_builtin.lsp_implementations, opts("Go to Implementations"))
  map("n", "grr", telescope_builtin.lsp_references, opts("Go to references"))
  map("n", "grn", vim.lsp.buf.rename, opts("Rename"))
  map("n", "gra", require("actions-preview").code_actions, opts("Code Action"))
  map("n", "gD", Snacks.picker.lsp_declarations, opts("Go to Declarations"))
  map("n", "gd", telescope_builtin.lsp_definitions, opts("Go to Definitions"))
  map("n", "g<C-d>", telescope_builtin.lsp_type_definitions, opts("Go to Type Definitions"))
  map("n", "grs", telescope_builtin.lsp_document_symbols, opts("Document Symbols"))
  map("n", "grS", telescope_builtin.lsp_workspace_symbols, opts("Workspace Symbols"))
  map("n", "gr<C-s>", telescope_builtin.lsp_dynamic_workspace_symbols, opts("Dynamic Workspace Symbols"))
  map("n", "grw", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "grW", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "gr<C-w>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
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

---@private
function M.old_lspconfig(server_name)
  local opts = M.opts
  local require_ok, custom_opts = pcall(require, "configs.lsp.configs." .. server_name)
  if require_ok then
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
  end
  lspconfig[server_name].setup(opts)
end

---@private
---This will be removed when neovim lspconfig support for all lsps
function M.setup_old_lsp()
  local server_names = require("uitvim").old_lsps
  for _, server_name in pairs(server_names) do
    if
      filter_availabled_external == false
      or is_executable(require("lspconfig.configs." .. server_name).default_config.cmd[1])
    then
      M.old_lspconfig(server_name)
    end
  end
end

---@private
function M.setup_lsp()
  local server_names = require("uitvim").lsps
  for _, server_name in pairs(server_names) do
    if
      filter_availabled_external == false
      or is_executable(require("lspconfig.configs." .. server_name).default_config.cmd[1])
    then
      vim.lsp.config(server_name, M.opts)
      vim.lsp.enable(server_name)
    end
  end
end

function M.setup()
  require("nvchad.lsp").diagnostic_config()

  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })

  if uitvim_options.border_enabled then
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end

  M.setup_lsp()
  M.setup_old_lsp()
end

return M
