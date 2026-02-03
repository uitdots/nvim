---@type LazySpec
return {
  "Equilibris/nx.nvim",
  keys = {
    {
      "<leader>un",
      "<cmd>Telescope nx actions<CR>",
      desc = "Utils | Nx",
    },
  },
  config = true,
  dependencies = "nvim-telescope/telescope.nvim",
}
