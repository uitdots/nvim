---@type LazySpec
return {
  "SunnyTamang/select-undo.nvim",
  cmd = {
    "SelectUndoLine",
    "SelectUndoSweep",
    "SelectUndoPartial",
  },
  keys = {
    {
      "<leader>uul",
      function()
        require("select-undo").undo_selection("line")
      end,
      desc = "Undo | Line",
      mode = "x",
      silent = true,
    },
    {
      "<leader>uus",
      function()
        require("select-undo").undo_selection("sweep")
      end,
      desc = "Undo | Sweep",
      mode = "x",
      silent = true,
    },
    {
      "<leader>uup",
      function()
        require("select-undo").undo_selection("partial")
      end,
      desc = "Undo | Partial",
      mode = "x",
      silent = true,
    },
  },
  opts = {
    mapping = false,
  },
}
