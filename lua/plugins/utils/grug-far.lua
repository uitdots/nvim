---@type NvPluginSpec
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>fR",
      "<cmd>GrugFar<cr>",
      desc = "GrugFar | Find And Replace",
      silent = true,
    },
  },
  config = true,
}
