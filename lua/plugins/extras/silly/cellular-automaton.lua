---@type LazySpec
return {
  "eandrju/cellular-automaton.nvim",
  cmd = "CellularAutomaton",
  keys = {
    {
      "<leader>uc",
      function()
        vim.ui.select({ "scramble", "game_of_life", "make_it_rain" }, {
          prompt = "Select Cellular Automaton",
        }, function(selection)
          if selection == nil then
            return
          end
          vim.cmd("CellularAutomaton " .. selection)
        end)
      end,
      desc = "Utils | Select CellularAutomaton",
      silent = true,
    },
  },
}
