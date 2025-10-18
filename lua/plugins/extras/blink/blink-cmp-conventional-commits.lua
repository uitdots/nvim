---@type LazySpec
return {
  "disrupted/blink-cmp-conventional-commits",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            conventional_commits = {
              async = true,
              name = "Conventional Commits",
              module = "blink-cmp-conventional-commits",
              ---@module 'blink-cmp-conventional-commits'
              ---@type blink-cmp-conventional-commits.Options
              opts = nil,
            },
          },
          per_filetype = {
            gitcommit = {
              "conventional_commits",
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
