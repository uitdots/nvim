local g = vim.g

---@type LazySpec
return {
  "andymass/vim-matchup",
  event = {
    "BufRead",
    "BufNewFile",
  },
  init = function()
    g.loaded_matchit = 1
    g.matchup_matchparen_offscreen = {
      method = "", ---@type "status" | "popup" | "status_manual" | "scrolloff" | ""
    }
    g.matchup_matchparen_enabled = 0 ---@type 0 | 1 Toggle highlight
  end,
  ---@module 'match-up'
  ---@type matchup.Config
  opts = nil,
  config = true,
}
