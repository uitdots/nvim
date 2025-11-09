---@type table<string, table<string, true>>
local allowed_filetypes_nodes = {
  go = {
    raw_string_literal = true,
    string_literal = true,
    template_string = true,
    interpreted_string_literal = true,
  },
}

---@type LazySpec
return {
  "KevinNitroG/blink-sql.nvim",
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
              module = "blink-sql",
              score_offset = function(ctx)
                if vim.bo[ctx.bufnr].filetype:match("sql") then
                  return 0
                end
                return -5
              end,
              max_items = function(ctx)
                if vim.bo[ctx.bufnr].filetype:match("sql") then
                  return 10
                end
                return 50
              end,
              should_show_items = function(ctx)
                local filetype = vim.bo[ctx.bufnr].filetype
                if filetype:match("sql") then
                  return true
                end
                local ok, node = pcall(vim.treesitter.get_node)
                if not ok or not node then
                  return false
                end
                local allowed_filetype_nodes = allowed_filetypes_nodes[filetype]
                return allowed_filetype_nodes and allowed_filetype_nodes[node:type()] or false
              end,
            },
            lsp = {
              fallbacks = {
                "sql",
              },
            },
          },
          default = {
            "sql",
          },
          per_filetype = {
            sql = {
              "sql",
            },
          },
        },
      },
      opts_extend = {
        "sources.default",
        "sources.per_filetype.sql",
        "sources.providers.lsp.fallbacks",
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
  },
}
