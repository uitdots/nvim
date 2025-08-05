local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp_utils = require("utils.lsp")
local map = vim.keymap.set
local notify_utils = require("utils.notify")
local lsp_action = require("utils.lsp").action

autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local telescope_builtin = require("telescope.builtin")

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
  end,
  group = augroup("lsp-keymaps", {}),
})

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
  group = augroup("lsp-progress", {}),
})
