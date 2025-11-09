---@type LazySpec
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = {
    "VenvSelect",
    "VenvSelectCached",
  },
  keys = {
    {
      "<leader>uv",
      "<cmd>VenvSelect<cr>",
      desc = "Utils | Select Python Venv",
      ft = "python",
      silent = true,
    },
  },
  main = "venv-selector",
}
