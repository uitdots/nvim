-- FIXME: Huhm

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
      desc = "Copilot | Toggle Completion",
      silent = true,
    },
    {
      "<leader>ad",
      "<cmd>Copilot disable<cr>",
      desc = "Copilot | Disable Completion",
      silent = true,
    },
    {
      "<leader>ae",
      "<cmd>Copilot enable<cr>",
      desc = "Copilot | Enable Completion",
      silent = true,
    },
    {
      "<leader>aP",
      "<cmd>Copilot panel<cr>",
      desc = "Copilot | Toggle Panel",
      silent = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    vim.cmd("Copilot disable")
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
