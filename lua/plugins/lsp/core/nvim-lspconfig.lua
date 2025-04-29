---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "LSP | Info",
      silent = true,
    },
    {
      "<leader>lh",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      desc = "LSP | Toggle InlayHint",
      silent = true,
    },
  },
  config = function()
    require("configs.lsp.lspconfig").defaults()
  end,
  dependencies = {
    "folke/neoconf.nvim",
    optional = true,
  },
}
