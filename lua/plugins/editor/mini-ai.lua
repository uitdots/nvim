---@type NvPluginSpec
return {
  "echasnovski/mini.ai",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = true,
}
