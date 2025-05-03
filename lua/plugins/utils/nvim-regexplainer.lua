---@type NvPluginSpec
return {
  "bennypowers/nvim-regexplainer",
  opts = {
    popup = {
      enter = true,
      focusable = true,
      border = {
        style = vim.o.winborder, -- it use nui.nvim so...
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
      desc = "Utils | Toggle Regexplainer",
      silent = true,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
}
