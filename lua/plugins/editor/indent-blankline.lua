---@module "ibl"
---@type NvPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  ---@type ibl.config
  opts = {},
  main = "ibl",
}
