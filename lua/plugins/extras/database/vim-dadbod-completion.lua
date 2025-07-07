---@type LazySpec
return {
  "kristijanhusak/vim-dadbod-completion",
  ft = {
    "sql",
    "mysql",
    "plsql",
  },
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            sql = {
              inherit_defaults = true,
              "dadbod",
            },
          },
          providers = {
            dadbod = {
              name = "Dadbod",
              module = "vim_dadbod_completion.blink",
            },
          },
        },
      },
      optional = true,
    },
  },
}
