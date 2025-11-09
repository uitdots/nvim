---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@param opts TSConfig?
  ---@return TSConfig
  opts = function(_, opts)
    vim.treesitter.language.register("xml", {
      "xaml",
      "plist",
    })

    opts = opts or {}
    if opts.ensure_installed then
      opts.ensure_installed[#opts.ensure_installed + 1] = "xml"
    else
      opts.ensure_installed = { "xml" }
    end
    return opts
  end,
}
