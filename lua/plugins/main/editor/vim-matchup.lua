---@type NvPluginSpec
return {
  "andymass/vim-matchup",
  enabled = true,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  init = function()
    vim.g.matchup_matchparen_offscreen = {
      method = "", ---@type "status" | "popup" | "status_manual" | "scrolloff" | ""
    }
    vim.g.matchup_matchparen_enabled = 0 ---@type 0 | 1 Disable matchup highlight because I don't like it
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true,
        enable_quotes = true,
      },
    },
  },
}
