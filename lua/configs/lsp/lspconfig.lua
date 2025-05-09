local map = vim.keymap.set

local M = {}

---@private
function M.keymaps(_, bufnr)
  local telescope_builtin = require("telescope.builtin")
  local lsp_action = require("utils.lsp").action
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "<leader>lo", lsp_action["source.organizeImports"], opts("Organise Imports"))
  map("n", "<leader>ls", lsp_action["source.sortImports"], opts("Sort Imports"))
  map("n", "<leader>lr", lsp_action["source.removeUnusedImports"], opts("Remove Unused Imports"))

  map("n", "gro", telescope_builtin.lsp_outgoing_calls, opts("Outgoing Calls"))
  map("n", "grI", telescope_builtin.lsp_incoming_calls, opts("Incoming Calls"))
  map("n", "gri", Snacks.picker.lsp_implementations, opts("Go to Implementations"))
  map("n", "grr", Snacks.picker.lsp_references, opts("Go to references"))
  map("n", "grn", vim.lsp.buf.rename, opts("Rename"))
  map("n", "gra", require("actions-preview").code_actions, opts("Code Action"))
  map("n", "gD", Snacks.picker.lsp_declarations, opts("Go to Declarations"))
  map("n", "gd", Snacks.picker.lsp_definitions, opts("Go to Definition"))
  map("n", "g<C-d>", Snacks.picker.lsp_type_definitions, opts("Go to Type Definition"))
  map("n", "grs", Snacks.picker.lsp_symbols, opts("Symbols"))
  map("n", "grS", Snacks.picker.lsp_workspace_symbols, opts("Workspace Symbols"))
  map("n", "gr<C-s>", telescope_builtin.lsp_dynamic_workspace_symbols, opts("Dynamic Workspace Symbols"))
  map("n", "grw", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "grW", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "gr<C-w>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
end

M.on_attach = function(client, bufnr)
  M.keymaps(client, bufnr)
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

function M.setup()
  require("nvchad.lsp").diagnostic_config()

  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })
end

return M
