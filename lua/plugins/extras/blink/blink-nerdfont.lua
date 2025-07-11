---@type LazySpec
return {
  "MahanRahmati/blink-nerdfont.nvim",
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
              opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
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
