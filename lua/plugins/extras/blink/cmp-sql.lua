local allowed_ts_types = {
  string = true,
  string_literal = true,
  raw_string_literal = true,
  template_string = true,
}

---@type NvPluginSpec
return {
  "ray-x/cmp-sql",
  enabled = true,
  event = {
    "InsertEnter",
  },
  dependencies = {
    {
      "Saghen/blink.cmp",
      optional = true,
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            sql = {
              name = "sql",
              module = "blink.compat.source",
              score_offset = -5,
              max_items = 10,
              should_show_items = function()
                local ok, node = pcall(vim.treesitter.get_node)
                return ok and node and allowed_ts_types[node:type()] or false
              end,
            },
          },
          default = {
            "sql",
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
