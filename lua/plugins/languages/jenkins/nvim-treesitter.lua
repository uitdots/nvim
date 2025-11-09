---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@param opts TSConfig?
  ---@return TSConfig?
  opts = function(_, opts)
    vim.treesitter.language.register("groovy", "jenkins")
    return opts
  end,
}
