---@type LazySpec
return {
  "cenk1cenk2/jq.nvim",
  keys = {
    {
      "<leader>qq",
      function()
        require("jq").run({
          toggle = true,
        })
      end,
      desc = "Query | Query",
      ft = {
        "bigfile", -- Bruh
        "helm",
        "helmchart",
        "json",
        "jsonc",
        "yaml",
        "yaml.github",
        "yaml.helm-values",
      },
    },
  },
  opts = {
    {
      toggle = true,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "grapp-dev/nui-components.nvim",
  },
}
