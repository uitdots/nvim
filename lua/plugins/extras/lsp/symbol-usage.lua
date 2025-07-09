---@type LazySpec
return {
  "Wansmer/symbol-usage.nvim",
  event = "VeryLazy",
  ---@module 'symbol-usage'
  ---@type UserOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    references = {
      enabled = true,
      include_declaration = false,
    },
    definition = {
      enabled = true,
    },
    implementation = {
      enabled = true,
    },
  },
  keys = {
    {
      "<leader>ls",
      function()
        require("symbol-usage").toggle_globally()
      end,
      desc = "LSP | Toggle Symbol Usage",
      silent = true,
    },
  },
}
