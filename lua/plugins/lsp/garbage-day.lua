---@type LazySpec
return {
  "Zeioth/garbage-day.nvim",
  event = "LspAttach",
  keys = {
    {
      "<leader>lS",
      function()
        require("garbage-day.utils").stop_lsp()
      end,
      desc = "LSP | Stop All",
    },
    {
      "<leader>l<C-s>",
      function()
        require("garbage-day.utils").start_lsp()
      end,
      desc = "LSP | Start Current",
    },
  },
  opts = {
    excluded_lsp_clients = {
      "copilot",
    },
  },
}
