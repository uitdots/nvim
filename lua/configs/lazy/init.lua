local lazypath = string.format("%s/lazy/lazy.nvim", vim.fn.stdpath("data"))

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    optional = true,
  },
  {
    import = "plugins.init",
  },
}, require("configs.lazy.config"))
