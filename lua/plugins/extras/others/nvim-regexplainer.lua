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
    "MunifTanjim/nui.nvim",
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "regex",
        },
      },
      opts_extend = {
        "ensure_installed",
      },
    },
  },
}
