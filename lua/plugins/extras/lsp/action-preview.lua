local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "aznhe21/actions-preview.nvim",
  opts = function(_, opts)
    opts.highlight_command = is_windows and nil or { require("actions-preview.highlight").delta() }
    return opts
  end,
}
