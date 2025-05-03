---@type NvPluginSpec
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = {
    sources = {
      default = {
        "sql",
      },
      providers = {
        sql = {
          name = "sql",
          module = "blink.compat.source",
          score_offset = 15,
        },
      },
    },
  },
  opts_extend = {
    "sources.default",
  },
  dependencies = {
    "ray-x/cmp-sql",
    enabled = true,
    dependencies = {
      "Saghen/blink.compat",
    },
  },
}
