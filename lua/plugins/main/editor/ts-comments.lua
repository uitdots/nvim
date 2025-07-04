---@type NvPluginSpec
return {
  "folke/ts-comments.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
  config = true,
}
