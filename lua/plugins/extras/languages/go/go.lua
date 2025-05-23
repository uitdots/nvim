-- NOTE: I haven't setup it yet. Just put it here
local filter_availabled_external = UitVim.config.filter_availabled_external
local is_executable = require("utils.executable").is_executable

return {
  "ray-x/go.nvim",
  enabled = not filter_availabled_external or is_executable("go"),
  event = {
    "CmdlineEnter",
  },
  ft = {
    "go",
    "gomod",
  },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
}
