---@type LazySpec
return {
  {
    "folke/lazydev.nvim",
    optional = true,
    ---@module 'lazydev'
    ---@type lazydev.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      library = {
        string.format("%s/lua/types", vim.fn.stdpath("config")),
        "lazy.nvim",
        {
          path = "ui/nvchad_types",
          mods = { "ui" },
        },
        {
          path = "neoconf.nvim/types/lsp.lua",
          mods = { "neoconf" },
        },
        {
          path = "snacks.nvim",
          words = { "Snacks" },
        },
        {
          path = "luvit-meta/library",
          words = { "vim%.uv" },
        },
      },
    },
    opts_extend = {
      "library",
    },
  },
}
