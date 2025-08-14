---@type LazySpec
return {
  "jmbuhr/otter.nvim",
  event = "VeryLazy",
  ---@module 'otter'
  ---@type OtterConfig
  opts = {},
  dependencies = "nvim-treesitter/nvim-treesitter",
}
