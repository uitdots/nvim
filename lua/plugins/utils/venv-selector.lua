---@type NvPluginSpec
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  keys = {
    {
      "<leader>vs",
      "<cmd>VenvSelect<cr>",
      desc = "Venv Selector | Select Python venv",
      ft = "python",
      silent = true,
    },
  },
  config = function(_, opts)
    require("venv-selector").setup(opts)
  end,
}
