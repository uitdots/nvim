---@type LazySpec
return {
  "potamides/pantran.nvim",
  cmd = "Pantran",
  keys = {
    {
      "<leader>ut",
      function()
        return require("pantran").motion_translate()
      end,
      desc = "Utils | Translate",
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
    command = {
      default_mode = "hover",
    },
    window = {
      window_config = {
        border = vim.o.winborder,
      },
    },
  },
}
