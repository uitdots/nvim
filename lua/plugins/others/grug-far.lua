---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>f<C-r>",
      "<cmd>GrugFar<cr>",
      desc = "GrugFar | Open",
      silent = true,
    },
  },
  config = true,
}
