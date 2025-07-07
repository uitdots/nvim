---@type LazySpec
---NOTE: This plugin doesn't work for /context :v?
return {
  "banjo/contextfiles.nvim",
  enabled = false,
  specs = {
    {
      "olimorris/codecompanion.nvim",
      opts = {
        extensions = {
          contextfiles = {
            opts = {},
          },
        },
      },
      dependencies = "banjo/contextfiles.nvim",
    },
  },
}
