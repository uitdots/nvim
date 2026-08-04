local lsp = require("configs.lsp")
local lsps_force = require("preferences").lsp.force

---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufRead",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>li",
      "<cmd>checkhealth vim.lsp<CR>",
      desc = "LSP | Info",
      silent = true,
    },
  },
  config = function()
    lsp.setup()
    vim.lsp.enable(lsps_force)
  end,
  dependencies = "mason-org/mason.nvim",
}
