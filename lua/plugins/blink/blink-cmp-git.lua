---@type LazySpec
return {
  "Kaiser-Yang/blink-cmp-git",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            git = {
              async = true,
              module = "blink-cmp-git",
              name = "Git",
              --- @module 'blink-cmp-git'
              --- @type blink-cmp-git.Options
              opts = nil,
            },
          },
          per_filetype = {
            gitcommit = {
              "git",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.gitcommit",
      },
    },
  },
  dependencies = "saghen/blink.cmp",
}
