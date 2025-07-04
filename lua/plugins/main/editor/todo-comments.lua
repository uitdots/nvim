---@type NvPluginSpec
return {
  "folke/todo-comments.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>fT",
      "<cmd>TodoTelescope<cr>",
      desc = "Find | Todo",
      silent = true,
    },
    {
      "]<M-t>",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Todo | Next",
    },
    {
      "[<M-t>",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Todo | Prev",
    },
  },
  config = true,
}
