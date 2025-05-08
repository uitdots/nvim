---@type NvPluginSpec
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = {
    sources = {
      per_filetype = {
        go = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "sql",
        },
      },
      providers = {
        sql = {
          name = "sql",
          module = "blink.compat.source",
          score_offset = -30,
        },
      },
    },
  },
  dependencies = {
    "ray-x/cmp-sql",
    enabled = true,
    dependencies = {
      "Saghen/blink.compat",
    },
  },
}
