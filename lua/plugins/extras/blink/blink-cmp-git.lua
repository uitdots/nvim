---@type LazySpec
return {
  "Kaiser-Yang/blink-cmp-git",
  ft = "gitcommit",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            git = {
              module = "blink-cmp-git",
              name = "Git",
              --- @module 'blink-cmp-git'
              --- @type blink-cmp-git.Options
              opts = nil,
            },
          },
          per_filetype = {
            gitcommit = {
              inherit_defaults = true,
              "git",
            },
          },
        },
      },
    },
  },
  dependencies = "saghen/blink.cmp",
}
