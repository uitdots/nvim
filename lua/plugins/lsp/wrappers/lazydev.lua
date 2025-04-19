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
