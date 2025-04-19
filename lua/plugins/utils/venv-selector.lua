---@type NvPluginSpec
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  keys = {
    {
      "<leader>uv",
      "<cmd>VenvSelect<cr>",
      desc = "Utils | Select Python venv",
      ft = "python",
      silent = true,
    },
  },
  main = "venv-selector",
}
