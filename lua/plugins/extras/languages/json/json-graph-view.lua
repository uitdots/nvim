---@type LazySpec
return {
  "Owen-Dechow/nvim_json_graph_view",
  keys = {
    {
      "<leader>qg",
      "<cmd>JsonGraphView<CR>",
      desc = "Query | Json Graph",
      silent = true,
      ft = {
        "bigfile",
        "json",
        "json5",
        "jsonc",
      },
    },
  },
  config = true,
}
