---@type LazySpec
return {
  "andymass/vim-matchup",
  event = {
    "BufRead",
    "BufNewFile",
  },
  init = function()
    vim.g.matchup_matchparen_offscreen = {
      method = "", ---@type "status" | "popup" | "status_manual" | "scrolloff" | ""
    }
    vim.g.matchup_matchparen_enabled = 0 ---@type 0 | 1 Toggle highlight
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        matchup = {
          enable = true,
          enable_quotes = true,
        },
      },
    },
  },
}
