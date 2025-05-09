local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "lambdalisue/vim-suda",
  cond = not is_windows,
  cmd = {
    "SudaWrite",
    "SudaRead",
  },
  keys = {
    {
      "<leader>u<C-s>",
      "<cmd>SudaWrite<cr>",
      desc = "Utils | SudaWrite",
    },
  },
}
