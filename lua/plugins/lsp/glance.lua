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
  ---@param opts GlanceOpts
  ---@return GlanceOpts
  opts = function(_, opts)
    opts = opts or {}
    local actions = require("glance").actions

    ---@type GlanceOpts
    ---@diagnostic disable-next-line: missing-fields
    local _opts = {
      ---@diagnostic disable-next-line: missing-fields
      theme = {
        enable = false,
      },
      ---@diagnostic disable-next-line: missing-fields
      mappings = {
        list = {
          ["<C-f>"] = actions.preview_scroll_win(10),
          ["<C-b>"] = actions.preview_scroll_win(-10),
        },
      },
    }
    return vim.tbl_deep_extend("force", opts, _opts)
  end,
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
