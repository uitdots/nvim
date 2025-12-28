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
        string.format("%s/lua/types/lazy", vim.fn.stdpath("config")),
        {
          path = string.format("%s/lua/types/treesitter", vim.fn.stdpath("config")),
          files = { "nvim-treesitter.lua" },
        },
        {
          path = string.format("%s/lua/types/mason", vim.fn.stdpath("config")),
          files = { "mason-tool-installer.lua" },
        },
        "lazy.nvim",
        {
          path = "ui/nvchad_types",
          mods = { "ui" },
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
