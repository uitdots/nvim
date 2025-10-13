---@type LazySpec
return {
  "kristijanhusak/vim-dadbod-completion",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            dadbod = {
              name = "Dadbod",
              module = "vim_dadbod_completion.blink",
              fallbacks = {
                "sql",
              }
            },
          },
          per_filetype = {
            sql = {
              "dadbod",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.sql",
      },
    },
  },
  dependencies = "tpope/vim-dadbod",
}
