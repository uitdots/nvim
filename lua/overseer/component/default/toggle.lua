-- Toggle overseer on complete, it works but dont sure this is the best way

local overseer = require("overseer")

return {
  desc = "Toggle overseer on completed run",
  constructor = function(params)
    return {
      on_complete = function()
        overseer.toggle()
      end,
    }
  end,
}
