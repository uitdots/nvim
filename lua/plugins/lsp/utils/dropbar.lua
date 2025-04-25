---@type NvPluginSpec
return {
  "Bekaboo/dropbar.nvim",
  enabled = true,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    optional = true,
  },
}
