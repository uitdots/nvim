local dap = require("dap")
local cppdbg = require("configs.dap.adapters.cppdbg")
local is_executable = require("utils.executable").is_executable_cache
local dap_utils = require("configs.dap.utils")

local M = {}

---@type dap.Configuration[]
M.configurations = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = dap_utils.executable_picker,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "gdb",
    cwd = "${workspaceFolder}",
    program = dap_utils.executable_picker,
  },
}

function M.__call()
  if not is_executable("gdb") then
    return
  end
  local status = cppdbg()
  if status then
    dap.configurations.c = M.configurations
    dap.configurations.cpp = M.configurations
  end
end

return M
