local fts = vim.list_extend({
  "codecompanion",
  "html",
  "tex",
  "typst",
  "xhtml",
  "yaml",
}, require("utils.filetypes").markdown)

---@type LazySpec
return {
  "OXY2DEV/markview.nvim",
  lazy = true, -- Author require this load before nvim-treesitter, but it make blink not lazyloading
  event = "VeryLazy",
  -- ft = ft,
  ---@module 'markview'
  ---@type markview.config
  opts = {
    preview = {
      enable = false,
      enable_hybrid_mode = true,
      filetypes = fts,
      ignore_buftypes = {
        -- "nofile", -- FIXME: idk but removing "nofile" makes markview work
      },
      icon_provider = "devicons",
      modes = {
        "n",
        "no",
        "c",
        "v",
        "V",
        "i",
      },
      hybrid_modes = {
        "i",
      },
      map_gx = false,
    },
  },
  cmd = "Markview",
  keys = {
    {
      "<leader>mv",
      "<cmd>Markview toggle<cr>",
      desc = "Markdown | Toggle View (local)",
      ft = fts,
      silent = true,
    },
    {
      "<leader>mV",
      "<cmd>Markview Toggle<cr>",
      desc = "Markdown | Toggle View (all)",
      ft = fts,
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
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = "OXY2DEV/markview.nvim",
    },
  },
}
