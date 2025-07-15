local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local lsp_utils = require("utils.lsp")
local notify_utils = require("utils.notify")
local inlay_hint_enabled = require("preferences").options.inlay_hint.client
local semantic_tokens_enabled = require("preferences").options.semantic_tokens.client

local M = {}

---@private
---@param client vim.lsp.Client
---@param bufnr integer
---@diagnostic disable-next-line: unused-local
function M.setup_keymaps(client, bufnr)
  local telescope_builtin = require("telescope.builtin")
  local lsp_action = require("utils.lsp").action

  map("n", "<leader>lao", lsp_action["source.organizeImports"], { desc = "LSP Action | Organise Imports", buffer = bufnr })
  map("n", "<leader>las", lsp_action["source.sortImports"], { desc = "LSP Action | Sort Imports", buffer = bufnr })
  map("n", "<leader>lau", lsp_action["source.removeUnusedImports"], { desc = "LSP Action | Remove Unused Imports", buffer = bufnr })

  map("n", "<leader>lS", function()
    lsp_utils.toggle_semantic_tokens(bufnr)
  end, { desc = "LSP | Toggle Semantic Tokens", silent = true })
  map("n", "<leader>lL", function()
    vim.lsp.codelens.run()
  end, { desc = "LSP | Run Codelens", silent = true })
  map("n", "<leader>lc", function()
    vim.lsp.codelens.clear()
  end, { desc = "LSP | Clear Codelens", silent = true })

  ---@module 'snacks'

  -- TODO: Maybe override from other, not declare keymap from here.
  map("n", "gD", Snacks.picker.lsp_declarations, { desc = "LSP | Go to Declarations", buffer = bufnr })
  map("n", "gd", Snacks.picker.lsp_definitions, { desc = "LSP | Go to Definition", buffer = bufnr })
  map("n", "gr<C-s>", telescope_builtin.lsp_dynamic_workspace_symbols, { desc = "LSP | Dynamic Workspace Symbols", buffer = bufnr })
  map("n", "grI", telescope_builtin.lsp_incoming_calls, { desc = "LSP | Incoming Calls", buffer = bufnr })
  map("n", "grS", Snacks.picker.lsp_workspace_symbols, { desc = "LSP | Workspace Symbols", buffer = bufnr })
  map("n", "grW", vim.lsp.buf.remove_workspace_folder, { desc = "LSP | Remove workspace folder", buffer = bufnr })
  map("n", "gra", require("tiny-code-action").code_action, { desc = "LSP | Code Action", buffer = bufnr })
  map("n", "gri", Snacks.picker.lsp_implementations, { desc = "LSP | Go to Implementations", buffer = bufnr })
  map("n", "grn", vim.lsp.buf.rename, { desc = "LSP | Rename", buffer = bufnr })
  map("n", "gro", telescope_builtin.lsp_outgoing_calls, { desc = "LSP | Outgoing Calls", buffer = bufnr })
  map("n", "grr", Snacks.picker.lsp_references, { desc = "LSP | Go to references", buffer = bufnr })
  map("n", "gO", Snacks.picker.lsp_symbols, { desc = "LSP | Symbols", buffer = bufnr })
  map("n", "grt", Snacks.picker.lsp_type_definitions, { desc = "LSP | Go to Type Definition", buffer = bufnr })
  map("n", "grw", vim.lsp.buf.add_workspace_folder, { desc = "LSP | Add workspace folder", buffer = bufnr })
  map("n", "gr<C-w>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP | List workspace folders", buffer = bufnr })
end

---@private
function M.setup_global_keymap()
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

---@type elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>
function M.on_attach(client, bufnr)
  M.setup_keymaps(client, bufnr)
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
}

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
M.opts = {
  capabilities = M.capabilities,
  on_init = M.on_init,
  on_attach = M.on_attach,
}

---@private
function M.setup_auto_cmds()
  -- https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples
  ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
  local progress = vim.defaulttable()

  autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
      if not client or type(value) ~= "table" then
        return
      end
      local p = progress[client.id]

      for i = 1, #p + 1 do
        if i == #p + 1 or p[i].token == ev.data.params.token then
          p[i] = {
            token = ev.data.params.token,
            msg = ("[%3d%%] %s%s"):format(value.kind == "end" and 100 or value.percentage or 100, value.title or "", value.message and (" **%s**"):format(value.message) or ""),
            done = value.kind == "end",
          }
          break
        end
      end

      local messages = {} ---@type string[]
      progress[client.id] = vim.tbl_filter(function(v)
        return table.insert(messages, v.msg) or not v.done
      end, p)
      local message = table.concat(messages, "\n")

      notify_utils.processing({ id = "lsp_progress", message = message, title = client.name, is_done = #progress[client.id] == 0 })
    end,
  })
end

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })

  vim.lsp.inlay_hint.enable(inlay_hint_enabled)
  M.setup_auto_cmds()
  M.setup_global_keymap()
  vim.lsp.config("*", M.opts)
end

return M
