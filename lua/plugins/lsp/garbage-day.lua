---@type LazySpec
return {
  "Zeioth/garbage-day.nvim",
  event = "LspAttach",
  opts = {
    excluded_lsp_clients = {
      "copilot",
    },
  },
}
