---@type NvPluginSpec
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Author require this load before nvim-treesitter, but it make blink not lazyloading
  ---@module 'markview'
  ---@type mkv.config
  opts = {
    preview = {
      enable = false,
      filetypes = vim.g.markdown_filetypes,
      ignore_buftypes = {
        "help",
      },
      icon_provider = "devicons",
    },
  },
  ft = vim.g.markdown_filetypes,
  cmd = {
    "Markview",
  },
  keys = {
    {
      "<leader>mv",
      "<cmd>Markview<cr>",
      desc = "Markdown | Toggle View",
      ft = vim.g.markdown_filetypes,
      silent = true,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "saghen/blink.cmp",
      optional = true,
    },
  },
}
