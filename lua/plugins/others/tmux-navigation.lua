local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "alexghergh/nvim-tmux-navigation",
  enabled = not filter_availabled_external or is_executable("tmux"),
  cond = vim.env.TMUX ~= nil,
  event = "VeryLazy",
  opts = {
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
      last_active = "<C-\\>",
      next = "<C-Space>",
    },
  },
}
