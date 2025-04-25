---@type NvPluginSpec
return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fT",
      "<cmd>TodoTelescope<cr>",
      desc = "Find | Todo",
      silent = true,
    },
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Todo | Next",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Todo | Prev",
    },
  },
  config = true,
}
