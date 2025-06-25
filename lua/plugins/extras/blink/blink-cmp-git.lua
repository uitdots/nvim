---@module 'blink-cmp'

---@type NvPluginSpec
return {
  "Kaiser-Yang/blink-cmp-git",
  enabled = true,
  ft = "gitcommit",
  dependencies = {
    {
      "saghen/blink.cmp",
      optional = true,
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            gitcommit = {
              "lsp",
              "path",
              "snippets",
              "buffer",
              "git",
            },
          },
          providers = {
            git = {
              module = "blink-cmp-git",
              name = "Git",
              --- @module 'blink-cmp-git'
              --- @type blink-cmp-git.Options
              opts = {},
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.gitcommit",
      },
    },
    {
      "nvim-lua/plenary.nvim",
    },
  },
}
