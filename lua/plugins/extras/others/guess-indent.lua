---@type LazySpec
return {
  "nmac427/guess-indent.nvim",
  cmd = "GuessIndent",
  ---TODO: Still not know make it run when entering file with `nvim file_name`
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>ui",
      "<cmd>GuessIndent<CR>",
      desc = "Utils | Fix Indent",
      silent = true,
    },
  },
  opts = {
    auto_cmd = false,
  },
}
