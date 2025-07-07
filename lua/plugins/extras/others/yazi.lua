local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  enabled = not filter_availabled_external or is_executable("yazi"),
  keys = {
    {
      "<leader>f<C-y>",
      "<cmd>Yazi<cr>",
      desc = "File | Yazi Current File",
      mode = { "n", "v" },
    },
    {
      "<leader>fY",
      "<cmd>Yazi cwd<cr>",
      desc = "File | Yazi Current Dir",
    },
    {
      "<leader>fy",
      "<cmd>Yazi toggle<cr>",
      desc = "File | Yazi",
    },
  },
  ---@module 'yazi'
  ---@type YaziConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {},
}
