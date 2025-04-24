local uitvim_options = require("uitvimrc").options

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
        style = uitvim_options.border_enabled and "rounded" or "single",
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
}
