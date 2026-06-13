---@type LazySpec
return {
  "samiulsami/cmp-go-deep",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            go_deep = {
              name = "go_deep",
              module = "blink.compat.source",
              min_keyword_length = 3,
              max_items = 5,
              ---@module "cmp_go_deep"
              ---@type cmp_go_deep.Options
              opts = nil,
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
  dependencies = "kkharji/sqlite.lua",
}
