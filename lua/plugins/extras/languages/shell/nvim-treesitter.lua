---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@param opts TSConfig?
  ---@return TSConfig
  opts = function(_, opts)
    vim.treesitter.language.register("bash", "zsh")

    opts = opts or {}
    if opts.ensure_installed then
      opts.ensure_installed[#opts.ensure_installed + 1] = "bash"
    else
      opts.ensure_installed = { "bash" }
    end
    return opts
  end,
}
