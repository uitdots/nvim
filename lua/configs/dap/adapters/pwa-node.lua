---@class PwaNodeDapAdapter
---@field _status boolean|nil
local M = {}
M.__index = M

M.dap = require("dap")

---@param self PwaNodeDapAdapter
---@return boolean
function M:setup()
  if self._status ~= nil then
    return self._status
  end

  local finder = require("utils.executable").get_executable
  local path = finder("dapDebugServer.js", { masons = "packages/js-debug-adapter/js-debug/src" })
  if type(path) ~= "string" or path == "" then
    self._status = false
    return false
  end

  self.dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { path, "${port}" },
    },
  }

  self._status = true
  return true
end

return setmetatable(M, {
  __call = function(self)
    return self:setup()
  end,
})
