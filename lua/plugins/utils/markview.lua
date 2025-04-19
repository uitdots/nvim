local fts = {
  "Avante",
  "markdown",
  "norg",
  "org",
  "rmd",
  "vimwiki",
}

---@type NvPluginSpec
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      filetypes = fts,
      ignore_buftypes = {},
      icon_provider = "devicons", -- "mini" or "devicons"
    },
    max_length = 99999,
  },
  -- enabled = false,
  ft = fts,
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
      ft = fts,
      silent = true,
    },
  },
}
