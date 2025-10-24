local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp_utils = require("utils.lsp")
local map = vim.keymap.set
local notify_utils = require("utils.notify")
local lsp_action = require("utils.lsp").action

local M = {}

---@type table<Lsp, true>
M.exclude_lsps = {
  gh_actions_ls = true,
  gradle_ls = true,
  sonarlint = true,
  swaggo = true,
  yamlls = true,
}

---@private
function M.setup_keymaps()
  autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client or M.exclude_lsps[client.name] then
        return
      end

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

      map("n", "grW", vim.lsp.buf.remove_workspace_folder, { desc = "LSP | Remove workspace folder", buffer = bufnr })
      map("n", "grn", vim.lsp.buf.rename, { desc = "LSP | Rename", buffer = bufnr })
      map("n", "grw", vim.lsp.buf.add_workspace_folder, { desc = "LSP | Add workspace folder", buffer = bufnr })
      map("n", "gr<C-w>", function()
        vim.notify(vim.lsp.buf.list_workspace_folders(), vim.log.levels.INFO, { title = "LSP workspace folders" })
      end, { desc = "LSP | List workspace folders", buffer = bufnr })
    end,
    group = augroup("lsp-keymaps", {}),
  })
end

-- https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
---@private
M.progress = vim.defaulttable()

---@private
function M.setup_lsp_progress()
  autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
      if not client or type(value) ~= "table" then
        return
      end
      local p = M.progress[client.id]

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
      M.progress[client.id] = vim.tbl_filter(function(v)
        return table.insert(messages, v.msg) or not v.done
      end, p)
      local message = table.concat(messages, "\n")

      notify_utils.processing({ id = "lsp_progress", message = message, title = client.name, is_done = #M.progress[client.id] == 0 })
    end,
    group = augroup("lsp-progress", {}),
  })
end

function M.setup()
  M.setup_keymaps()
  M.setup_lsp_progress()
end

return M
