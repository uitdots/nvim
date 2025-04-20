---@type NvPluginSpec
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      filetypes = vim.g.markdown_filetypes,
      ignore_buftypes = {},
      icon_provider = "devicons", -- "mini" or "devicons"
    },
    max_length = 99999,
  },
  -- enabled = false,
  ft = vim.g.markdown_filetypes,
  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
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
}
