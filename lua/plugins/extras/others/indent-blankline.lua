---NOTE: Use snacks already

---@module "ibl"
---@type LazySpec
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
