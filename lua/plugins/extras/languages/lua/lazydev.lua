---@type NvPluginSpec
return {
  "folke/lazydev.nvim",
  enabled = true,
  ft = "lua",
  ---@module 'lazydev'
  ---@type lazydev.Config
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
    },
  },
  opts_extend = {
    "library",
  },
  dependencies = {
    "Bilal2453/luvit-meta", -- optional `vim.uv` typings
    {
      "saghen/blink.cmp",
      optional = true,
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            lua = {
              "lsp",
              "path",
              "snippets",
              "buffer",
              "lazydev",
            },
          },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },
      },
    },
  },
}
