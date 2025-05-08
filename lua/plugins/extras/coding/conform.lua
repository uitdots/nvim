---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>lf",
      "<cmd>Format<cr>",
      desc = "LSP | Format",
      silent = true,
    },
    {
      "<leader>lF",
      "<cmd>FormatToggle<cr>",
      desc = "LSP | Toggle Autoformat",
      silent = true,
    },
  },
  config = function()
    require("configs.editor.conform").setup()
  end,
}
