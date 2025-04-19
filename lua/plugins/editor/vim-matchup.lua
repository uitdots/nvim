---@type NvPluginSpec
return {
  "andymass/vim-matchup",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        enable_quotes = true,
      },
    },
  },
  event = "VeryLazy",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
