---@type NvPluginSpec
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = function(_, opts)
    opts = {
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 3000,
      top_down = false,
    }

    if require("nvconfig").base46.transparency then
      opts.background_colour = "#000000"
    end

    return opts
  end,
  config = function(_, opts)
    require("notify").setup(opts)

    vim.notify = require("notify")
  end,
}
