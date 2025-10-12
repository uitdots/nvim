---@type table<string, table<string, true>>
local allowed_filetypes_nodes = {
  go = {
    raw_string_literal = true,
    string_literal = true,
    template_string = true,
    interpreted_string_literal = true,
  },
}

---@type blink.cmp.CompletionItem[]
local items

---@type LazySpec
return {
  "ray-x/cmp-sql",
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
                return 200
              end,
              override = {
                should_show_items = function(_, ctx)
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
                get_completions = function(_, _, callback)
                  local async = require("blink.cmp.lib.async")

                  local task = async.task.empty():map(function()
                    if not items then
                      local words = require("cmp_sql.sql")
                      local kind = require("blink.cmp.types").CompletionItemKind.Keyword
                      items = vim.tbl_map(function(word) ---@param word string
                        ---@type blink.cmp.CompletionItem
                        ---@diagnostic disable-next-line: missing-fields
                        return {
                          label = word,
                          kind = kind,
                          kind_icon = "",
                          kind_name = "SQL",
                          kind_hl = "@keyword.sql",
                        }
                      end, words)
                    end
                    callback({
                      is_incomplete_backward = false,
                      is_incomplete_forward = false,
                      items = items,
                    })
                  end)

                  return function()
                    task:cancel()
                  end
                end,
              },
            },
            lsp = {
              fallbacks = {
                "sql"
              },
            },
          },
          default = {
            "sql",
          },
        },
      },
      opts_extend = {
        "sources.default",
        "sources.providers.lsp.fallbacks",
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
