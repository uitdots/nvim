---@type LazySpec
return {
  "andymass/vim-matchup",
  event = "VeryLazy",
  init = function()
    vim.g.matchup_matchparen_offscreen = {
      method = "", ---@type "status" | "popup" | "status_manual" | "scrolloff" | ""
    }
    vim.g.matchup_matchparen_enabled = 0 ---@type 0 | 1 Toggle highlight
  end,
}
