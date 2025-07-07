---@type LazySpec
return {
  "tamton-aquib/duck.nvim",
  keys = {
    {
      "<leader>uD",
      function()
        vim.ui.select({ "hatch", "cook", "cook_all" }, {
          prompt = "Select Duck",
        }, function(selection)
          if selection == nil then
            return
          end
          require("duck")[selection]()
        end)
      end,
      desc = "Utils | Select Duck",
      silent = true,
    },
  },
}
