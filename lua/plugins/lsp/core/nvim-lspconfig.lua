---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>i",
      "<cmd>LspInfo<cr>",
      desc = "LSP | Info",
      silent = true,
    },
  },
  config = function()
    require("configs.lspconfig").defaults()

    local servers = {
      -- NOTE: Add line by line the lsp you want to enable manually here (Install yourself, or "mason lspconfig" doesn't provide it yet, but neovim must support that)
      -- Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp

      "postgres_ls",
    }

    vim.lsp.enable(servers)
  end,
}
