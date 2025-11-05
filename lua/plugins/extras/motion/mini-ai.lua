---@type LazySpec
return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  opts = function()
    local extra = require("mini.extra")
    return {
      custom_textobjects = {
        a = false,
        gG = extra.gen_ai_spec.buffer(),
      },
    }
  end,
  dependencies = "nvim-mini/mini.extra",
  specs = {
    {
      "folke/noice.nvim",

      ---@module 'noice'
      ---@type NoiceConfig
      ---@diagnostic disable-next-line: missing-fields
      opts = {
        routes = {
          -- https://github.com/nvim-mini/mini.nvim/issues/163
          {
            filter = {
              event = "msg_show",
              kind = "echomsg",
              find = "No textobject",
            },
            opts = {
              skip = true,
            },
          },
        },
      },
      opts_extend = {
        "routes",
      },
      optional = true,
    },
  },
}
