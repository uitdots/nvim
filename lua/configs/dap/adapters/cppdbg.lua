local os_utils = require("utils.os")
local get_executable = require("utils.executable").get_executable
local DapAdapter = require("configs.dap.dap_adapter")

local M = DapAdapter.new()

function M:get_adapter()
  local adapter = get_executable("OpenDebugAD7", { masons = "packages/cpptools/extension/debugAdapters/bin" })
  ---@cast adapter string?
  return adapter
end

function M:setup(adapter)
  self.dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = adapter,
    options = {
      detached = os_utils.is_windows and false or nil,
    },
  }
end

return M
