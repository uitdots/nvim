---@type LazySpec
return {
  "esmuellert/vscode-diff.nvim",
  cmd = "CodeDiff",
  keys = {
    {
      "<leader>gd",
      "<cmd>CodeDiff<CR>",
      desc = "VSCode Diff | View",
    },
  },
  config = true,
  dependencies = "MunifTanjim/nui.nvim",
}
