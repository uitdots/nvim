---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@param opts PluginsOpts.TSConfig?
  opts = function(_, opts)
    opts = opts or {}
    opts.ensure_installed = opts.ensure_installed or {}
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(opts.ensure_installed, "d2")

    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        ---@diagnostic disable-next-line: inject-field, missing-fields
        require("nvim-treesitter.parsers").d2 = {
          ---@diagnostic disable-next-line: missing-fields
          install_info = {
            url = "https://github.com/ravsii/tree-sitter-d2",
            queries = "queries",
          },
        }
      end,
    })
    return opts
  end,
}
