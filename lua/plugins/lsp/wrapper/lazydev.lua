---@module 'blink.cmp'

---@type NvPluginSpec
return {
  "folke/lazydev.nvim",
  enabled = true,
  ft = "lua",
  dependencies = {
    {
      "Bilal2453/luvit-meta", -- optional `vim.uv` typings
      lazy = true,
    },
    {
      "saghen/blink.cmp",
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
  ---@class lazydev.Config
  opts = {
    library = {
      "lazy.nvim",
      "ui/nvchad_types",
      "luvit-meta/library",
    },
  },
}
