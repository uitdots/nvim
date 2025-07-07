local executable_picker = require("utils.executable").executable_picker

local M = {}

---@return thread
function M.executable_picker()
  return coroutine.create(function(coro)
    executable_picker("Select executable to debug", function(selected_executable)
      coroutine.resume(coro, selected_executable)
    end)
  end)
end

return M
