---@type LazySpec
return {
  "micangl/cmp-vimtex",
  specs = {
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            vimtex = {
              name = "vimtex",
              module = "blink.compat.source",
              score_offset = 10,
              max_items = 10,
            },
          },
          per_filetype = {
            tex = {
              inherit_defaults = true,
              "vimtex",
            },
          },
        },
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
