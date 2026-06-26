---@type LazySpec
return {
  "samiulsami/go-deep.nvim",
  build = ':lua require("go_deep").build()',
  ---@module 'go_deep'
  ---@type go_deep.Config
  opts = nil,
  config = true,
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            go_deep = {
              module = "go_deep.blink",
              async = true,
            },
          },
          per_filetype = {
            go = {
              "go_deep",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.go_deep",
      },
    },
  },
  dependencies = "saghen/blink.lib",
}
