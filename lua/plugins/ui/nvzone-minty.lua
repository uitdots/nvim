---@type NvPluginSpec
return {
  "nvzone/minty",
  dependencies = {
    "nvzone/volt",
  },
  cmd = {
    "Shades",
    "Huefy",
  },
  keys = {
    {
      "<leader>uh",
      "<cmd>Huefy<cr>",
      desc = "Utils | Minty Huefy",
      silent = true,
    },
    {
      "<leader>us",
      "<cmd>Shades<cr>",
      desc = "Utils | Minty Shades",
      silent = true,
    },
  },
}
