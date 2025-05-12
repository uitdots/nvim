require("core.globals")
require("core.env")
require("core.options")

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.core.lazy")

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
  },
  { import = "plugins" },
}, lazy_config)

require("nvchad.autocmds")
require("core.highlight")
require("core.filetypes")
require("core.keymaps")
require("core.commands")
require("core.autocmds")
