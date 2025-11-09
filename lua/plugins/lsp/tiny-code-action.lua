local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local exclude_lsps = require("configs.lsp.autocmds").exclude_lsps

---@type LazySpec
return {
  "rachartier/tiny-code-action.nvim",
  init = function()
    autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or exclude_lsps[client.name] then
          return
        end

        map("n", "gra", require("tiny-code-action").code_action, { desc = "LSP | Code Action", buffer = bufnr })
      end,
    })
  end,
  opts = {
    backend = "vim", ---@type "vim" | "delta" | "difftastic" | "diffsofancy"
    picker = {
      "snacks",
    },
  },
}
