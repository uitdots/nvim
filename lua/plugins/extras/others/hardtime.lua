---@type NvPluginSpec
return {
  "m4xshen/hardtime.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "Hardtime",
  },
  opts = {},
}
