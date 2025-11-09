---@type LazySpec
return {
  "potamides/pantran.nvim",
  cmd = "Pantran",
  keys = {
    {
      "<leader>ut",
      function()
        return require("pantran").motion_translate({ mode = "hover" })
      end,
      desc = "Pantran | Hover",
      silent = true,
      expr = true,
      noremap = true,
      mode = { "n", "x" },
    },
    {
      "<leader>uT",
      function()
        return require("pantran").motion_translate()
      end,
      desc = "Pantran | Interactive",
      silent = true,
      expr = true,
      noremap = true,
      mode = { "n", "x" },
    },
  },
  opts = {
    default_engine = "google",
    engines = {
      google = {
        fallback = {
          default_target = "vi",
        },
      },
    },
    window = {
      window_config = {
        border = vim.o.winborder,
      },
    },
  },
}
