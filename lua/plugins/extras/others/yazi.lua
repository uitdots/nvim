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
      desc = "Yazi | Current File",
      mode = { "n", "v" },
    },
    {
      "<leader>fY",
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi | Current Dir",
    },
    {
      "<leader>fy",
      "<cmd>Yazi toggle<cr>",
      desc = "Yazi | Toggle",
    },
  },
  ---@module 'yazi'
  ---@type YaziConfig
  opts = nil,
  config = true,
}
