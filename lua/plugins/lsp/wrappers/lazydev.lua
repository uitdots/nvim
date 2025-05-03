---@type NvPluginSpec
return {
  "folke/lazydev.nvim",
  enabled = true,
  ft = "lua",
  ---@class lazydev.Config
  opts = {
    library = {
      "lazy.nvim",
      "ui/nvchad_types",
      "luvit-meta/library",
      -- { path = "snacks.nvim", words = { "Snacks" } },
    },
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
              "lazydev",
              inherit_defaults = true,
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
      opts_extend = {
        "sources.per_filetype.lua",
      },
    },
  },
}
