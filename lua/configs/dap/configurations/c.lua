local dap = require("dap")
local cppdbg = require("configs.dap.adapters.cppdbg")

local function program_path()
  return vim.fn.input({
    prompt = "Program path: ",
    default = vim.fn.getcwd() .. "/",
    completion = "file",
  })
end

local configurations = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = "${file}",
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
    program = program_path,
  },
}

return function()
  if not require("utils.executable").is_executable_cache("gdb") then
    return
  end
  if cppdbg() then
    dap.configurations.c = configurations
    dap.configurations.cpp = configurations
  end
end