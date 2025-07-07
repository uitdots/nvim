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
  dependencies = "nvzone/volt",
}
