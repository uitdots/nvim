---@type LazySpec
return {
  "erooke/blink-cmp-latex",
  enabled = false,
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            latex = {
              name = "Latex",
              module = "blink-cmp-latex",
              max_items = 10,
              opts = {
                -- set to true to insert the latex command instead of the symbol
                insert_command = true,
              },
            },
          },
          per_filetype = {
            tex = {
              inherit_defaults = true,
              "latex",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.tex",
      },
    },
  },
  dependencies = "saghen/blink.cmp",
}
