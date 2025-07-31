---@type LazySpec
return {
  "nvzone/showkeys",
  dependencies = "nvzone/volt",
  cmd = "ShowkeysToggle",
  keys = {
    {
      "<leader>uk",
      "<cmd>ShowkeysToggle<cr>",
      desc = "Utils | Showkey",
      silent = true,
    },
  },
  -- init = function()
  --   require("showkeys").open()
  -- end,
}
