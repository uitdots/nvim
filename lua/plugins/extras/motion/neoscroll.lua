---@type LazySpec
--NOTE: Smooth scrolling neovim plugin written in lua
return {
  "karb94/neoscroll.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    hide_cursor = false,
    duration_multiplier = 0.5, ---@type integer
    easing = "linear", ---@type "linear" | "quadratic" | "cubic" | "quartic" | "quintic" | "circular" | "sine"
  },
}
