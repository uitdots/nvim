---@type NvPluginSpec
return {
  "folke/ts-comments.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = true,
}
