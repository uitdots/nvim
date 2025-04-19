---@type NvPluginSpec
return {
  "aznhe21/actions-preview.nvim",
  opts = function(_, opts)
    opts.highlight_command = vim.g.is_windows and nil or { require("actions-preview.highlight").delta() }
    return opts
  end,
}
