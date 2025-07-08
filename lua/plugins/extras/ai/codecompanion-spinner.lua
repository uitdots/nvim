---@type LazySpec
return {
  "franco-ruggeri/codecompanion-spinner.nvim",
  config = true,
  specs = {
    {
      "olimorris/codecompanion.nvim",
      dependencies = "franco-ruggeri/codecompanion-spinner.nvim",
    },
  },
}
