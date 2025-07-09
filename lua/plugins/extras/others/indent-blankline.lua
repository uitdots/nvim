---NOTE: Use snacks already

---@module "ibl"
---@type LazySpec
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "VeryLazy",
  ---@type ibl.config
  opts = {},
  main = "ibl",
}
