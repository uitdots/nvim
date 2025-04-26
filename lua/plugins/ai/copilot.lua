---@type NvPluginSpec
return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  build = ":Copilot auth",
  cmd = "Copilot",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>at",
      "<cmd>Copilot toggle<cr>",
      desc = "AI | Toggle Copilot Completion",
      silent = true,
    },
    {
      "<leader>aP",
      "<cmd>Copilot panel<cr>",
      desc = "AI | Toggle Copilot Panel",
      silent = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    require("copilot.command").disable()
  end,
  dependencies = {
    "saghen/blink.cmp",
    optional = true,
    ---@module 'blink-cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = {
          "copilot",
        },
        -- NOTE: If you custom blink source for more per_filetype, you have to declare here, and below "opts_extend"
        per_filetype = {
          lua = { "copilot" },
          sql = { "copilot" },
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
    opts_extend = {
      "sources.default",
      "sources.per_filetype.lua",
      "sources.per_filetype.sql",
    },
    dependencies = {
      "fang2hou/blink-copilot",
    },
  },
}
