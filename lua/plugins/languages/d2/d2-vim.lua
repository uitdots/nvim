local g = vim.g
---@type LazySpec
return {
  "terrastruct/d2-vim",
  ft = "d2",
  init = function()
    g.d2_fmt_autosave = 0
  end,
}
