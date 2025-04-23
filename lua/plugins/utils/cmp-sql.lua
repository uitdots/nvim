---@type NvPluginSpec
return {
  "ray-x/cmp-sql",
  dependencies = {
    {
      "Saghen/blink.cmp",
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
    },
    {
      "Saghen/blink.compat",
    },
  },
}
