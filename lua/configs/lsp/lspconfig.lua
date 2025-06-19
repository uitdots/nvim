local map = vim.keymap.set
local lsp_utils = require("utils.lsp")

local M = {}

---@private
---@param client vim.lsp.Client
---@param bufnr integer
---@diagnostic disable-next-line: unused-local
function M.setup_keymaps(client, bufnr)
  local telescope_builtin = require("telescope.builtin")
  local lsp_action = require("utils.lsp").action

  map("n", "<localleader>lo", lsp_action["source.organizeImports"], { desc = "LSP Action | Organise Imports", buffer = bufnr })
  map("n", "<localleader>ls", lsp_action["source.sortImports"], { desc = "LSP Action | Sort Imports", buffer = bufnr })
  map("n", "<localleader>lr", lsp_action["source.removeUnusedImports"], { desc = "LSP Action | Remove Unused Imports", buffer = bufnr })

  map("n", "<leader>lS", function()
    lsp_utils.toggle_semantic_tokens(bufnr)
  end, { desc = "LSP | Toggle Semantic Tokens", silent = true })
  map("n", "<leader>ll", function()
    vim.lsp.codelens.run()
  end, { desc = "LSP | Run Codelens", silent = true })
  map("n", "<leader>lc", function()
    vim.lsp.codelens.clear()
  end, { desc = "LSP | Clear Codelens", silent = true })

  ---@module 'snacks'

  map("n", "gro", telescope_builtin.lsp_outgoing_calls, { desc = "LSP | Outgoing Calls", buffer = bufnr })
  map("n", "grI", telescope_builtin.lsp_incoming_calls, { desc = "LSP | Incoming Calls", buffer = bufnr })
  map("n", "gri", Snacks.picker.lsp_implementations, { desc = "LSP | Go to Implementations", buffer = bufnr })
  map("n", "grr", Snacks.picker.lsp_references, { desc = "LSP | Go to references", buffer = bufnr })
  map("n", "grn", vim.lsp.buf.rename, { desc = "LSP | Rename", buffer = bufnr })
  map("n", "gra", require("actions-preview").code_actions, { desc = "LSP | Code Action", buffer = bufnr })
  map("n", "gD", Snacks.picker.lsp_declarations, { desc = "LSP | Go to Declarations", buffer = bufnr })
  map("n", "gd", Snacks.picker.lsp_definitions, { desc = "LSP | Go to Definition", buffer = bufnr })
  map("n", "g<C-d>", Snacks.picker.lsp_type_definitions, { desc = "LSP | Go to Type Definition", buffer = bufnr })
  map("n", "grs", Snacks.picker.lsp_symbols, { desc = "LSP | Symbols", buffer = bufnr })
  map("n", "grS", Snacks.picker.lsp_workspace_symbols, { desc = "LSP | Workspace Symbols", buffer = bufnr })
  map("n", "gr<C-s>", telescope_builtin.lsp_dynamic_workspace_symbols, { desc = "LSP | Dynamic Workspace Symbols", buffer = bufnr })
  map("n", "grw", vim.lsp.buf.add_workspace_folder, { desc = "LSP | Add workspace folder", buffer = bufnr })
  map("n", "grW", vim.lsp.buf.remove_workspace_folder, { desc = "LSP | Remove workspace folder", buffer = bufnr })
  map("n", "gr<C-w>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP | List workspace folders", buffer = bufnr })
end

---@private
function M.setup_global_keymap()
  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "LSP | Toggle InlayHint", silent = true })
end

---@type elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>
function M.on_attach(client, bufnr)
  M.setup_keymaps(client, bufnr)
end

---@type elem_or_list<fun(client: vim.lsp.Client, init_result: lsp.InitializeResult)>
function M.on_init() end

---https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua For file rename capabilities
---@type lsp.ClientCapabilities
M.capabilities = {
  textDocument = {
    semanticTokens = nil,
  },
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
}

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
M.opts = {
  capabilities = M.capabilities,
  on_init = M.on_init,
  on_attach = M.on_attach,
}

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })

  M.setup_global_keymap()
  vim.lsp.config("*", M.opts)
end

return M
