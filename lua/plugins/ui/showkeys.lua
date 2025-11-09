---@type LazySpec
return {
  "nvzone/showkeys",
  dependencies = "nvzone/volt",
  cmd = "ShowkeysToggle",
  keys = {
    {
      "<leader>uk",
      "<cmd>ShowkeysToggle<cr>",
      desc = "Showkey | Toggle",
      silent = true,
    },
  },
  -- init = function()
  --   require("showkeys").open()
  -- end,
}
