---@type LazySpec
return {
  "MahanRahmati/blink-nerdfont.nvim",
  enabled = false,
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            nerdfont = {
              module = "blink-nerdfont",
              name = "Nerd Fonts",
            },
          },
          default = {
            "nerdfont",
          },
        },
      },
      opts_extend = {
        "sources.default",
      },
    },
  },
  dependencies = "saghen/blink.cmp",
}
