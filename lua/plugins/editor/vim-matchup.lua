---@type NvPluginSpec
return {
  "andymass/vim-matchup",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true,
        enable_quotes = true,
      },
    },
  },
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  init = function()
    vim.g.matchup_matchparen_offscreen = {
      method = "", ---@type "status" | "popup" | "status_manual" | "scrolloff" | ""
    }
  end,
}
