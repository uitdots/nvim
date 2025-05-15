local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "mikavilpas/yazi.nvim",
  enabled = is_executable("yazi"),
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
