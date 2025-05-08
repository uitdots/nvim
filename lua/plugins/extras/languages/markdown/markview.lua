local ft = require("utils.filetypes").markdown

---@type NvPluginSpec
return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Author require this load before nvim-treesitter, but it make blink not lazyloading
    ---@module 'markview'
    ---@type mkv.config
    opts = {
      preview = {
        enable = false,
        filetypes = ft,
        ignore_buftypes = {
          "help",
        },
        icon_provider = "devicons",
      },
    },
    ft = ft,
    cmd = {
      "Markview",
    },
    keys = {
      {
        "<leader>mv",
        "<cmd>Markview<cr>",
        desc = "Markdown | Toggle View",
        ft = ft,
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
