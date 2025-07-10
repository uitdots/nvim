---@type LazySpec
return {
  "folke/lazydev.nvim",
  enabled = true,
  ft = "lua",
  ---@module 'lazydev'
  ---@type lazydev.Config
  opts = {},
  dependencies = {
    "Bilal2453/luvit-meta", -- optional `vim.uv` typings
    {
      "saghen/blink.cmp",
      optional = true,
    },
  },
  specs = {
    {
      "saghen/blink.cmp",
      optional = true,
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            lua = {
              inherit_defaults = true,
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
