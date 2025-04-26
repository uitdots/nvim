---@type NvPluginSpec
return {
  "akinsho/git-conflict.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = true,
}
