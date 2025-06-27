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

  local adapter = get_executable("dapDebugServer.js", "packages/js-debug-adapter/js-debug/src")

  if adapter == nil then
    M.status = false
    return M.status
  end

  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        adapter,
        "${port}",
      },
    },
  }

  M.status = true
  return M.status
end

return M
