local fts = vim.list_extend({
  "codecompanion",
  "html",
  "tex",
  "typst",
  "xhtml",
  "yaml",
}, require("utils.filetypes").markdown)

---@type NvPluginSpec
return {
  {
    "OXY2DEV/markview.nvim",
    lazy = true, -- Author require this load before nvim-treesitter, but it make blink not lazyloading
    event = "VeryLazy",
    -- ft = ft,
    ---@module 'markview'
    ---@type markview.config
    opts = {
      preview = {
        enable = true,
        enable_hybrid_mode = true,
        filetypes = fts,
        ignore_buftypes = {
          "help", -- using helpview
        },
        icon_provider = "devicons",
        hybrid_modes = { "i" },
      },
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
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "saghen/blink.cmp",
        optional = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "OXY2DEV/markview.nvim",
    },
  },
}
