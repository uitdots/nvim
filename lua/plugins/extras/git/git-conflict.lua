---@type NvPluginSpec
return {
  "akinsho/git-conflict.nvim",
  enabled = false, -- Use mini.diff because codecompanion use that
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = true,
}
