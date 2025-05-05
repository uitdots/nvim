---@type NvPluginSpec
return {
  "moyiz/blink-emoji.nvim",
  enabled = true,
  dependencies = {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = {
          "emoji",
        },
        per_filetype = {
          markdown = { "emoji" },
          gitcommit = { "emoji" },
          latex = { "emoji" },
        },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = { insert = true },
          },
        },
      },
    },
    opts_extend = {
      "sources.default",
      "sources.per_filetype.markdown",
      "sources.per_filetype.gitcommit",
      "sources.per_filetype.latex",
    },
  },
}
