local allowed_ts_types = {
  raw_string_literal = true,
  string = true,
  string_literal = true,
  template_string = true,
  interpreted_string_literal = true,
}

local kind_name = "Table" -- Because idk how to customise this, pick table

---@type LazySpec
return {
  "ray-x/cmp-sql",
  enabled = true,
  event = "InsertEnter",
  specs = {
    {
      "Saghen/blink.cmp",
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
              should_show_items = function(ctx)
                if vim.bo[ctx.bufnr].filetype:match("sql") then
                  return true
                end
                local ok, node = pcall(vim.treesitter.get_node)
                return ok and node and allowed_ts_types[node:type()] or false
              end,
              transform_items = function(_, items)
                for _, item in ipairs(items) do
                  item.kind_name = kind_name
                end
                return items
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
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
