---@type NvPluginSpec
return {
  "cenk1cenk2/jq.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "grapp-dev/nui-components.nvim",
  },
  keys = {
    {
      "<leader>qq",
      function()
        require("jq").run({
          toggle = true,
        })
      end,
      desc = "Query API | Query",
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
      commands = {
        {
          command = "jq",
          filetype = "json",
          arguments = "-r",
        },
      },
    },
  },
}
