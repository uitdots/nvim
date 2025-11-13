---@type LazySpec
return {
  "DNLHC/glance.nvim",
  cmd = "Glance",
  keys = {
    {
      "gd",
      "<cmd>Glance definitions<CR>",
      desc = "LSP | Definitions",
      silent = true,
    },
    {
      "gri",
      "<cmd>Glance implementations<CR>",
      desc = "LSP | Implementations",
      silent = true,
    },
    {
      "grr",
      "<cmd>Glance references<CR>",
      desc = "LSP | References",
      silent = true,
    },
    {
      "grt",
      "<cmd>Glance type_definitions<CR>",
      desc = "LSP | Type Definitions",
      silent = true,
    },
  },
  ---@module 'glance'
  ---@type GlanceOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    theme = {
      enable = false,
    },
  },
  specs = {
    {
      "folke/trouble.nvim",
      specs = {
        {
          "DNLHC/glance.nvim",
          ---@type GlanceOpts
          ---@diagnostic disable-next-line: missing-fields
          opts = {
            use_trouble_qf = true,
          },
        },
      },
      optional = true,
    },
  },
}
