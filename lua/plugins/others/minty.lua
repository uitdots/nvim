---@type LazySpec
return {
  "nvzone/minty",
  cmd = {
    "Shades",
    "Huefy",
  },
  keys = {
    {
      "<leader>uh",
      "<cmd>Huefy<cr>",
      desc = "Minty | Huefy",
      silent = true,
    },
    {
      "<leader>us",
      "<cmd>Shades<cr>",
      desc = "Minty | Shades",
      silent = true,
    },
  },
  dependencies = "nvzone/volt",
}
