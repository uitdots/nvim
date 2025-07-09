---@type LazySpec
return {
  "akinsho/git-conflict.nvim",
  enabled = false, -- Use mini.diff because codecompanion use that
  event = "VeryLazy",
  config = true,
}
