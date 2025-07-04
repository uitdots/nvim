-- TODO: If not use this... maybe remove this

---@module "ibl"
---@type NvPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = {
    "BufRead",
    "BufNewFile",
  },
  ---@type ibl.config
  opts = {},
  main = "ibl",
}
