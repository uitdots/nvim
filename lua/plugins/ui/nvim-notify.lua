---@type NvPluginSpec
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = false,
    background_colour = "#000000",
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
