local fts = {
  markdown = true,
  gitcommit = true,
  latex = true,
}
local allowed_ts_types = {
  raw_string_literal = true,
  string = true,
  string_literal = true,
  template_string = true,

  block_comment = true,
  comment = true,
  documentation = true,
  line_comment = true,
}

---@type NvPluginSpec
return {
  "moyiz/blink-emoji.nvim",
  enabled = true,
  event = {
    "InsertEnter",
  },
  dependencies = {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            should_show_items = function()
              if fts[vim.bo.filetype] then
                return true
              end
              local ok, node = pcall(vim.treesitter.get_node)
              return ok and node and allowed_ts_types[node:type()] or false
            end,
            opts = {
              insert = true,
            },
          },
        },
        default = { "emoji" },
      },
    },
    opts_extend = {
      "sources.default",
    },
  },
}
