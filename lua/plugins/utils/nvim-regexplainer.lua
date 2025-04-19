---@type NvPluginSpec
return {
  "bennypowers/nvim-regexplainer",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    popup = {
      enter = true,
      focusable = true,
      border = {
        style = vim.g.border_enabled and "rounded" or "single",
      },
    },
  },
  cmd = {
    "RegexplainerToggle",
    "RegexplainerShowPopup",
  },
  keys = {
    {
      "<leader>ur",
      "<cmd>RegexplainerShowPopup<cr>",
      desc = "Regexplainer | Toggle",
      silent = true,
    },
  },
}
