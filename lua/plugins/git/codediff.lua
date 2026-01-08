---@type LazySpec
return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    {
      "<leader>gd",
      "<cmd>CodeDiff<CR>",
      desc = "CodeDiff | Toggle",
    },
  },
  config = true,
  dependencies = "MunifTanjim/nui.nvim",
}
