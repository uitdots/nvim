local o = vim.o

---@type LazySpec
return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  init = function()
    o.foldcolumn = "1"
    o.foldlevel = 99
    o.foldlevelstart = 99
    o.foldenable = true
  end,
  ---@module 'nvim-origami'
  ---@type Origami.config
  opts = {
    foldKeymaps = {
      setup = false,
    },
  },
}
