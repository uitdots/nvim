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
  end,
}
