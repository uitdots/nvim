local dap = require("dap")
local cppdbg = require("configs.dap.adapters.cppdbg")
local is_executable = require("utils.executable").is_executable_cache
local executable_picker = require("utils.executable").executable_picker

local M = {}

---@private
function M.executable_picker()
  return coroutine.create(function(coro)
    executable_picker("Select executable to debug", function(selected_executable)
      coroutine.resume(coro, selected_executable)
    end)
  end)
end

M.configurations = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = M.executable_picker,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "gdb", -- TODO: Check does it need full path
    cwd = "${workspaceFolder}",
    program = M.executable_picker,
  },
}

function M.setup()
  if not is_executable("gdb") then
    return
  end
  local status = cppdbg.setup()
  if status then
    dap.configurations.c = M.configurations
    dap.configurations.cpp = M.configurations
  end
end

return M
