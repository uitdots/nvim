---@type LazySpec
return {
  "MahanRahmati/blink-nerdfont.nvim",
  enabled = false,
  event = "InsertEnter",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          default = {
            "nerdfont",
          },
          providers = {
            nerdfont = {
              module = "blink-nerdfont",
              name = "Nerd Fonts",
            },
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
