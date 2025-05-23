local filter_availabled_external = UitVim.config.filter_availabled_external
local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "alexghergh/nvim-tmux-navigation",
  enabled = not filter_availabled_external or is_executable("tmux"),
  event = vim.env.TMUX ~= nil and "VeryLazy" or nil,
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
