---@type NvPluginSpec
return {
  "overleaf/vim-env-syntax",
  enabled = false,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
}
