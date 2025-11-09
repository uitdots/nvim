---@type LazySpec
return {
  "OXY2DEV/helpview.nvim",
  event = "VeryLazy", -- Using ft = "help" will not start it on the first time
  dependencies = "nvim-treesitter/nvim-treesitter",
}
