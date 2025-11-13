---@type LazySpec
return {
  "newtoallofthis123/blink-cmp-fuzzy-path",
  opts = {
    filetypes = {
      "codecompanion",
      "json",
      "json",
      "markdown",
      "text",
      "toml",
      "yaml",
    },
  },
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            ["fuzzy-path"] = {
              name = "Fuzzy Path",
              module = "blink-cmp-fuzzy-path",
            },
          },
          default = {
            "fuzzy-path",
          },
        },
      },
      opts_extend = {
        "sources.default",
      },
    },
  },
}
