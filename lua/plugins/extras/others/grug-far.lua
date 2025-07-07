---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>f<C-r>",
      "<cmd>GrugFar<cr>",
      desc = "Find | And Replace",
      silent = true,
    },
  },
  config = true,
}
