-- NOTE: I haven't setup it yet. Just put it here
local is_executable = require("utils.executable").is_executable

return {
  "ray-x/go.nvim",
  enabled = is_executable("go"),
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
