---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@param opts? PluginsOpts.TSConfig
  opts = function(_, opts)
    opts = opts or {}
    opts.ensure_installed = opts.ensure_installed or {}
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(opts.ensure_installed, "toml")

    require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
      local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
      local filename = vim.fn.fnamemodify(filepath, ":t")
      return string.match(filename, ".*mise.*%.toml$") ~= nil
    end, { force = true, all = false })
  end,
}
