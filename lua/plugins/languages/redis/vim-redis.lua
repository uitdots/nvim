---@type LazySpec
return {
  "junegunn/vim-redis",
  lazy = false,
  init = function()
    vim.g.loaded_vim_redis = 1
  end,
}
