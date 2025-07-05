local os_utils = require("utils.os")
local get_executable = require("utils.executable").get_executable
local dap = require("dap")

local M = {}

---@type boolean?
M.status = nil

---@return boolean
function M.setup()
  if M.status ~= nil then
    return M.status
  end

  local adapter = get_executable("OpenDebugAD7", { mason = "packages/cpptools/extension/debugAdapters/bin" })

  if adapter == nil then
    M.status = false
    return M.status
  end

  dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = adapter,
    options = {
      detached = os_utils.is_windows and false or nil,
    },
  }

  M.status = true
  return M.status
end

return M
