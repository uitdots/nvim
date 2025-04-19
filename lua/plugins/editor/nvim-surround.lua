---@type NvPluginSpec
return {
  "kylechui/nvim-surround",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = true,
}
